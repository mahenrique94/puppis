select pes.id, max(pes.nomerazaosocial) as nomerazaosocial, max(pes.datacreate) as datacreate, max(pes.apelido) as apelido,
  max(case when pes.inativo = 'F' then 'ATIVO' else 'INATIVO' end) as inativo,
  max(pdoc.cpfcnpj) as cpfcnpj, max(pdoc.rginscricaoestadual) as rginscricaoestadual, max(pdoc.cnh) as cnh,
  max(pestc.descricao) as estadocivil,
  max(psex.descricao) as sexo,
  max(pend.rua) as rua, max(pend.numero) as numero, max(pend.cep) as cep, max(pend.bairro) as bairro, max(pend.complemento) as complemento,
  max(pais.descricao) as pais,
  max(est.descricao) as uf,
  max(cid.descricao) as cidade,
  max(ptip.descricao) as tipopessoa
from pes_pessoa pes, pes_definicao pdef, pes_endereco pend, pes_documento pdoc, pes_tipo ptip, pes_sexo psex, pes_estadocivil pestc,
  cad_pais pais, cad_estado est, cad_cidade cid
where pes.id >= $P{IDPESSOA_INICIAL}
  and pes.id <= $P{IDPESSOA_FINAL}
  and pes.datacreate >= $P{DATACADASTRO_INICIAL}
  and pes.datacreate <= $P{DATACADASTRO_FINAL}
  and pes.inativo = $P{INATIVO}
  and pes.idsexo = psex.id
  and pes.idestadocivil = pestc.id
  and pdef.idpessoa = pes.id
  and pdef.idtipo = ptip.id
  and pend.idpessoa = pes.id
  and pend.idcidade = cid.id
  and pdoc.idpessoa = pes.id
  and cid.idestado = est.id
  and est.idpais = pais.id
group by pes.id
order by pes.nomerazaosocial