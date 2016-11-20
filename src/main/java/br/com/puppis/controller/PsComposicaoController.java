package br.com.puppis.controller;

import java.util.ArrayList;
import java.util.List;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Delete;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.mhc.parametrosweb.ParametrosWeb;
import br.com.puppis.model.PsComposicao;

@Controller
@Path("produto-servico/composicao")
public class PsComposicaoController extends GenericController<PsComposicao> {
	
	@Delete("")
	@Override
	public void deletar(PsComposicao obj) {
		// TODO Auto-generated method stub
		this.setRedirect(false);
		super.deletar(obj);
		this.result.nothing();
	}
	
	@Get("{obj.id}")
	@Override
	public void editar(PsComposicao obj) {
		// TODO Auto-generated method stub
		super.editar(obj);
	}
	
	@Get("formulario/{obj.idprodutoservico.id}")
	@Override
	public void formulario(PsComposicao obj) {
		// TODO Auto-generated method stub
		this.result.include("obj", obj);
		super.formulario(obj);
	}
	
	@Get("loadgrid/{obj.idprodutoservico.id}")
	public void loadGrid(PsComposicao obj) {
		List<ParametrosWeb> parametrosWeb = new ArrayList<ParametrosWeb>();
		parametrosWeb.add(new ParametrosWeb("idprodutoservico.id", obj.getIdprodutoservico().getId().toString()));
		this.listar(obj, parametrosWeb);
	}
	
	@Post("")
	@Override
	public void salvar(PsComposicao obj) {
		// TODO Auto-generated method stub
		this.setRedirect(false);
		super.salvar(obj);
		this.result.nothing();
	}

}
