package br.com.hebi.model;

public class CreditoDebito {

	public static String getCreditoDebito(String tipoOperacao, String tipoPessoa) {
		if (tipoOperacao.equals("ENTRADA"))
			return "C";
		else if (tipoOperacao.equals("SAIDA"))
			return "D";
		else if (tipoOperacao.equals("BAIXA")) {
			if (tipoPessoa.equals("CLIENTE"))
				return "C";
			else
				return "D";
		} else if (tipoOperacao.equals("ESTORNO") || tipoOperacao.equals("CANCELAMENTO")) {
			if (tipoPessoa.equals("CLIENTE"))
				return "D";
			else
				return "C";
		} else
			return null;
	}
	
}
