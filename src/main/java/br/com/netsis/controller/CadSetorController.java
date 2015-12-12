package br.com.netsis.controller;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.netsis.model.PesSetor;

@Controller
@Path("setor")
public class CadSetorController extends GenericController<PesSetor> {

	@Get("{obj.id}")
	@Override
	public void editar(PesSetor obj) {
		// TODO Auto-generated method stub
		super.editar(obj);
	}
	
}
