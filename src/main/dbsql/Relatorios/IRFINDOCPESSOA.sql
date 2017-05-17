select pes.nomerazaosocial, pdoc.cpfcnpj, doc.numero, coalesce(doc.serie, 0) as serie, doc.desdobramento, doc.dataemissao, doc.datavencimento, doc.datapagamento,
  doc.valortotal, doc.valordesconto, doc.valorjuros
from fin_documento doc, pes_definicao def, pes_pessoa pes, pes_documento pdoc
where doc.iddefinicao >= $P{IDDEFINICAO_INICIAL}
  and doc.iddefinicao <= $P{IDDEFINICAO_FINAL}
  and doc.dataemissao >= $P{DATAEMISSAO_INICIAL}
  and doc.dataemissao <= $P{DATAEMISSAO_FINAL}
  and coalesce(doc.datapagamento, current_date) >= $P{DATAPAGAMENTO_INICIAL}
  and coalesce(doc.datapagamento, current_date) <= $P{DATAPAGAMENTO_FINAL}
  and case when doc.datapagamento is not null then true else false end = $P{BAIXADO}
  and doc.datavencimento >= $P{DATAVENCIMENTO_INICIAL}
  and doc.datavencimento <= $P{DATAVENCIMENTO_FINAL}
  and doc.iddocumento is null
  and doc.iddefinicao = def.id
  and def.idpessoa = pes.id
  and pdoc.idpessoa = pes.id
order by pes.nomerazaosocial, doc.dataemissao, doc.datavencimento, doc.datapagamento