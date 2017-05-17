select prod.descricao as produto, pes.nomerazaosocial, tval.valor, tval.valorpromocao, tval.valordesconto, tval.valorparcelamento, tval.valorfaturado,
  tval.datavigenciainicial, tval.datavigenciafinal, tval.inativo, tpes.id as idtabelaprecopessoa
from tbl_preco tbl, tbl_precopessoa tpes, tbl_precovalor tval, pes_definicao def, pes_pessoa pes, ps_produtoservico prod
where tbl.idprodutoservico >= $P{IDPRODUTO_INICIAL}
  and tbl.idprodutoservico <= $P{IDPRODUTO_FINAL}
  and tpes.iddefinicao >= $P{IDDEFINICAO_INICIAL}
  and tpes.iddefinicao <= $P{IDDEFINICAO_FINAL}
  and tval.datavigenciainicial >= $P{DATA_INICIAL}
  and tval.datavigenciafinal >= $P{DATA_FINAL}
  and tbl.idprodutoservico = prod.id
  and tpes.idtabelapreco = tbl.id
  and tpes.iddefinicao = def.id
  and tval.idtabelaprecopessoa = tpes.id
  and def.idpessoa = pes.id
order by prod.descricao, pes.nomerazaosocial

select tout.descricao, tout.valor
from tbl_precovaloroutros tout
where tout.idtabelaprecopessoa = $P{IDTABELAPRECOPESSOA}
order by tout.descricao