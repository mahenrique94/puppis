package br.com.puppis.estoque;

import br.com.puppis.model.PsProdutoServico;

public class Compra implements GerenciadorEstoque {

	@Override
	public void atualizaEstoque(PsProdutoServico item, Estoque estoque) {
		// TODO Auto-generated method stub
		item.getCusto().setValoranterior(estoque.getValoranterior());
		item.getCusto().setValorpago(estoque.getValorpago());
		item.getCusto().setPorclucro(estoque.getPorclucro());
		item.getCusto().setValorvenda(estoque.getValorunitario() + (estoque.getValorunitario() * (estoque.getPorclucro() / 100)));
		item.getCusto().setValortotal(estoque.getQuantidade() * (estoque.getValorunitario() + (estoque.getValorunitario() * (estoque.getPorclucro() / 100))));
		item.getEstoque().setQuantidade((estoque.getQuantidade()) + item.getEstoque().getQuantidade());
	}
	
}
