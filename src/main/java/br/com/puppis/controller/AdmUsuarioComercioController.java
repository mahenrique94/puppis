package br.com.puppis.controller;

import java.util.ArrayList;
import java.util.List;

import br.com.caelum.brutauth.auth.annotations.CustomBrutauthRules;
import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Delete;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.mhc.parametrosweb.ParametrosWeb;
import br.com.puppis.model.AdmUsuarioComercio;
import br.com.puppis.security.AdminAccess;
import br.com.puppis.security.ModuleAdministradorAccess;
import br.com.puppis.security.UserModuleAdministradorAccess;

@Controller
@Path("administrador/usuario/comercio")
@CustomBrutauthRules({AdminAccess.class, ModuleAdministradorAccess.class, UserModuleAdministradorAccess.class})
public class AdmUsuarioComercioController extends GenericController<AdmUsuarioComercio> {

	@Delete("")
	@Override
	public void deletar(AdmUsuarioComercio obj) {
		// TODO Auto-generated method stub
		this.setRedirect(false);
		super.deletar(obj);
		this.result.nothing();
	}
	
	@Get("{obj.id}")
	@Override
	public void editar(AdmUsuarioComercio obj) {
		// TODO Auto-generated method stub
		super.editar(obj);
	}
	
	@Get("formulario/{obj.idusuario.id}")
	@Override
	public void formulario(AdmUsuarioComercio obj) {
		// TODO Auto-generated method stub
		this.result.include("obj", obj);
		super.formulario(obj);
	}
	
	@Get("loadgrid/{obj.idusuario.id}")
	public void loadGrid(AdmUsuarioComercio obj) {
		List<ParametrosWeb> parametrosWeb = new ArrayList<ParametrosWeb>();
		parametrosWeb.add(new ParametrosWeb("idusuario.id", obj.getIdusuario().getId().toString()));
		this.listar(obj, parametrosWeb);
	}
	
	@Post("")
	@Override
	public void salvar(AdmUsuarioComercio obj) {
		// TODO Auto-generated method stub
		this.setRedirect(false);
		super.salvar(obj);
		this.result.nothing();
	}
	
}
