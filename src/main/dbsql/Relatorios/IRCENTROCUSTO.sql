select cus.descricao, cusm.descricao as master
from cad_centrocusto cus, cad_centrocusto cusm
where cus.datacreate >= $P{DATACADASTRO_INICIAL}
  and cus.datacreate <= $P{DATACADASTRO_FINAL}
  and cus.id > 0
  and cus.idcentrocustomaster = cusm.id
order by cus.id, cus.idcentrocustomaster