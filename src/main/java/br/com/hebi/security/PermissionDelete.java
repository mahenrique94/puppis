package br.com.hebi.security;

import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;

import br.com.caelum.brutauth.auth.rules.CustomBrutauthRule;

@RequestScoped
public class PermissionDelete implements CustomBrutauthRule {

	@Inject
	private UserName userName;
	
	public PermissionDelete(UserName userName) {
		// TODO Auto-generated constructor stub
		this.userName = userName;
	}
	
	@Deprecated
	public PermissionDelete() {
		// TODO Auto-generated constructor stub
	}
	
	public boolean isAllowed() {
		return this.userName.getUsuario().getIdgrupo().getIdtipoacesso().getDeletar() == true;
	}
	
}
