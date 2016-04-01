package br.com.hebi.controller;

import java.util.ArrayList;
import java.util.List;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Delete;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.interceptor.IncludeParameters;
import br.com.hebi.model.FinDocumentoCentroCusto;
import br.com.mhc.parametrosweb.ParametrosWeb;

@Controller
@Path("financeiro/documento/centro-de-custo")
public class FinDocumentoCentroCustoController extends GenericController<FinDocumentoCentroCusto> {
	
	@Delete("deletar/{obj.id}")
	@Override
	public void deletar(FinDocumentoCentroCusto obj) {
		// TODO Auto-generated method stub
		obj = (FinDocumentoCentroCusto) this.edit(obj);
		Long idDocumento = obj.getIddocumento().getId();
		this.setRedirecionar(false);
		super.deletar(obj);
		this.result.redirectTo("/financeiro/documento/centro-de-custo/" + idDocumento);
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
		this.result.include("obj", obj);
		super.formulario(obj);
	}

	@Get("loadgrid/{obj.iddocumento.id}")
	public void loadGrid(FinDocumentoCentroCusto obj) {
		List<ParametrosWeb> parametrosWeb = new ArrayList<ParametrosWeb>();
		parametrosWeb.add(new ParametrosWeb("iddocumento.id", obj.getIddocumento().getId().toString()));
		this.listar(obj, parametrosWeb);
	}
	
	@Post("")
	@IncludeParameters
	@Override
	public void salvar(FinDocumentoCentroCusto obj) {
		// TODO Auto-generated method stub
		this.setRedirecionar(false);
		super.salvar(obj);
		this.result.redirectTo(FinDocumentoController.class).editar(obj.getIddocumento());
	}
	
}
