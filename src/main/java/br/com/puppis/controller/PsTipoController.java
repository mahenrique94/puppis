package br.com.puppis.controller;

import br.com.caelum.brutauth.auth.annotations.CustomBrutauthRules;
import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Path;
import br.com.puppis.model.PsTipo;
import br.com.puppis.security.ModuleCadastroAccess;
import br.com.puppis.security.UserModuleCadastroAccess;

@Controller
@Path("produto-servico/tipo")
@CustomBrutauthRules({ModuleCadastroAccess.class, UserModuleCadastroAccess.class})
public class PsTipoController extends GenericController<PsTipo> {

}
