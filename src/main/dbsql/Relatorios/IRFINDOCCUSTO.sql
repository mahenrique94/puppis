select custo.descricao, pes.nomerazaosocial, doc.numero, coalesce(doc.serie, 0) as serie, doc.desdobramento, doc.dataemissao, doc.datavencimento, doc.datapagamento,
  doc.valortotal, doc.valordesconto, doc.valorjuros
from fin_documento doc, fin_documentocentrocusto doccusto, pes_definicao def, pes_pessoa pes, cad_centrocusto custo
where doc.dataemissao >= $P{DATAEMISSAO_INICIAL}
  and doc.dataemissao <= $P{DATAEMISSAO_FINAL}
  and coalesce(doc.datapagamento, current_date) >= $P{DATAPAGAMENTO_INICIAL}
  and coalesce(doc.datapagamento, current_date) <= $P{DATAPAGAMENTO_FINAL}
  and case when doc.datapagamento is not null then true else false end = $P{BAIXADO}
  and doc.datavencimento >= $P{DATAVENCIMENTO_INICIAL}
  and doc.datavencimento <= $P{DATAVENCIMENTO_FINAL}
  and doc.iddocumento is null
  and doccusto.idcentrocusto >= $P{IDCENTROCUSTO_INICIAL}
  and doccusto.idcentrocusto <= $P{IDCENTROCUSTO_FINAL}
  and doc.iddefinicao = def.id
  and doccusto.iddocumento = doc.id
  and doccusto.idcentrocusto = custo.id
  and def.idpessoa = pes.id
order by custo.descricao, doc.dataemissao, doc.datavencimento, doc.datapagamento