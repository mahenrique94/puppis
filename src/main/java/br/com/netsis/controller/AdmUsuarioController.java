package br.com.netsis.controller;

import br.com.caelum.brutauth.auth.annotations.CustomBrutauthRules;
import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.netsis.model.AdmUsuario;
import br.com.netsis.security.AdminAccess;

@Controller
@Path("administrador/usuario")
@CustomBrutauthRules(AdminAccess.class)
public class AdmUsuarioController extends GenericController<AdmUsuario> {
	
	@Get("{obj.id}")
	@Override
	public void editar(AdmUsuario obj) {
		// TODO Auto-generated method stub
		super.editar(obj);
	}
	
}
