package br.com.puppis.controller;

import java.util.List;

import br.com.caelum.brutauth.auth.annotations.CustomBrutauthRules;
import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.view.Results;
import br.com.mhc.parametrosweb.ParametrosWeb;
import br.com.puppis.model.FinContaBancaria;
import br.com.puppis.model.FinTipoContaBancaria;
import br.com.puppis.security.ModuleCadastroAccess;
import br.com.puppis.security.ModuleFinanceiroAccess;
import br.com.puppis.security.UserModuleFinanceiroAccess;

@Controller
@Path("financeiro/conta-bancaria")
@CustomBrutauthRules({ModuleCadastroAccess.class, ModuleFinanceiroAccess.class, UserModuleFinanceiroAccess.class})
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
