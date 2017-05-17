select tip.descricao as tipo, mov.nrodocumento, mov.datacreate, prod.descricao, uni.unidade, sal.quantidade, sal.saldoanterior, sal.saldoatual
from ps_movimento mov, ps_movimentoitem ite, ps_movimentosaldo sal, ps_produtoservico prod, ps_movimentotipo tip, ps_unidademedida uni
where mov.datacreate >= $P{DATA_INICIAL}
  and mov.datacreate <= $P{DATA_FINAL}
  and mov.idmovimentotipo >= $P{IDMOVIMENTOTIPO_INICIAL}
  and mov.idmovimentotipo <= $P{IDMOVIMENTOTIPO_FINAL}
  and ite.idprodutoservico >= $P{IDPRODUTO_INICIAL}
  and ite.idprodutoservico <= $P{IDPRODUTO_FINAL}
  and mov.idmovimentotipo = tip.id
  and ite.idprodutoservico = prod.id
  and ite.idmovimento = mov.id
  and sal.idmovimentoitem = ite.id
  and prod.idunidademedida = uni.id
order by mov.datacreate