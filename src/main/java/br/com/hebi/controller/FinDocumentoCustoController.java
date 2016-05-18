package br.com.hebi.controller;

import java.util.ArrayList;
import java.util.List;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Delete;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.interceptor.IncludeParameters;
import br.com.hebi.model.FinDocumentoCusto;
import br.com.mhc.parametrosweb.ParametrosWeb;

@Controller
@Path("financeiro/documento/custo")
public class FinDocumentoCustoController extends GenericController<FinDocumentoCusto> {
	
	@Delete("deletar/{obj.id}")
	@Override
	public void deletar(FinDocumentoCusto obj) {
		// TODO Auto-generated method stub
		obj = (FinDocumentoCusto) this.edit(obj);
		Long idDocumento = obj.getIddocumento().getId();
		this.setRedirect(false);
		super.deletar(obj);
		this.result.redirectTo("/financeiro/documento/custo/" + idDocumento);
	}
	
	@Get("{obj.id}")
	@Override
	public void editar(FinDocumentoCusto obj) {
		// TODO Auto-generated method stub
		super.editar(obj);
	}
	
	@Get
	@Path("formulario/{obj.iddocumento.id}")
	@Override
	public void formulario(FinDocumentoCusto obj) {
		// TODO Auto-generated method stub
		this.result.include("obj", obj);
		super.formulario(obj);
	}

	@Get("loadgrid/{obj.iddocumento.id}")
	public void loadGrid(FinDocumentoCusto obj) {
		List<ParametrosWeb> parametrosWeb = new ArrayList<ParametrosWeb>();
		parametrosWeb.add(new ParametrosWeb("iddocumento.id", obj.getIddocumento().getId().toString()));
		this.listar(obj, parametrosWeb);
	}
	
	@Post("")
	@IncludeParameters
	@Override
	public void salvar(FinDocumentoCusto obj) {
		// TODO Auto-generated method stub
		this.setRedirect(false);
		super.salvar(obj);
		this.result.redirectTo(FinDocumentoController.class).editar(obj.getIddocumento());
	}

}
