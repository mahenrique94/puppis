package br.com.puppis.controller;

import br.com.caelum.brutauth.auth.annotations.CustomBrutauthRules;
import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Path;
import br.com.puppis.model.CadEstado;
import br.com.puppis.security.ModuleCadastroAccess;
import br.com.puppis.security.UserModuleCadastroAccess;

@Controller
@Path("cadastro/estado")
@CustomBrutauthRules({ModuleCadastroAccess.class, UserModuleCadastroAccess.class})
public class CadEstadoController extends GenericController<CadEstado> {

}
