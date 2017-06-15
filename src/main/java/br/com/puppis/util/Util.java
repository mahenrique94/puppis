package br.com.puppis.util;

import java.util.Calendar;

import br.com.mhc.function.DateFunction;
import br.com.puppis.model.FinDocumento;

public class Util {

	public Calendar calcularDataVencimento(FinDocumento finDocumento, int numeroParcela) {
		if (finDocumento.getIdformapagamento().getDescricao().startsWith("CREDITO") || finDocumento.getIdformapagamento().getDescricao().startsWith("FINANCIAMENTO"))
			return DateFunction.setMonthInDate(finDocumento.getDataemissao(), numeroParcela);
		return DateFunction.setDaysInDate(finDocumento.getDataemissao(), (finDocumento.getIdformapagamento().getIntervalo() * numeroParcela));
	}
	
}
