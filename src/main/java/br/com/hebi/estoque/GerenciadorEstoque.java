package br.com.hebi.estoque;

import br.com.hebi.model.PsProdutoServico;

public interface GerenciadorEstoque {

	public void atualizaEstoque(PsProdutoServico item, Estoque estoque);
	
}
