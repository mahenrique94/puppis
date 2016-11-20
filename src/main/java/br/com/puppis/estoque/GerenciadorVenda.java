package br.com.puppis.estoque;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import br.com.mhc.parametrosweb.ParametrosWeb;
import br.com.puppis.dao.Dao;
import br.com.puppis.dao.GenericDao;
import br.com.puppis.model.ComNota;
import br.com.puppis.model.PsComposicao;
import br.com.puppis.model.PsProdutoServico;
import br.com.puppis.movimento.MovimentoTipo;

public class GerenciadorVenda extends GerenciadorEstoque {

	@Override
	public void gerencia(GenericDao dao, long idNota, long idProdutoServico, double quantidade, double valorVenda) {
		// TODO Auto-generated method stub
		PsProdutoServico produto = (PsProdutoServico) dao.edit(new PsProdutoServico(idProdutoServico));
		ComNota nota = (ComNota) dao.edit(new ComNota(idNota));
		produto.getEstoque().setQuantidade(produto.getEstoque().getQuantidade() - quantidade);
		dao.save(produto);
		getMovimento().movimenta(dao, nota.getNumero() != null ? nota.getNumero() : nota.getId(), idProdutoServico, quantidade, MovimentoTipo.VENDA);
		List<PsComposicao> composicoes = possuiComposicao(dao, idProdutoServico); 
		if (composicoes != null && !composicoes.isEmpty()) {
			for (PsComposicao composicao : composicoes) {
				for (int i = 1; i <= quantidade; i++) {
					gerencia(dao, idNota, composicao.getIdcomposicao().getId(), composicao.getQuantidade(), 0.0);
				}
			}
		}
	}

	@Override
	public Gerenciador pega(String operacao, Calendar dataAtualizacao) {
		// TODO Auto-generated method stub
		if (operacao.equals("VENDA") && dataAtualizacao == null) {
			return this;
		} else {
			setOperacao(operacao);
			setDataAtualizacao(dataAtualizacao);
			return proximo(new GerenciadorCompra());
		}
	}

	@Override
	public Gerenciador proximo(Gerenciador proximo) {
		// TODO Auto-generated method stub
		return proximo.pega(getOperacao(), getDataAtualizacao());
	}
	
	private List<PsComposicao> possuiComposicao(GenericDao dao, long idProdutoServico) {
		List<ParametrosWeb> parametrosWeb = new ArrayList<ParametrosWeb>();
		parametrosWeb.add(new ParametrosWeb("idprodutoservico.id", Long.toString(idProdutoServico)));
		return dao.findAll(PsComposicao.class, parametrosWeb);
	}
	
}
