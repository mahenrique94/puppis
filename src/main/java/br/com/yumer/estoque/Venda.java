package br.com.yumer.estoque;

import br.com.yumer.model.PsProdutoServico;

public class Venda implements GerenciadorEstoque {

	@Override
	public void atualizaEstoque(PsProdutoServico item, Estoque estoque) {
		// TODO Auto-generated method stub
 		item.getCusto().setValortotal((item.getEstoque().getQuantidade() - estoque.getQuantidade()) * (item.getCusto().getValorvenda()));
 		item.getEstoque().setQuantidadeven(item.getEstoque().getQuantidadeven() + estoque.getQuantidade());
		item.getEstoque().setQuantidade(item.getEstoque().getQuantidade() - estoque.getQuantidade());
	}
	
}
