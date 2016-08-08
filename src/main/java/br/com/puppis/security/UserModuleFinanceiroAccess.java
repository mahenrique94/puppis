package br.com.puppis.security;

import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;

import br.com.caelum.brutauth.auth.rules.CustomBrutauthRule;

@RequestScoped
public class UserModuleFinanceiroAccess implements CustomBrutauthRule {

	@Inject
	private UserName userName;
	
	public boolean isAllowed() {
		return this.userName.getUsuario().getIdgrupo().getIdtipoacesso().possuiModulo("FINANCEIRO");
	}
	
}