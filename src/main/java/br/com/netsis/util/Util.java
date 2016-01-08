package br.com.netsis.util;

import java.util.Calendar;

import br.com.mhc.util.Functions;
import br.com.netsis.model.FinDocumento;

public class Util {

	public Calendar calcularDataVencimento(FinDocumento finDocumento) {
		if (finDocumento.getIdformapagamento().getDescricao().startsWith("CREDITO"))
			return new Functions().setMonthInDate(finDocumento.getDataemissao(), 1);
		else
			return new Functions().setDaysInDate(finDocumento.getDataemissao(), finDocumento.getIdformapagamento().getIntervalo());
	}
	
}
