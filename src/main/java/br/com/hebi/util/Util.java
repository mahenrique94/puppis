package br.com.hebi.util;

import java.util.Calendar;

import br.com.hebi.model.FinDocumento;
import br.com.mhc.function.DateFunction;

public class Util {

	public Calendar calcularDataVencimento(FinDocumento finDocumento) {
		if (finDocumento.getIdformapagamento().getDescricao().startsWith("CREDITO"))
			return DateFunction.setMonthInDate(finDocumento.getDataemissao(), 1);
		else
			return DateFunction.setDaysInDate(finDocumento.getDataemissao(), finDocumento.getIdformapagamento().getIntervalo());
	}
	
}
