package br.com.puppis.controller;

import br.com.caelum.brutauth.auth.annotations.CustomBrutauthRules;
import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.puppis.model.AdmGrupo;
import br.com.puppis.security.AdminAccess;
import br.com.puppis.security.ModuleAdministradorAccess;
import br.com.puppis.security.UserModuleAdministradorAccess;

@Controller
@Path("administrador/usuario/grupo")
@CustomBrutauthRules({AdminAccess.class, ModuleAdministradorAccess.class, UserModuleAdministradorAccess.class})
public class AdmGrupoController extends GenericController<AdmGrupo> {

	@Get("{obj.id}")
	@Override
	public void editar(AdmGrupo obj) {
		// TODO Auto-generated method stub
		super.editar(obj);
	}
	
}
