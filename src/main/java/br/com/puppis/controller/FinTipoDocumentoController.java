package br.com.puppis.controller;

import br.com.caelum.brutauth.auth.annotations.CustomBrutauthRules;
import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Path;
import br.com.puppis.model.FinTipoDocumento;
import br.com.puppis.security.ModuleCadastroAccess;
import br.com.puppis.security.ModuleFinanceiroAccess;
import br.com.puppis.security.UserModuleFinanceiroAccess;

@Controller
@Path("financeiro/tipo-de-documento")
@CustomBrutauthRules({ModuleCadastroAccess.class, ModuleFinanceiroAccess.class, UserModuleFinanceiroAccess.class})
public class FinTipoDocumentoController extends GenericController<FinTipoDocumento> {

}
