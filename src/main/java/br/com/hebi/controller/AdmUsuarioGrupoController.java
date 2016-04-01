package br.com.hebi.controller;

import br.com.caelum.brutauth.auth.annotations.CustomBrutauthRules;
import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.hebi.model.AdmUsuarioGrupo;
import br.com.hebi.security.AdminAccess;

@Controller
@Path("administrador/usuario/grupo")
@CustomBrutauthRules(AdminAccess.class)
public class AdmUsuarioGrupoController extends GenericController<AdmUsuarioGrupo> {

	@Get("{obj.id}")
	@Override
	public void editar(AdmUsuarioGrupo obj) {
		// TODO Auto-generated method stub
		super.editar(obj);
	}
	
}
