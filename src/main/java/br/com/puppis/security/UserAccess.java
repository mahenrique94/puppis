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

	private UserName userName;
	
	@Inject
	public UserAccess(UserName userName) {
		// TODO Auto-generated constructor stub
		this.userName = userName;
	}
	@Deprecated
	public UserAccess() {
		// TODO Auto-generated constructor stub
	}

	public boolean isAllowed() {
		return this.userName.isLogged();
	}
	
}
