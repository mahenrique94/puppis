package br.com.puppis.controller;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.mhc.parametrosweb.ParametrosWeb;
import br.com.puppis.model.AdmUsuario;

import java.util.List;

@Controller
@Path("administrador/usuario")
public class AdmUsuarioController extends GenericController<AdmUsuario> {
	
	@Get("{obj.id}")
	@Override
	public void editar(AdmUsuario obj) {
		// TODO Auto-generated method stub
		super.editar(obj);
	}

	@Get("")
	@Override
	public void listar(AdmUsuario obj, List<ParametrosWeb> parametrosWeb) {
		super.listar(obj, super.filterIdGreaterThanOne(parametrosWeb));
	}

	@Post("")
	@Override
	public void salvar(AdmUsuario obj) {
		// TODO Auto-generated method stub
		super.setRedirect(false);
		super.salvar(obj);
		super.result.redirectTo(this).editar(super.getObj());
	}
	
}
