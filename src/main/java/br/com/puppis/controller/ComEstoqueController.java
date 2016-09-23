package br.com.puppis.controller;

import javax.inject.Inject;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.puppis.dao.Dao;
import br.com.puppis.dao.GenericDao;
import br.com.puppis.model.PsProdutoServico;
import br.com.puppis.movimento.Movimento;
import br.com.puppis.movimento.MovimentoTipo;

@Controller
@Path("comercio/estoque")
public class ComEstoqueController {
	
	@Inject
	private PsProdutoServicoController psProdutoServicoController;
	@Inject
	private Dao dao;
	
	@Get
	@Post
	@Path("correcao")
	public void correcao(Integer idProduto, Integer idMovimento, Double quantidade) {
		if (idProduto != null && idMovimento != null && quantidade != null) {
			Movimento movimento = new Movimento();
			PsProdutoServico produto = this.psProdutoServicoController.buscaProduto(idProduto);
			produto.getEstoque().setQuantidade(quantidade);
			movimento.movimenta(getDao(), produto.getId(), quantidade, MovimentoTipo.getMovimentoTipo(idMovimento));
		}
	}
	
	public GenericDao getDao() {
		return this.dao.getDao();
	}

}
