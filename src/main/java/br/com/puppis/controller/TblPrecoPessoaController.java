package br.com.puppis.controller;

import java.util.ArrayList;
import java.util.List;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Delete;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.mhc.parametrosweb.ParametrosWeb;
import br.com.puppis.model.TblPrecoPessoa;

@Controller
@Path("tabela-de-preco/pessoa")
public class TblPrecoPessoaController extends GenericController<TblPrecoPessoa> {
	
	@Delete("")
	@Override
	public void deletar(TblPrecoPessoa obj) {
		// TODO Auto-generated method stub
		super.setRedirect(false);
		super.deletar(obj);
		super.result.nothing();
	}
	
	@Get("{obj.id}")
	@Override
	public void editar(TblPrecoPessoa obj) {
		// TODO Auto-generated method stub
		super.editar(obj);
	}
	
	@Get("formulario/{obj.idtabelapreco.id}")
	@Override
	public void formulario(TblPrecoPessoa obj) {
		// TODO Auto-generated method stub
		super.result.include("obj", obj);
		super.formulario(obj);
	}
	
	@Get("loadgrid/{obj.idtabelapreco.id}")
	public void loadGrid(TblPrecoPessoa obj) {
		List<ParametrosWeb> parametrosWeb = new ArrayList<ParametrosWeb>();
		parametrosWeb.add(new ParametrosWeb("idtabelapreco.id", obj.getIdtabelapreco().getId().toString()));
		super.listar(obj, parametrosWeb);
	}
	
	@Post("")
	@Override
	public void salvar(TblPrecoPessoa obj) {
		// TODO Auto-generated method stub
		super.setRedirect(false);
		super.salvar(obj);
		super.result.nothing();
	}

}
