package br.com.puppis.controller;

import java.util.ArrayList;
import java.util.List;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Delete;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.mhc.parametrosweb.ParametrosWeb;
import br.com.puppis.model.AdmUsuarioComercio;

@Controller
@Path("administrador/usuario/comercio")
public class AdmUsuarioComercioController extends GenericController<AdmUsuarioComercio> {

	@Delete("")
	@Override
	public void deletar(AdmUsuarioComercio obj) {
		// TODO Auto-generated method stub
		super.setRedirect(false);
		super.deletar(obj);
		super.result.nothing();
	}
	
	@Get("{obj.id}")
	@Override
	public void editar(AdmUsuarioComercio obj) {
		// TODO Auto-generated method stub
		super.editar(obj);
	}
	
	@Get("formulario/{obj.idusuario.id}")
	@Override
	public void formulario(AdmUsuarioComercio obj) {
		// TODO Auto-generated method stub
		super.result.include("obj", obj);
		super.formulario(obj);
	}
	
	@Get("loadgrid/{obj.idusuario.id}")
	public void loadGrid(AdmUsuarioComercio obj) {
		List<ParametrosWeb> parametrosWeb = new ArrayList<ParametrosWeb>();
		parametrosWeb.add(new ParametrosWeb("idusuario.id", obj.getIdusuario().getId().toString()));
		super.listar(obj, parametrosWeb);
	}
	
	@Post("")
	@Override
	public void salvar(AdmUsuarioComercio obj) {
		// TODO Auto-generated method stub
		super.setRedirect(false);
		super.salvar(obj);
		super.result.nothing();
	}
	
}
