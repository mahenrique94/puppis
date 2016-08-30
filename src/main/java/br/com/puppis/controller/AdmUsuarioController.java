package br.com.puppis.controller;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.puppis.model.AdmUsuario;

@Controller
@Path("administrador/usuario")
public class AdmUsuarioController extends GenericController<AdmUsuario> {
	
	@Get("{obj.id}")
	@Override
	public void editar(AdmUsuario obj) {
		// TODO Auto-generated method stub
		super.editar(obj);
	}
	
	@Post("")
	@Override
	public void salvar(AdmUsuario obj) {
		// TODO Auto-generated method stub
		this.setRedirect(false);
		super.salvar(obj);
		this.result.redirectTo(this).editar(this.getObj());
	}
	
}
