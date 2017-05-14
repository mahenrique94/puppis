package br.com.puppis.security;

import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;

import br.com.caelum.brutauth.auth.handlers.RuleHandler;
import br.com.caelum.vraptor.Result;
import br.com.puppis.controller.LoginController;

@RequestScoped
public class LoginHandler implements RuleHandler {

	private Result result;
	
	@Inject
	public LoginHandler(Result result) {
		// TODO Auto-generated constructor stub
		this.result = result;
	}
	@Deprecated
	public LoginHandler() {
		// TODO Auto-generated constructor stub
	}
	
	@Override
	public void handle() {
		// TODO Auto-generated method stub
		this.result.redirectTo(LoginController.class).formulario();
	}

}
