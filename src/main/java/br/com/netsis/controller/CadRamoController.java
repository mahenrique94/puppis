package br.com.netsis.controller;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.netsis.model.CadRamo;

@Controller
@Path("ramo")
public class CadRamoController extends GenericController<CadRamo> {

	@Get("{obj.id}")
	@Override
	public void editar(CadRamo obj) {
		// TODO Auto-generated method stub
		super.editar(obj);
	}
	
}
