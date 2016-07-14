package br.com.pupis.controller;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.pupis.model.FinHistorico;

@Controller
@Path("financeiro/historico")
public class FinHistoricoController extends GenericController<FinHistorico> {
	
	@Get("{obj.id}")
	@Override
	public void editar(FinHistorico obj) {
		// TODO Auto-generated method stub
		super.editar(obj);
	}

}
