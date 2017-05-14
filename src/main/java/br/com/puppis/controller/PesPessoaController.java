package br.com.puppis.controller;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.puppis.model.PesPessoa;

@Controller
@Path("pessoa")
public class PesPessoaController extends GenericController<PesPessoa> {

	@Get("{obj.id}")
	@Override
	public void editar(PesPessoa obj) {
		// TODO Auto-generated method stub
		super.editar(obj);
	}
	
	@Post("")
	@Override
	public void salvar(PesPessoa obj) {
		// TODO Auto-generated method stub
		super.setRedirect(false);
		if (obj.getId() == null) {
			obj.getEndereco().setIdpessoa(obj);
			obj.getDocumento().setIdpessoa(obj);
		}
		super.salvar(obj);
		super.result.redirectTo(this).editar(super.getObj());
	}
	
}
