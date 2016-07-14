package br.com.pupis.security;

import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;

import br.com.caelum.brutauth.auth.rules.CustomBrutauthRule;

@RequestScoped
public class GerenteAccess implements CustomBrutauthRule {

	@Inject
	private UserName userName;
	
	public GerenteAccess(UserName userName) {
		// TODO Auto-generated constructor stub
		this.userName = userName;
	}
	
	@Deprecated
	public GerenteAccess() {
		// TODO Auto-generated constructor stub
	}
	
	public boolean isAllowed() {
		return this.userName.getUsuario().getIdgrupo().getDescricao().equals("GERENTE");
	}
	
}
