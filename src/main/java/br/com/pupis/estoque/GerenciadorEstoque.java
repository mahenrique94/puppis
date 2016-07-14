package br.com.pupis.estoque;

import br.com.pupis.model.PsProdutoServico;

public interface GerenciadorEstoque {

	public void atualizaEstoque(PsProdutoServico item, Estoque estoque);
	
}
