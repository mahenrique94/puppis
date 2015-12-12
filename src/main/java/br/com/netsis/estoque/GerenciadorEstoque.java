package br.com.netsis.estoque;

import br.com.netsis.model.PsProdutoServico;

public interface GerenciadorEstoque {

	public void atualizaEstoque(PsProdutoServico item, Estoque estoque);
	
}
