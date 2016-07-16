package br.com.puppis.estoque;

public class GerenciadorFactory {

	public static Gerenciador cria(String operacao) {
		return new GerenciadorVenda().pega(operacao);
	}
	
}
