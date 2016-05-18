package br.com.hebi.security;

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

	public UserAccess(UserName userName) {
		this.userName = userName;
	}
	
	@Deprecated
	public UserAccess() {}
	
	public boolean isAllowed() {
		return this.userName.isLogado();
	}
	
}
