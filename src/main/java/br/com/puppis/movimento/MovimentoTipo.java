package br.com.puppis.movimento;

public enum MovimentoTipo {

	COMPRA(1, "ENTRADA POR COMPRA", 1), 
	ESTORNO_COMPRA(2, "SAIDA POR ESTORNO", -1), 
	VENDA(3, "SAIDA POR VENDA", -1),
	ESTORNO_VENDA(4, "ENTRADA POR ESTORNO", 1);
	
	private int id;
	private String descricao;
	private int fator;
	
	private MovimentoTipo(int id, String descricao, int fator) {
		// TODO Auto-generated constructor stub
		this.id = id;
		this.descricao = descricao;
		this.fator = fator;
	}
	
	public int getId() {
		return id;
	}
	public String getDescricao() {
		return descricao;
	}
	public int getFator() {
		return fator;
	}
	public int getFatorInvertido() {
		return getFator() == 1 ? -1 : 1;
	}
	
}
