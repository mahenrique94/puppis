package br.com.puppis.controller;

import javax.inject.Inject;

import br.com.caelum.brutauth.auth.annotations.Public;
import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Result;
import br.com.puppis.dao.Dao;
import br.com.puppis.security.LoginModule;
import br.com.puppis.security.UserName;

@Controller
@Path("login")
public class LoginController {
	
	private Result result;
	private UserName userName;
	private LoginModule loginModule;
	
	@Inject
	public LoginController(Result result, UserName userName, LoginModule loginModule) {
		// TODO Auto-generated constructor stub
		this.result = result;
		this.userName = userName;
		this.loginModule = loginModule;
	}
	@Deprecated
	public LoginController() {
		// TODO Auto-generated constructor stub
	}

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
	
}
