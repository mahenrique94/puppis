package br.com.hebi.controller;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.hebi.model.PesDefinicao;

@Controller
@Path("pessoa/definicao")
public class PesDefinicaoController extends GenericController<PesDefinicao> {
	
	@Get("{obj.id}")
	@Override
	public void editar(PesDefinicao obj) {
		// TODO Auto-generated method stub
		super.editar(obj);
	}

}
