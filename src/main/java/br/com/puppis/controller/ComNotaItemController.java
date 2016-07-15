package br.com.puppis.controller;

import java.util.ArrayList;
import java.util.List;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Delete;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.interceptor.IncludeParameters;
import br.com.mhc.parametrosweb.ParametrosWeb;
import br.com.puppis.model.ComNotaItem;

@Controller
@Path("comercio/nota-item")
public class ComNotaItemController extends GenericController<ComNotaItem> {

	@Delete("")
	@Override
	public void deletar(ComNotaItem obj) {
		// TODO Auto-generated method stub
		this.setRedirect(false);
		super.deletar(obj);
		this.result.nothing();
	}
	
	@Get("{obj.id}")
	@Override
	public void editar(ComNotaItem obj) {
		// TODO Auto-generated method stub
		super.editar(obj);
	}
	
	@Get("formulario/{obj.idnota.id}")
	@Override
	public void formulario(ComNotaItem obj) {
		// TODO Auto-generated method stub
		this.result.include("obj", obj);
		super.formulario(obj);
	}
	
	@Get("loadgrid/{obj.idnota.id}")
	public void loadGrid(ComNotaItem obj) {
		List<ParametrosWeb> parametrosWeb = new ArrayList<ParametrosWeb>();
		parametrosWeb.add(new ParametrosWeb("idnota.id", obj.getIdnota().getId().toString()));
		this.listar(obj, parametrosWeb);
	}

	@Post("")
	@IncludeParameters
	@Override
	public void salvar(ComNotaItem obj) {
		// TODO Auto-generated method stub
		this.setRedirect(false);
		obj.calculaTotal();
		super.salvar(obj);
		this.result.nothing();
	}
	
}
