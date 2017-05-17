select pcon.nome, pcon.ddd, pcon.telefone, pcon.celular, pcon.email
from pes_contato pcon
where pcon.idpessoa = $P{IDPESSOA}