package br.com.netsis.security;

import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;

import br.com.caelum.brutauth.auth.handlers.RuleHandler;
import br.com.caelum.vraptor.Result;
import br.com.netsis.controller.LoginController;

@RequestScoped
public class LoginHandler implements RuleHandler {

	@Inject
	private Result result;
	
	public LoginHandler(Result result) {
		this.result = result;
	}
	
	@Deprecated
	public LoginHandler() {}
	
	@Override
	public void handle() {
		// TODO Auto-generated method stub
		this.result.redirectTo(LoginController.class).formulario();
	}

}
