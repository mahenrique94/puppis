package br.com.puppis.controller;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.puppis.model.TblPreco;

@Controller
@Path("tabela-de-preco")
public class TblPrecoController extends GenericController<TblPreco> {
	
	@Get("{obj.id}")
	@Override
	public void editar(TblPreco obj) {
		// TODO Auto-generated method stub
		super.editar(obj);
	}
	
	@Post("")
	@Override
	public void salvar(TblPreco obj) {
		// TODO Auto-generated method stub
		super.setRedirect(false);
		super.salvar(obj);
		super.result.redirectTo(this).editar(this.getObj());
	}

}
