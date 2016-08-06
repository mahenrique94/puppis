package br.com.puppis.controller;

import br.com.caelum.brutauth.auth.annotations.CustomBrutauthRules;
import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.puppis.model.FinFormaPagamento;
import br.com.puppis.security.ModuleCadastroAccess;
import br.com.puppis.security.ModuleFinanceiroAccess;
import br.com.puppis.security.UserModuleFinanceiroAccess;

@Controller
@Path("financeiro/forma-de-pagamento")
@CustomBrutauthRules({ModuleCadastroAccess.class, ModuleFinanceiroAccess.class, UserModuleFinanceiroAccess.class})
public class FinFormaPagamentoController extends GenericController<FinFormaPagamento> {

	@Get("{obj.id}")
	@Override
	public void editar(FinFormaPagamento obj) {
		// TODO Auto-generated method stub
		super.editar(obj);
	}
	
}
