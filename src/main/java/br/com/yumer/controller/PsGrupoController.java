package br.com.yumer.controller;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.yumer.model.PsGrupo;

@Controller
@Path("produto-servico/grupo")
public class PsGrupoController extends GenericController<PsGrupo> {

	@Get("{obj.id}")
	@Override
	public void editar(PsGrupo obj) {
		// TODO Auto-generated method stub
		super.editar(obj);
	}
	
}
