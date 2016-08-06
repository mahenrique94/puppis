package br.com.puppis.estoque;

import java.util.Calendar;

public class GerenciadorFactory {

	public static Gerenciador cria(String operacao, Calendar dataAtualizacao) {
		return new GerenciadorVenda().pega(operacao, dataAtualizacao);
	}
	
}
