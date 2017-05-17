select gru.id, gru.descricao
from ps_grupo gru
where gru.datacreate >= $P{DATACADASTRO_INICIAL}
  and gru.datacreate <= $P{DATACADASTRO_FINAL}
  and gru.id > 0
order by gru.descricao