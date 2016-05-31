package br.com.hebi.controller;

import br.com.caelum.brutauth.auth.annotations.CustomBrutauthRules;
import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.hebi.model.AdmTipoAcesso;
import br.com.hebi.security.AdminAccess;

@Controller
@Path("administrador/usuario/tipo-de-acesso")
@CustomBrutauthRules(AdminAccess.class)
public class AdmTipoAcessoController extends GenericController<AdmTipoAcesso> {

	@Get("{obj.id}")
	@Override
	public void editar(AdmTipoAcesso obj) {
		// TODO Auto-generated method stub
		super.editar(obj);
	}
	
}
