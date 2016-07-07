package br.com.hebi.util;

import java.util.Calendar;

import br.com.hebi.model.FinDocumento;
import br.com.mhc.function.DateFunction;

public class Util {

	public Calendar calcularDataVencimento(FinDocumento finDocumento, int qtdMes) {
		if (finDocumento.getIdformapagamento().getDescricao().startsWith("CREDITO") || finDocumento.getIdformapagamento().getDescricao().startsWith("FINANCIAMENTO"))
			return DateFunction.setMonthInDate(finDocumento.getDataemissao(), qtdMes);
		else
			return DateFunction.setDaysInDate(finDocumento.getDataemissao(), finDocumento.getIdformapagamento().getIntervalo());
	}
	
}
