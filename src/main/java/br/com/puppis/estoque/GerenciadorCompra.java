package br.com.puppis.estoque;

import br.com.puppis.dao.GenericDao;
import br.com.puppis.model.PsProdutoServico;

public class GerenciadorCompra extends GerenciadorEstoque {

	@Override
	public void gerencia(GenericDao dao, long idProdutoServico, double quantidade, double valorVenda) {
		// TODO Auto-generated method stub
		PsProdutoServico produto = (PsProdutoServico) dao.edit(new PsProdutoServico(idProdutoServico));
		produto.getEstoque().setQuantidade(produto.getEstoque().getQuantidade() + quantidade);
		produto.getCusto().setValor(valorVenda);
		dao.save(produto);
	}

	@Override
	public Gerenciador pega(String operacao) {
		// TODO Auto-generated method stub
		if (operacao.equals("COMPRA")) {
			return this;
		} else {
			setOperacao(operacao);
			return proximo(null);
		}
	}

	@Override
	public Gerenciador proximo(Gerenciador proximo) {
		// TODO Auto-generated method stub
		throw new RuntimeException("Não foi possível obter o gerenciador da operação" + getOperacao());
	}

}
