package br.com.puppis.controller;

import java.util.ArrayList;
import java.util.List;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Delete;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.view.Results;
import br.com.mhc.parametrosweb.ParametrosWeb;
import br.com.puppis.model.PesDefinicao;

@Controller
@Path("pessoa/definicao")
public class PesDefinicaoController extends GenericController<PesDefinicao> {

	@Delete("")
	@Override
	public void deletar(PesDefinicao obj) {
		// TODO Auto-generated method stub
		super.setRedirect(false);
		super.deletar(obj);
		super.result.nothing();
	}
	
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
		super.result.include("obj", obj);
		super.formulario(obj);
	}
	
	@Get("json")
	@Override
	public void toJSON(PesDefinicao obj, List<ParametrosWeb> parametrosWeb) {
		// TODO Auto-generated method stub
		List<PesDefinicao> list = getDao().findAll(obj.getClass(), parametrosWeb);
		super.result.use(Results.json()).from(list).include("idpessoa").include("idtipo").serialize();
	}
	
	@Get("loadgrid/{obj.idpessoa.id}")
	public void loadGrid(PesDefinicao obj) {
		List<ParametrosWeb> parametrosWeb = new ArrayList<ParametrosWeb>();
		parametrosWeb.add(new ParametrosWeb("idpessoa.id", obj.getIdpessoa().getId().toString()));
		super.listar(obj, parametrosWeb);
	}
	
	@Post("")
	@Override
	public void salvar(PesDefinicao obj) {
		// TODO Auto-generated method stub
		super.setRedirect(false);
		super.salvar(obj);
		super.result.nothing();
	}

}
