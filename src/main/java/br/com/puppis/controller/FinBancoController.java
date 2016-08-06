package br.com.puppis.controller;

import br.com.caelum.brutauth.auth.annotations.CustomBrutauthRules;
import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Path;
import br.com.puppis.model.FinBanco;
import br.com.puppis.security.ModuleCadastroAccess;
import br.com.puppis.security.ModuleFinanceiroAccess;
import br.com.puppis.security.UserModuleFinanceiroAccess;

@Controller
@Path("financeiro/banco")
@CustomBrutauthRules({ModuleCadastroAccess.class, ModuleFinanceiroAccess.class, UserModuleFinanceiroAccess.class})
public class FinBancoController extends GenericController<FinBanco> {

}
