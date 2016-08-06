package br.com.puppis.controller;

import br.com.caelum.brutauth.auth.annotations.CustomBrutauthRules;
import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.puppis.model.AdmComercio;
import br.com.puppis.security.AdminAccess;
import br.com.puppis.security.ModuleAdministradorAccess;
import br.com.puppis.security.UserModuleAdministradorAccess;

@Controller
@Path("administrador/comercio")
@CustomBrutauthRules({AdminAccess.class, ModuleAdministradorAccess.class, UserModuleAdministradorAccess.class})
public class AdmComercioController extends GenericController<AdmComercio> {

	@Get("{obj.id}")
	@Override
	public void editar(AdmComercio obj) {
		// TODO Auto-generated method stub
		super.editar(obj);
	}
	
	@Post("")
	@Override
	public void salvar(AdmComercio obj) {
		// TODO Auto-generated method stub
		this.setRedirect(false);
		if (obj.getId() == null) {
			obj.getContato().setIdcomercio(obj);
			obj.getEndereco().setIdcomercio(obj);
			obj.getDocumento().setIdcomercio(obj);
			obj.getPagamento().setIdcomercio(obj);
		}
		super.salvar(obj);
		this.result.redirectTo(this).editar(this.getObj());
	}
	
}
