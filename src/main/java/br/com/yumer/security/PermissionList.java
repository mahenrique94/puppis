package br.com.yumer.security;

import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;

import br.com.caelum.brutauth.auth.rules.CustomBrutauthRule;

@RequestScoped
public class PermissionList implements CustomBrutauthRule {

	@Inject
	private UserName userName;
	
	public PermissionList(UserName userName) {
		// TODO Auto-generated constructor stub
		this.userName = userName;
	}
	
	@Deprecated
	public PermissionList() {
		// TODO Auto-generated constructor stub
	}
	
	public boolean isAllowed() {
		return this.userName.getUsuario().getIdgrupo().getIdtipoacesso().getListar() == true;
	}
	
}
