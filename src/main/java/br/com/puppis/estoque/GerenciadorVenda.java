package br.com.puppis.estoque;

import br.com.puppis.dao.GenericDao;
import br.com.puppis.model.PsProdutoServico;

public class GerenciadorVenda extends GerenciadorEstoque {

	@Override
	public void gerencia(GenericDao dao, long idProdutoServico, double quantidade, double valorVenda) {
		// TODO Auto-generated method stub
		PsProdutoServico produto = (PsProdutoServico) dao.edit(new PsProdutoServico(idProdutoServico));
		produto.getEstoque().setQuantidade(produto.getEstoque().getQuantidade() - quantidade);
		dao.save(produto);
	}

	@Override
	public Gerenciador pega(String operacao) {
		// TODO Auto-generated method stub
		if (operacao.equals("VENDA")) {
			return this;
		} else {
			setOperacao(operacao);
			return proximo(new GerenciadorCompra());
		}
	}

	@Override
	public Gerenciador proximo(Gerenciador proximo) {
		// TODO Auto-generated method stub
		return proximo.pega(getOperacao());
	}
	
}
