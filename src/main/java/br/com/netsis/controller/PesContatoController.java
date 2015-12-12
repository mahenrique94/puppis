package br.com.netsis.controller;

import java.util.ArrayList;
import java.util.List;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Delete;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.interceptor.IncludeParameters;
import br.com.mhc.parametrosweb.ParametrosWeb;
import br.com.netsis.model.PesContato;

@Controller
@Path("contato")
public class PesContatoController extends GenericController<PesContato> {

	@Delete("deletar/{obj.id}")
	@Override
	public void deletar(PesContato obj) {
		// TODO Auto-generated method stub
		obj = (PesContato) this.edit(obj);
		Long idPessoa = obj.getIdpessoa().getId();
		this.setRedirecionar(false);
		super.deletar(obj);
		this.result.redirectTo("/pessoa/editar/" + idPessoa);
	}
	
	@Get("{obj.id}")
	@Override
	public void editar(PesContato obj) {
		// TODO Auto-generated method stub
		super.editar(obj);
	}
	
	@Get
	@Path("formulario/{obj.idpessoa.id}")
	@Override
	public void formulario(PesContato obj) {
		// TODO Auto-generated method stub
		this.result.include("obj", obj);
		super.formulario(obj);
	}
	
	@Get("loadgrid/{obj.idpessoa.id}")
	public void loadGrid(PesContato obj) {
		List<ParametrosWeb> parametrosWeb = new ArrayList<ParametrosWeb>();
		parametrosWeb.add(new ParametrosWeb("idpessoa.id", obj.getIdpessoa().getId().toString()));
		this.listar(obj, parametrosWeb);
	}
	
	@Post("")
	@IncludeParameters
	@Override
	public void salvar(PesContato obj) {
		// TODO Auto-generated method stub
		this.setRedirecionar(false);
		super.salvar(obj);
		this.result.redirectTo(PesPessoaController.class).editar(obj.getIdpessoa());
	}
}
