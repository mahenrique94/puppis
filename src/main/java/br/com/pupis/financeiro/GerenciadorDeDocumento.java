package br.com.pupis.financeiro;




public abstract class GerenciadorDeDocumento implements Gerenciador {

	private String operacao;
	
	public String getOperacao() {
		return operacao;
	}
	public void setOperacao(String operacao) {
		this.operacao = operacao;
	}
	
	@Override
	public Gerenciador pega(String operacao) {
		// TODO Auto-generated method stub
		return new GerenciadorDeBaixa().pega(operacao);
	}
	
}
