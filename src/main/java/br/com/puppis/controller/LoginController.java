package br.com.puppis.controller;

import javax.inject.Inject;

import br.com.caelum.brutauth.auth.annotations.Public;
import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Result;
import br.com.puppis.dao.Dao;
import br.com.puppis.dao.GenericDao;
import br.com.puppis.security.LoginModule;
import br.com.puppis.security.UserName;

@Controller
@Path("login")
public class LoginController {
	
	@Inject
	private Dao dao;
	@Inject
	private Result result;
	@Inject
	private UserName userName;
	@Inject
	private LoginModule loginModule;
	

	@Get("formulario")
	@Public
	public void formulario() {}
	
	@Post("")
	@Public
	public void login(String usuario, String senha, Integer idComercio) {
		this.loginModule.loga(usuario, senha, idComercio);
	}
	
	@Get("logout")
	public void logout() {
		this.userName.logout();
		this.result.redirectTo(this).formulario();
	}
	
	private GenericDao getDao() {
		return this.dao.getDao();
	}
	
}
