package br.com.puppis.controller;

import javax.inject.Inject;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Result;
import br.com.puppis.dao.Dao;
import br.com.puppis.dao.GenericDao;
import br.com.puppis.model.PsProdutoServico;
import br.com.puppis.movimento.Movimento;
import br.com.puppis.movimento.MovimentoTipo;

@Controller
@Path("comercio/estoque")
public class ComEstoqueController {
	
	private PsProdutoServicoController psProdutoServicoController;
	private Dao dao;
	private Result result;
	
	@Inject
	public ComEstoqueController(PsProdutoServicoController psProdutoServicoController, Dao dao, Result result) {
		// TODO Auto-generated constructor stub
		this.psProdutoServicoController = psProdutoServicoController;
		this.dao = dao;
		this.result = result;
	}
	@Deprecated
	public ComEstoqueController() {
		// TODO Auto-generated constructor stub
	}
	
	@Get
	@Post
	@Path("correcao")
	public void correcao(Integer idProduto, Integer idMovimento, Double quantidade) {
		if (idProduto != null && idMovimento != null && quantidade != null) {
			Movimento movimento = new Movimento();
			double quantidadeAnterior = 0.0;
			PsProdutoServico produto = this.psProdutoServicoController.buscaProduto(idProduto);
			quantidadeAnterior = produto.getEstoque().getQuantidade();
			produto.getEstoque().setQuantidade(quantidade);
			movimento.movimenta(getDao(), 0, produto.getId(), quantidade, MovimentoTipo.getMovimentoTipo(idMovimento));
			this.result.include("mensagem", "mensagem.estoque.correcao.sucesso");
			this.result.redirectTo(this).correcao(null, null, null);
		}
	}
	
	public GenericDao getDao() {
		return this.dao.getDao();
	}

}
