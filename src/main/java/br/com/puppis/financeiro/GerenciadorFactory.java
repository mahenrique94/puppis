package br.com.puppis.financeiro;


public class GerenciadorFactory {

	public static Gerenciador cria(String operacao) {
		return new GerenciadorBaixa().pega(operacao);
	}
	
}
