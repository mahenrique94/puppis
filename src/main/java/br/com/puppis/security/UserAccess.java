package br.com.puppis.security;

import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;

import br.com.caelum.brutauth.auth.annotations.GlobalRule;
import br.com.caelum.brutauth.auth.annotations.HandledBy;
import br.com.caelum.brutauth.auth.rules.CustomBrutauthRule;

@RequestScoped
@GlobalRule
@HandledBy(LoginHandler.class)
public class UserAccess implements CustomBrutauthRule {

	@Inject
	private UserName userName;

	public boolean isAllowed() {
		return this.userName.isLogged();
	}
	
}
