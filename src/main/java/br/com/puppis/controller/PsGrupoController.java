package br.com.puppis.controller;

import br.com.caelum.brutauth.auth.annotations.CustomBrutauthRules;
import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.puppis.model.PsGrupo;
import br.com.puppis.security.ModuleCadastroAccess;
import br.com.puppis.security.UserModuleCadastroAccess;

@Controller
@Path("produto-servico/grupo")
@CustomBrutauthRules({ModuleCadastroAccess.class, UserModuleCadastroAccess.class})
public class PsGrupoController extends GenericController<PsGrupo> {

	@Get("{obj.id}")
	@Override
	public void editar(PsGrupo obj) {
		// TODO Auto-generated method stub
		super.editar(obj);
	}
	
}
