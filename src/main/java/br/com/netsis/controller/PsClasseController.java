package br.com.netsis.controller;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.netsis.model.PsClasse;

@Controller
@Path("produto-servico/classe")
public class PsClasseController extends GenericController<PsClasse> {

	@Get("{obj.id}")
	@Override
	public void editar(PsClasse obj) {
		// TODO Auto-generated method stub
		super.editar(obj);
	}
	
}
