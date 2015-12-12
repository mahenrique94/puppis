package br.com.netsis.controller;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.netsis.model.CadNucleo;

@Controller
@Path("nucleo")
public class CadNucleoController extends GenericController<CadNucleo> {

	@Get("{obj.id}")
	@Override
	public void editar(CadNucleo obj) {
		// TODO Auto-generated method stub
		super.editar(obj);
	}
	
}
