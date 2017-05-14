package br.com.puppis.controller;

import java.util.ArrayList;
import java.util.List;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Delete;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.mhc.parametrosweb.ParametrosWeb;
import br.com.puppis.model.TblPrecoValor;

@Controller
@Path("tabela-de-preco/valor")
public class TblPrecoValorController extends GenericController<TblPrecoValor> {
	
	@Delete("")
	@Override
	public void deletar(TblPrecoValor obj) {
		// TODO Auto-generated method stub
		super.setRedirect(false);
		super.deletar(obj);
		super.result.nothing();
	}
	
	@Get("{obj.id}")
	@Override
	public void editar(TblPrecoValor obj) {
		// TODO Auto-generated method stub
		super.editar(obj);
	}
	
	@Get("formulario/{obj.idtabelaprecopessoa.id}")
	@Override
	public void formulario(TblPrecoValor obj) {
		// TODO Auto-generated method stub
		super.result.include("obj", obj);
		super.formulario(obj);
	}
	
	@Get("loadgrid/{obj.idtabelaprecopessoa.id}")
	public void loadGrid(TblPrecoValor obj) {
		List<ParametrosWeb> parametrosWeb = new ArrayList<ParametrosWeb>();
		parametrosWeb.add(new ParametrosWeb("idtabelaprecopessoa.id", obj.getIdtabelaprecopessoa().getId().toString()));
		super.listar(obj, parametrosWeb);
	}
	
	@Post("")
	@Override
	public void salvar(TblPrecoValor obj) {
		// TODO Auto-generated method stub
		super.setRedirect(false);
		super.salvar(obj);
		super.result.nothing();
	}

}
