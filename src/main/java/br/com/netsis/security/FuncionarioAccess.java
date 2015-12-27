package br.com.netsis.security;

import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;

import br.com.caelum.brutauth.auth.rules.CustomBrutauthRule;

@RequestScoped
public class FuncionarioAccess implements CustomBrutauthRule {
	
	@Inject
	private UserName userName;
	
	public FuncionarioAccess(UserName userName) {
		// TODO Auto-generated constructor stub
		this.userName = userName;
	}
	
	@Deprecated
	public FuncionarioAccess() {
		// TODO Auto-generated constructor stub
	}
	
	public boolean isAllowed() {
		return this.userName.getUsuario().getIdgrupo().getDescricao().equals("FUNCIONARIO");
	}

}
