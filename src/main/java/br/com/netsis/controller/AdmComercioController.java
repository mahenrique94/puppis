package br.com.netsis.controller;

import java.util.Arrays;

import javax.validation.Valid;

import br.com.caelum.brutauth.auth.annotations.CustomBrutauthRules;
import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.interceptor.IncludeParameters;
import br.com.caelum.vraptor.validator.I18nMessage;
import br.com.netsis.model.AdmComercio;
import br.com.netsis.model.AdmContato;
import br.com.netsis.model.AdmDocumento;
import br.com.netsis.model.AdmEndereco;
import br.com.netsis.security.AdminAccess;

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
		if (obj.getId() != null) {
			obj.getContato().setIdcomercio(new AdmComercio(obj.getId()));
			obj.getEndereco().setIdcomercio(new AdmComercio(obj.getId()));
			obj.getDocumento().setIdcomercio(new AdmComercio(obj.getId()));
		}
		super.salvar(obj);
	}
	
}
