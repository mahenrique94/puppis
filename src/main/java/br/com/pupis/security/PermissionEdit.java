package br.com.pupis.security;

import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;

import br.com.caelum.brutauth.auth.rules.CustomBrutauthRule;

@RequestScoped
public class PermissionEdit implements CustomBrutauthRule {

	@Inject
	private UserName userName;
	
	public PermissionEdit(UserName userName) {
		// TODO Auto-generated constructor stub
		this.userName = userName;
	}
	
	@Deprecated
	public PermissionEdit() {
		// TODO Auto-generated constructor stub
	}
	
	public boolean isAllowed() {
		return this.userName.getUsuario().getIdgrupo().getIdtipoacesso().getEditar() == true;
	}
	
}
