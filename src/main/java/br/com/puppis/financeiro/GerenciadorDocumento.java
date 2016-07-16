package br.com.puppis.financeiro;

public abstract class GerenciadorDocumento implements Gerenciador {

	private String operacao;

	public String getOperacao() {
		return operacao;
	}

	public void setOperacao(String operacao) {
		this.operacao = operacao;
	}

}
