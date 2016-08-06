package br.com.puppis.controller;

import br.com.caelum.brutauth.auth.annotations.CustomBrutauthRules;
import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.puppis.model.FinHistorico;
import br.com.puppis.security.ModuleCadastroAccess;
import br.com.puppis.security.ModuleFinanceiroAccess;
import br.com.puppis.security.UserModuleFinanceiroAccess;

@Controller
@Path("financeiro/historico")
@CustomBrutauthRules({ModuleCadastroAccess.class, ModuleFinanceiroAccess.class, UserModuleFinanceiroAccess.class})
public class FinHistoricoController extends GenericController<FinHistorico> {
	
	@Get("{obj.id}")
	@Override
	public void editar(FinHistorico obj) {
		// TODO Auto-generated method stub
		super.editar(obj);
	}

}
