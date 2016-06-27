package br.com.hebi.controller;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.hebi.model.FinFormaPagamento;

@Controller
@Path("financeiro/forma-de-pagamento")
public class FinFormaPagamentoController extends GenericController<FinFormaPagamento> {

	@Get("{obj.id}")
	@Override
	public void editar(FinFormaPagamento obj) {
		// TODO Auto-generated method stub
		super.editar(obj);
	}
	
}
