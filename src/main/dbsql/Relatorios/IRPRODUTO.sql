select gru.descricao as grupo, cla.descricao as classe, prod.descricao produto, prod.marca, prod.codigobarra, uni.unidade, prod.observacao,
  cus.valor, cus.valormin, cus.valormax, est.quantidade, est.quantidademin, est.quantidademax
from ps_produtoservico prod, ps_custo cus, ps_estoque est, ps_classe cla, ps_grupo gru, ps_unidademedida uni
where prod.id >= $P{IDPRODUTO_INICIAL}
  and prod.id <= $P{IDPRODUTO_FINAL}
  and prod.datacreate >= $P{DATACADASTRO_INICIAL}
  and prod.datacreate <= $P{DATACADASTRO_FINAL}
  and prod.inativo = $P{INATIVO}
  and prod.idclasse = cla.id
  and prod.idunidademedida = uni.id
  and cus.idprodutoservico = prod.id
  and est.idprodutoservico = prod.id
  and cla.idgrupo = gru.id
order by prod.descricao