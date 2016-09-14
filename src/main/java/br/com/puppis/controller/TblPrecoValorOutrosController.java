package br.com.puppis.controller;

import java.util.ArrayList;
import java.util.List;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Delete;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.mhc.parametrosweb.ParametrosWeb;
import br.com.puppis.model.TblPrecoValorOutros;

@Controller
@Path("tabela-de-preco/valor/outros")
public class TblPrecoValorOutrosController extends GenericController<TblPrecoValorOutros> {
	
	@Delete("")
	@Override
	public void deletar(TblPrecoValorOutros obj) {
		// TODO Auto-generated method stub
		this.setRedirect(false);
		super.deletar(obj);
		this.result.nothing();
	}
	
	@Get("{obj.id}")
	@Override
	public void editar(TblPrecoValorOutros obj) {
		// TODO Auto-generated method stub
		super.editar(obj);
	}
	
	@Get("formulario/{obj.idtabelaprecopessoa.id}")
	@Override
	public void formulario(TblPrecoValorOutros obj) {
		// TODO Auto-generated method stub
		this.result.include("obj", obj);
		super.formulario(obj);
	}
	
	@Get("loadgrid/{obj.idtabelaprecopessoa.id}")
	public void loadGrid(TblPrecoValorOutros obj) {
		List<ParametrosWeb> parametrosWeb = new ArrayList<ParametrosWeb>();
		parametrosWeb.add(new ParametrosWeb("idtabelaprecopessoa.id", obj.getIdtabelaprecopessoa().getId().toString()));
		this.listar(obj, parametrosWeb);
	}
	
	@Post("")
	@Override
	public void salvar(TblPrecoValorOutros obj) {
		// TODO Auto-generated method stub
		this.setRedirect(false);
		super.salvar(obj);
		this.result.nothing();
	}

}
