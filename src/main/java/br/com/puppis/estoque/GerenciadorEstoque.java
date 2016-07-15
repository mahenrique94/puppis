package br.com.puppis.estoque;

import br.com.puppis.model.PsProdutoServico;

public interface GerenciadorEstoque {

	public void atualizaEstoque(PsProdutoServico item, Estoque estoque);
	
}
