package br.com.puppis.controller;

import java.util.ArrayList;
import java.util.List;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.mhc.parametrosweb.ParametrosWeb;
import br.com.puppis.model.AdmPermissao;
import br.com.puppis.model.AdmUsuario;

@Controller
@Path("administrador/permissao")
public class AdmPermissaoController extends GenericController<AdmPermissao> {

	@Get("{obj.id}")
	@Override
	public void editar(AdmPermissao obj) {
		// TODO Auto-generated method stub
		this.result.include("AdmUsuarioList", buscaUsuarios());
		super.editar(obj);
	}
	
	@Get("formulario/{obj.tabela}")
	@Override
	public void formulario(AdmPermissao obj) {
		// TODO Auto-generated method stub
		this.result.include("obj", obj).include("AdmUsuarioList", buscaUsuarios());
		super.formulario(obj);
	}
	
	@Post("")
	@Override
	public void salvar(AdmPermissao obj) {
		// TODO Auto-generated method stub
		this.setRedirect(false);
		super.salvar(obj);
		this.result.redirectTo(this).listar(obj, criaLista(obj.getTabela()));
	}
	
	private List<ParametrosWeb> criaLista(String tabela) {
		List<ParametrosWeb> parametrosWeb = new ArrayList<ParametrosWeb>();
		parametrosWeb.add(new ParametrosWeb("tabela", tabela));
		return parametrosWeb;
	}
	
	private List<AdmUsuario> buscaUsuarios() {
		return this.getDao().findAll(AdmUsuario.class, null);
	}
	
}
