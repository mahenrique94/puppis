package br.com.puppis.estoque;

public abstract class GerenciadorEstoque implements Gerenciador {
	
	private String operacao;

	public String getOperacao() {
		return operacao;
	}
	public void setOperacao(String operacao) {
		this.operacao = operacao;
	}

}
