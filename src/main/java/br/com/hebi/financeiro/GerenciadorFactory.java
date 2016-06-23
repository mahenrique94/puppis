package br.com.hebi.financeiro;


public class GerenciadorFactory {

	public static Gerenciador cria(String operacao) {
		return new GerenciadorDeBaixa().pega(operacao);
	}
	
}
