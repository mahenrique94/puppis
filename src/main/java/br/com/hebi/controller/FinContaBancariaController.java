package br.com.hebi.controller;

import java.util.List;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.view.Results;
import br.com.hebi.model.FinContaBancaria;
import br.com.hebi.model.FinTipoContaBancaria;
import br.com.mhc.parametrosweb.ParametrosWeb;

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
		List<FinContaBancaria> list = this.getDao().findAll(FinContaBancaria.class, parametrosWeb);
		this.result.use(Results.json()).from(list).include("idtipocontabancaria").serialize();
	}

}
