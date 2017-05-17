select ext.datacreate, pes.nomerazaosocial, ptip.descricao as tipo, ext.numerodocumento, ope.descricao as operacao,
  case ext.creditodebito when 'C' then 'CREDITO' else 'DEBITO' end as creditodebito, ext.historico, ext.valor
from fin_extrato ext, pes_definicao def, pes_pessoa pes, fin_contabancaria cont, sys_tipooperacao ope, pes_tipo ptip
where ext.datacreate >= $P{DATA_INICIAL}
  and ext.datacreate <= $P{DATA_FINAL}
  and ext.creditodebito <> $P{CREDITODEBITO}
  and ext.iddefinicao = def.id
  and ext.idcontabancaria = cont.id
  and ext.idtipooperacao = ope.id
  and def.idpessoa = pes.id
  and def.idtipo = ptip.id
order by ext.id