package br.com.yumer.controller;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.yumer.model.FinControle;

@Controller
@Path("financeiro/controle")
public class FinControleController extends GenericController<FinControle> {
	
	@Get("{obj.id}")
	@Override
	public void editar(FinControle obj) {
		// TODO Auto-generated method stub
		super.editar(obj);
	}

}
