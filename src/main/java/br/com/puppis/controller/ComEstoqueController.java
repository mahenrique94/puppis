package br.com.puppis.controller;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;

@Controller
@Path("comercio/estoque")
public class ComEstoqueController {
	
	@Get
	@Post
	@Path("correcao")
	public void correcao(Integer idProduto, Integer idMovimento, Double quantidade) {
		if (idProduto != null && idMovimento != null && quantidade != null) {
			
		}
	}

}
