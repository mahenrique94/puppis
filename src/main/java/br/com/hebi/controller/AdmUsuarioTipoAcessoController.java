package br.com.hebi.controller;

import br.com.caelum.brutauth.auth.annotations.CustomBrutauthRules;
import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.hebi.model.AdmUsuarioTipoAcesso;
import br.com.hebi.security.AdminAccess;

@Controller
@Path("administrador/usuario/tipo-de-acesso")
@CustomBrutauthRules(AdminAccess.class)
public class AdmUsuarioTipoAcessoController extends GenericController<AdmUsuarioTipoAcesso> {

	@Get("{obj.id}")
	@Override
	public void editar(AdmUsuarioTipoAcesso obj) {
		// TODO Auto-generated method stub
		super.editar(obj);
	}
	
}
