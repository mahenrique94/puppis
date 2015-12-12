package br.com.netsis.controller;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.netsis.model.CadCentroCusto;

@Controller
@Path("centro-de-custo")
public class CadCentroCustoController extends GenericController<CadCentroCusto> {

	@Get("{obj.id}")
	@Override
	public void editar(CadCentroCusto obj) {
		// TODO Auto-generated method stub
		super.editar(obj);
	}
	
}
