package br.com.hebi.controller;

import java.util.ArrayList;
import java.util.List;

import javax.validation.Valid;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.interceptor.IncludeParameters;
import br.com.hebi.model.PesDefinicao;
import br.com.mhc.parametrosweb.ParametrosWeb;

@Controller
@Path("pessoa/definicao")
public class PesDefinicaoController extends GenericController<PesDefinicao> {
	
	@Get("{obj.id}")
	@Override
	public void editar(PesDefinicao obj) {
		// TODO Auto-generated method stub
		super.editar(obj);
	}
	
	@Get("formulario/{obj.idpessoa.id}")
	@Override
	public void formulario(PesDefinicao obj) {
		// TODO Auto-generated method stub
		this.result.include("obj", obj);
		super.formulario(obj);
	}
	
	@Get("loadgrid/{obj.idpessoa.id}")
	public void loadGrid(PesDefinicao obj) {
		List<ParametrosWeb> parametrosWeb = new ArrayList<ParametrosWeb>();
		parametrosWeb.add(new ParametrosWeb("idpessoa.id", obj.getIdpessoa().getId().toString()));
		this.listar(obj, parametrosWeb);
	}
	
	@Post("")
	@IncludeParameters
	@Override
	public void salvar(@Valid PesDefinicao obj) {
		// TODO Auto-generated method stub
		this.setRedirect(false);
		super.salvar(obj);
		this.result.redirectTo(PesPessoaController.class).editar(obj.getIdpessoa());
	}

}
