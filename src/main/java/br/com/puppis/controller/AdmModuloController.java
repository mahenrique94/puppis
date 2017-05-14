package br.com.puppis.controller;

import java.util.ArrayList;
import java.util.List;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Delete;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.mhc.parametrosweb.ParametrosWeb;
import br.com.puppis.model.AdmModulo;

@Controller
@Path("administrador/comercio/modulo")
public class AdmModuloController extends GenericController<AdmModulo> {

	@Delete("")
	@Override
	public void deletar(AdmModulo obj) {
		// TODO Auto-generated method stub
		super.setRedirect(false);
		super.deletar(obj);
		super.result.nothing();
	}
	
	@Get("{obj.id}")
	@Override
	public void editar(AdmModulo obj) {
		// TODO Auto-generated method stub
		super.editar(obj);
	}
	
	@Get("formulario/{obj.idcomercio.id}")
	@Override
	public void formulario(AdmModulo obj) {
		// TODO Auto-generated method stub
		super.result.include("obj", obj);
		super.formulario(obj);
	}
	
	@Get("loadgrid/{obj.idcomercio.id}")
	public void loadGrid(AdmModulo obj) {
		List<ParametrosWeb> parametrosWeb = new ArrayList<ParametrosWeb>();
		parametrosWeb.add(new ParametrosWeb("idcomercio.id", obj.getIdcomercio().getId().toString()));
		super.listar(obj, parametrosWeb);
	}
	
	@Post("")
	@Override
	public void salvar(AdmModulo obj) {
		// TODO Auto-generated method stub
		super.setRedirect(false);
		super.salvar(obj);
		super.result.nothing();
	}
	
}
