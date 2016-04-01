package br.com.hebi.controller;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.hebi.model.FinContaBancaria;

@Controller
@Path("financeiro/conta-bancaria")
public class FinContaBancariaController extends GenericController<FinContaBancaria> {
	
	@Get("{obj.id}")
	@Override
	public void editar(FinContaBancaria obj) {
		// TODO Auto-generated method stub
		super.editar(obj);
	}

}
