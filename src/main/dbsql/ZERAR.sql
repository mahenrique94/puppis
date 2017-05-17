-- NOTA
delete from com_notacusto;
delete from com_notaitem;
delete from com_nota;

-- FINANCEIRO
delete from fin_extrato;
delete from fin_documentocentrocusto;
delete from fin_documento;

-- MOVIMENTAÇÃO
delete from ps_movimentosaldo;
delete from ps_movimentoitem;
delete from ps_movimento;

-- TABELA DE PREÇO
delete from tbl_precovaloroutros;
delete from tbl_precovalor;
delete from tbl_precopessoa;
delete from tbl_preco;

-- PRODUTO
delete from ps_estoque;
delete from ps_custo;
delete from ps_composicao;
delete from ps_produtoservico where id > 0;
delete from ps_classe where id > 0;
delete from ps_grupo where id > 0;

-- PESSOA
delete from pes_definicao where id > 0;
delete from pes_contato;
delete from pes_endereco;
delete from pes_documento;
delete from pes_pessoa where id > 0;

-- CADASTRO
delete from fin_historico where id > 0;
delete from cad_centrocusto where id > 0;