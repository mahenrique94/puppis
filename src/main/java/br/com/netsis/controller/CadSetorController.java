package br.com.netsis.controller;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.netsis.model.CadSetor;

@Controller
@Path("setor")
public class CadSetorController extends GenericController<CadSetor> {

	@Get("{obj.id}")
	@Override
	public void editar(CadSetor obj) {
		// TODO Auto-generated method stub
		super.editar(obj);
	}
	
}
