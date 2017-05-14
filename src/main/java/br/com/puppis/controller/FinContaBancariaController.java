package br.com.puppis.controller;

import java.util.List;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.view.Results;
import br.com.mhc.parametrosweb.ParametrosWeb;
import br.com.puppis.model.FinContaBancaria;

@Controller
@Path("financeiro/conta-bancaria")
public class FinContaBancariaController extends GenericController<FinContaBancaria> {
	
	@Get("{obj.id}")
	@Override
	public void editar(FinContaBancaria obj) {
		// TODO Auto-generated method stub
		super.editar(obj);
	}
	
	@Get("json")
	@Override
	public void toJSON(FinContaBancaria obj, List<ParametrosWeb> parametrosWeb) {
		// TODO Auto-generated method stub
		super.result.use(Results.json()).from(super.getDao().findAll(FinContaBancaria.class, parametrosWeb)).include("idtipocontabancaria").serialize();
	}

}
