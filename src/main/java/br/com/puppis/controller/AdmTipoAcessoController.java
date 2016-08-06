package br.com.puppis.controller;

import br.com.caelum.brutauth.auth.annotations.CustomBrutauthRules;
import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.puppis.model.AdmTipoAcesso;
import br.com.puppis.security.AdminAccess;
import br.com.puppis.security.ModuleAdministradorAccess;
import br.com.puppis.security.UserModuleAdministradorAccess;

@Controller
@Path("administrador/usuario/tipo-de-acesso")
@CustomBrutauthRules({AdminAccess.class, ModuleAdministradorAccess.class, UserModuleAdministradorAccess.class})
public class AdmTipoAcessoController extends GenericController<AdmTipoAcesso> {

	@Get("{obj.id}")
	@Override
	public void editar(AdmTipoAcesso obj) {
		// TODO Auto-generated method stub
		super.editar(obj);
	}

	@Post("")
	@Override
	public void salvar(AdmTipoAcesso obj) {
		// TODO Auto-generated method stub
		this.setRedirect(false);
		super.salvar(obj);
		this.result.redirectTo(this).editar(this.getObj());
	}
	
}
