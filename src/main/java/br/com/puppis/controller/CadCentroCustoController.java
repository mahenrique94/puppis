package br.com.puppis.controller;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.puppis.model.CadCentroCusto;

@Controller
@Path("cadastro/centro-de-custo")
public class CadCentroCustoController extends GenericController<CadCentroCusto> {

	@Get("{obj.id}")
	@Override
	public void editar(CadCentroCusto obj) {
		// TODO Auto-generated method stub
		super.editar(obj);
	}
	
}
