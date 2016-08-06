package br.com.puppis.controller;

import br.com.caelum.brutauth.auth.annotations.CustomBrutauthRules;
import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.puppis.model.CadCentroCusto;
import br.com.puppis.security.ModuleCadastroAccess;
import br.com.puppis.security.UserModuleCadastroAccess;

@Controller
@Path("cadastro/centro-de-custo")
@CustomBrutauthRules({ModuleCadastroAccess.class, UserModuleCadastroAccess.class})
public class CadCentroCustoController extends GenericController<CadCentroCusto> {

	@Get("{obj.id}")
	@Override
	public void editar(CadCentroCusto obj) {
		// TODO Auto-generated method stub
		super.editar(obj);
	}
	
}
