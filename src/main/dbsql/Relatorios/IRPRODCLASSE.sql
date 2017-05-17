select gru.id as idgrupo, gru.descricao as grupo, cla.id as idclasse, cla.descricao as classe
from ps_classe cla, ps_grupo gru
where cla.id >= $P{IDCLASSE_INICIAL}
  and cla.id <= $P{IDCLASSE_FINAL}
  and cla.datacreate >= $P{DATACADASTRO_INICIAL}
  and cla.datacreate <= $P{DATACADASTRO_FINAL}
  and cla.id > 0
  and gru.id > 0
  and cla.idgrupo = gru.id
order by gru.descricao, cla.descricao