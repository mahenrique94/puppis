package br.com.yumer.estoque;

import br.com.yumer.model.PsProdutoServico;

public interface GerenciadorEstoque {

	public void atualizaEstoque(PsProdutoServico item, Estoque estoque);
	
}
