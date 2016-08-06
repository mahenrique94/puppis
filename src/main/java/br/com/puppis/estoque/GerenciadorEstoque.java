package br.com.puppis.estoque;

import java.util.Calendar;

import br.com.puppis.movimento.Movimento;

public abstract class GerenciadorEstoque implements Gerenciador {
	
	private final Movimento movimento = new Movimento();
	private String operacao;
	private Calendar dataAtualizacao;

	public Movimento getMovimento() {
		return movimento;
	}
	public String getOperacao() {
		return operacao;
	}
	public void setOperacao(String operacao) {
		this.operacao = operacao;
	}
	public Calendar getDataAtualizacao() {
		return dataAtualizacao;
	}
	public void setDataAtualizacao(Calendar dataAtualizacao) {
		this.dataAtualizacao = dataAtualizacao;
	}

}
