package br.com.puppis.controller;

import java.util.ArrayList;
import java.util.List;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Delete;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.mhc.parametrosweb.ParametrosWeb;
import br.com.puppis.model.FinDocumentoCentroCusto;

@Controller
@Path("financeiro/documento/centro-de-custo")
public class FinDocumentoCentroCustoController extends GenericController<FinDocumentoCentroCusto> {
	
	@Delete("")
	@Override
	public void deletar(FinDocumentoCentroCusto obj) {
		// TODO Auto-generated method stub
		super.setRedirect(false);
		super.deletar(obj);
		super.result.nothing();
	}
	
	@Get("{obj.id}")
	@Override
	public void editar(FinDocumentoCentroCusto obj) {
		// TODO Auto-generated method stub
		super.editar(obj);
	}
	
	@Get
	@Path("formulario/{obj.iddocumento.id}")
	@Override
	public void formulario(FinDocumentoCentroCusto obj) {
		// TODO Auto-generated method stub
		super.result.include("obj", obj);
		super.formulario(obj);
	}

	@Get("loadgrid/{obj.iddocumento.id}")
	public void loadGrid(FinDocumentoCentroCusto obj) {
		List<ParametrosWeb> parametrosWeb = new ArrayList<ParametrosWeb>();
		parametrosWeb.add(new ParametrosWeb("iddocumento.id", obj.getIddocumento().getId().toString()));
		super.listar(obj, parametrosWeb);
	}
	
	@Post("")
	@Override
	public void salvar(FinDocumentoCentroCusto obj) {
		// TODO Auto-generated method stub
		super.setRedirect(false);
		super.salvar(obj);
		super.result.nothing();
	}
	
}
