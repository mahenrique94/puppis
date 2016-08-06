package br.com.puppis.security;

import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;

import br.com.caelum.brutauth.auth.rules.CustomBrutauthRule;

@RequestScoped
public class AdminAccess implements CustomBrutauthRule {

	@Inject
	private UserName userName;
	
	public boolean isAllowed() {
		return this.userName.getUsuario().isAdministrador(this.userName.getUsuario());
	}
	
}
