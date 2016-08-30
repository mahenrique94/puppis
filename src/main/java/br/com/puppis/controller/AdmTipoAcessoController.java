package br.com.puppis.controller;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.puppis.model.AdmTipoAcesso;

@Controller
@Path("administrador/usuario/tipo-de-acesso")
public class AdmTipoAcessoController extends GenericController<AdmTipoAcesso> {

	@Get("{obj.id}")
	@Override
	public void editar(AdmTipoAcesso obj) {
		// TODO Auto-generated method stub
		super.editar(obj);
	}

}
