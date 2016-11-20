package br.com.puppis.estoque;

import java.util.Calendar;

import br.com.puppis.dao.GenericDao;
import br.com.puppis.model.ComNota;
import br.com.puppis.model.PsProdutoServico;
import br.com.puppis.movimento.MovimentoTipo;

public class GerenciadorCompra extends GerenciadorEstoque {

	@Override
	public void gerencia(GenericDao dao, long idNota, long idProdutoServico, double quantidade, double valorVenda) {
		// TODO Auto-generated method stub
		PsProdutoServico produto = (PsProdutoServico) dao.edit(new PsProdutoServico(idProdutoServico));
		ComNota nota = (ComNota) dao.edit(new ComNota(idNota));
		produto.getCusto().setValor(valorVenda);
		produto.getEstoque().setQuantidade(produto.getEstoque().getQuantidade() + quantidade);
		dao.save(produto);
		getMovimento().movimenta(dao, nota.getNumero() != null ? nota.getNumero() : nota.getId(), idProdutoServico, quantidade, MovimentoTipo.COMPRA);
	}

	@Override
	public Gerenciador pega(String operacao, Calendar dataAtualizacao) {
		// TODO Auto-generated method stub
		if (operacao.equals("COMPRA") && dataAtualizacao == null) {
			return this;
		} else {
			setOperacao(operacao);
			setDataAtualizacao(dataAtualizacao);
			return proximo(new GerenciadorEstornaVenda());
		}
	}

	@Override
	public Gerenciador proximo(Gerenciador proximo) {
		// TODO Auto-generated method stub
		return proximo.pega(getOperacao(), getDataAtualizacao());
	}

}
