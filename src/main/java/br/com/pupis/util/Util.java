package br.com.pupis.util;

import java.util.Calendar;

import br.com.mhc.function.DateFunction;
import br.com.pupis.model.FinDocumento;

public class Util {

	public Calendar calcularDataVencimento(FinDocumento finDocumento, int numeroParcela) {
		if (finDocumento.getIdformapagamento().getDescricao().startsWith("CREDITO") || finDocumento.getIdformapagamento().getDescricao().startsWith("FINANCIAMENTO"))
			return DateFunction.setMonthInDate(finDocumento.getDataemissao(), numeroParcela);
		else
			return DateFunction.setDaysInDate(finDocumento.getDataemissao(), finDocumento.getIdformapagamento().getIntervalo());
	}
	
}
