package br.com.puppis.controller;

import javax.validation.Valid;

import br.com.caelum.brutauth.auth.annotations.CustomBrutauthRules;
import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.interceptor.IncludeParameters;
import br.com.puppis.model.AdmComercio;
import br.com.puppis.security.AdminAccess;

@Controller
@Path("administrador/comercio")
@CustomBrutauthRules(AdminAccess.class)
public class AdmComercioController extends GenericController<AdmComercio> {

	@Get("{obj.id}")
	@Override
	public void editar(AdmComercio obj) {
		// TODO Auto-generated method stub
		super.editar(obj);
	}
	
	@Post("")
	@IncludeParameters
	@Override
	public void salvar(@Valid AdmComercio obj) {
		// TODO Auto-generated method stub
		if (obj.getId() == null) {
			obj.getContato().setIdcomercio(obj);
			obj.getEndereco().setIdcomercio(obj);
			obj.getDocumento().setIdcomercio(obj);
		}
		super.salvar(obj);
	}
	
}
