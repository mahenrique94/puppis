-- Função para fazer calculo da tabela de preço dos produtos no lançamento de vendas,
-- realizado cálculo via banco para caso os diferentes cálculos entre clientes sejam customizados apenas na function,
-- evitando gambiarras no sistema
create or replace function fn_calcularTabelaPreco(idNotaItem_in bigint) returns numeric(10, 2) as $$
declare
  v_idNota bigint;
  v_idProdutoServico integer;
  v_idDefinicao bigint;
  v_idDefinicaoPadrao bigint = 0;
  v_idTabelaPrecoPessoa integer;
  v_valor numeric(10, 2) = 0.0;
  v_valorPromocao numeric(10, 2) = 0.0;
  v_valorParcelamento numeric(10, 2) = 0.0;
  v_valorFaturado numeric(10, 2) = 0.0;
  v_valorDesconto numeric(10, 2) = 0.0;
  v_valorTotalOutros numeric(10, 2) = 0.0;
  v_valorProduto numeric(10, 2) = 0.0;
  v_formaPagamento varchar(30);
  v_porcDesconto numeric(10, 2) = 0.0;
  v_totalNota numeric(10, 2) = 0.0;
  v_FATOR integer = 100;
  v_rowTblValorOutros tbl_precovaloroutros%rowtype;
  v_rowNotaItens com_notaitem%rowtype;
begin
  -- Encontrando ID do produto ou servico e ID da definição utilizada na nota
  select ite.idprodutoservico, nota.iddefinicao, nota.id 
  into v_idProdutoServico, v_idDefinicao, v_idNota
  from com_notaitem ite, com_nota nota
  where ite.idnota = nota.id
    and ite.id = idNotaItem_in;

  -- Buscando tabela de preço de acordo com definição e produto
  select tblpes.id
  into v_idTabelaPrecoPessoa
  from tbl_precopessoa tblpes, tbl_preco tbl
  where tblpes.idtabelapreco = tbl.id
    and tblpes.iddefinicao = v_idDefinicao
    and tbl.idprodutoservico = v_idProdutoServico;

  -- Verificando se encontrou uma tabela para o cliente da nota,
  -- caso não tenha encontrado vou buscar o cliente padrão
  if v_idTabelaPrecoPessoa is null then
    begin
      select tblpes.id, tblpes.iddefinicao
      into v_idTabelaPrecoPessoa, v_idDefinicao
      from tbl_precopessoa tblpes, tbl_preco tbl
      where tblpes.idtabelapreco = tbl.id
        and tblpes.iddefinicao = v_idDefinicaoPadrao
        and tbl.idprodutoservico = v_idProdutoServico;
    end;
  end if;

  -- Buscando tabela de preço pelo cliente da nota ou padrão caso não tenha o cliente específico
  if v_idTabelaPrecoPessoa is not null then
    begin
      select tblvalor.valor, tblvalor.valorpromocao, tblvalor.valordesconto, tblvalor.valorparcelamento, tblvalor.valorfaturado
      into v_valor, v_valorPromocao, v_valorDesconto, v_valorParcelamento, v_valorFaturado
      from tbl_precovalor tblvalor, tbl_precopessoa tblpes, tbl_preco tbl
      where tblvalor.idtabelaprecopessoa = tblpes.id
        and tblpes.idtabelapreco = tbl.id
        and tblpes.id = v_idTabelaPrecoPessoa
        and tblvalor.datavigenciainicial <= current_timestamp
        and tblvalor.datavigenciafinal >= current_timestamp;                
    end;
  end if;

  -- Verificando qual valor pegar
  -- Regras: Se a tabela tem valor de promoção então deve-se utilizar ele,
  --         se a venda tem porcentagem de desconto então deve-se pegar o valor de desconto,
  --         se é uma venda parcelada(CREDITO) então deve-se pegar o valor de parcelamento,
  --         se é uma venda faturada(FATURADO) então deve-se pegar o valor faturado,
  --         caso a tabela não possuia nenhum desses valores então deve-se usar o valor normal para qualquer venda
  v_valorProduto = v_valor;

  -- Verificando se é para usar valor promoção
  if v_valorPromocao > 0 then
    v_valorProduto = v_valorPromocao;
  end if;

  -- Verificando se é para calcular valor de desconto
  select ite.porcdesconto
  into v_porcDesconto
  from com_notaitem ite
  where ite.id = idNotaItem_in;

  if v_porcDesconto > 0 then
    begin
      if v_valorDesconto > 0 then
        v_valorProduto = v_valorDesconto - ((v_porcDesconto / v_FATOR) * v_valorDesconto);
      else
        v_valorProduto = v_valor - ((v_porcDesconto / v_FATOR) * v_valor);
      end if;
    end;
  end if;

  -- Verificando se é para usar valor de parcelamento
  if v_valorParcelamento > 0 then
    begin
      select pag.descricao
      into v_formaPagamento
      from com_notaitem ite, com_nota nota, com_notacusto cust, fin_formapagamento pag
      where ite.idnota = nota.id
        and ite.id = idNotaItem_in
        and cust.idnota = nota.id
        and cust.idformapagamento = pag.id
        and pag.descricao like 'CREDITO%';
        
        if v_formaPagamento is not null then
          v_valorProduto = v_valorParcelamento;
        end if;
        
    end;
  end if;

  -- Verificando se é para usar valor de faturamento
  if v_valorFaturado > 0 then
    begin
      select pag.descricao
      into v_formaPagamento
      from com_notaitem ite, com_nota nota, com_notacusto cust, fin_formapagamento pag
      where ite.idnota = nota.id
        and ite.id = idNotaItem_in
        and cust.idnota = nota.id
        and cust.idformapagamento = pag.id
        and pag.descricao like 'FATURADO%';
        
        if v_formaPagamento is not null then
          v_valorProduto = v_valorFaturado;
        end if;
        
    end;
  end if;

  -- Buscando por valores adicionais informados na tabela de preço,
  -- caso exista valores será somado todos eles e adicionado no valor final do produto
  for v_rowTblValorOutros in
    select tblout.* 
    from tbl_precovaloroutros tblout, tbl_precopessoa tblpes, tbl_preco tbl
    where tblout.idtabelaprecopessoa = tblpes.id
      and tblpes.idtabelapreco = tbl.id
      and tbl.id = v_idTabelaPrecoPessoa      
  loop
    v_valorTotalOutros = v_valorTotalOutros + v_rowTblValorOutros.valor;
  end loop;

  v_valorProduto = v_valorProduto + v_valorTotalOutros;

  if v_valorProduto > 0 then
    begin
      update com_notaitem set idtabelaprecopessoa = v_idTabelaPrecoPessoa, valorunitario = v_valorProduto where id = idNotaItem_in;      
    end;
  end if;

-- Somando todos os itens para atualizar o valor total da nota
  for v_rowNotaItens in
    select ite.*
    from com_notaitem ite where ite.idnota = v_idNota
  loop
    v_totalNota = v_totalNota + (v_rowNotaItens.quantidade * v_rowNotaItens.valorunitario);
  end loop;

  if v_totalNota > 0 then
    begin
      update com_notacusto set valortotal = v_totalNota where idnota = v_idNota;
    end;
  end if;

  return v_valorProduto;
end;
$$ language plpgsql volatile returns null on null input;