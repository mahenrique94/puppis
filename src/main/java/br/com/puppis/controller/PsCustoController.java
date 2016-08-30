package br.com.puppis.controller;

import br.com.caelum.brutauth.auth.annotations.CustomBrutauthRules;
import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Path;
import br.com.puppis.model.PsCusto;

@Controller
@Path("produto-servico/custo")
public class PsCustoController extends GenericController<PsCusto> {

}
