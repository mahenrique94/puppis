package br.com.puppis.controller;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.puppis.model.AdmPermissao;

@Controller
@Path("administrador/permissao")
public class AdmPermissaoController extends GenericController<AdmPermissao> {

	@Get("{obj.idusuario.id}")
	public void permissao(AdmPermissao obj) {
		
	}
	
}
