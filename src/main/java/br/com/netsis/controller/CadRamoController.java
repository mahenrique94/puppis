package br.com.netsis.controller;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.netsis.model.PesRamo;

@Controller
@Path("ramo")
public class CadRamoController extends GenericController<PesRamo> {

	@Get("{obj.id}")
	@Override
	public void editar(PesRamo obj) {
		// TODO Auto-generated method stub
		super.editar(obj);
	}
	
}
