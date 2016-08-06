package br.com.puppis.controller;

import br.com.caelum.brutauth.auth.annotations.CustomBrutauthRules;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Controller;
import br.com.puppis.model.CadCidade;
import br.com.puppis.security.ModuleCadastroAccess;
import br.com.puppis.security.UserModuleCadastroAccess;

@Controller
@Path("cadastro/cidade")
@CustomBrutauthRules({ModuleCadastroAccess.class, UserModuleCadastroAccess.class})
public class CadCidadeController extends GenericController<CadCidade> {

}
