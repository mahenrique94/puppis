package br.com.hebi.security;

import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;

import br.com.caelum.brutauth.auth.rules.CustomBrutauthRule;

@RequestScoped
public class AdministradorAccess implements CustomBrutauthRule {

	@Inject
	private UserName userName;
	
	public AdministradorAccess(UserName userName) {
		this.userName = userName;
	}
	
	@Deprecated
	public AdministradorAccess() {}
	
	public boolean isAllowed() {
		return this.userName.getUsuario().isAdministrador(this.userName.getUsuario());
	}
	
}
