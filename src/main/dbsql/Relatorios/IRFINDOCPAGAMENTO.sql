select pag.descricao, pes.nomerazaosocial, doc.numero, coalesce(doc.serie, 0) as serie, doc.desdobramento, doc.dataemissao, doc.datavencimento, doc.datapagamento,
  doc.valortotal, doc.valordesconto, doc.valorjuros
from fin_documento doc, fin_formapagamento pag, pes_definicao def, pes_pessoa pes
where doc.idformapagamento >= $P{IDFORMAPAGAMENTO_INICIAL}
  and doc.idformapagamento <= $P{IDFORMAPAGAMENTO_FINAL}
  and doc.dataemissao >= $P{DATAEMISSAO_INICIAL}
  and doc.dataemissao <= $P{DATAEMISSAO_FINAL}
  and coalesce(doc.datapagamento, current_date) >= $P{DATAPAGAMENTO_INICIAL}
  and coalesce(doc.datapagamento, current_date) <= $P{DATAPAGAMENTO_FINAL}
  and case when doc.datapagamento is not null then true else false end = $P{BAIXADO}
  and doc.datavencimento >= $P{DATAVENCIMENTO_INICIAL}
  and doc.datavencimento <= $P{DATAVENCIMENTO_FINAL}
  and doc.iddocumento is null
  and doc.idformapagamento = pag.id
  and doc.iddefinicao = def.id
  and def.idpessoa = pes.id
order by pag.descricao, doc.dataemissao, doc.datavencimento, doc.datapagamento