select ptip.descricao
from pes_definicao def, pes_tipo ptip
where def.idpessoa = $P{IDPESSOA}
  and def.idtipo = ptip.id