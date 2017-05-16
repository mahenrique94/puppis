package br.com.puppis.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.mhc.parametrosweb.ParametrosWeb;
import br.com.puppis.model.AdmGrupo;
import br.com.puppis.model.AdmPermissao;
import br.com.puppis.model.AdmUsuario;

@Controller
@Path("administrador/permissao")
public class AdmPermissaoController extends GenericController<AdmPermissao> {

	private AdmUsuarioController admUsuarioController;
	private AdmGrupoController admGrupoController;

	@Inject
	public AdmPermissaoController(AdmUsuarioController admUsuarioController, AdmGrupoController admGrupoController) {
		// TODO Auto-generated constructor stub
		this.admUsuarioController = admUsuarioController;
		this.admGrupoController = admGrupoController;
	}
	@Deprecated
	public AdmPermissaoController() {
		// TODO Auto-generated constructor stub
	}
	
	@Get("{obj.id}")
	@Override
	public void editar(AdmPermissao obj) {
		// TODO Auto-generated method stub
		super.result.include("AdmUsuarioList", this.admUsuarioController.buscarTodos(AdmUsuario.class)).include("AdmGrupoList", this.admGrupoController.buscarTodos(AdmGrupo.class));
		super.editar(obj);
	}
	
	@Get("formulario/{obj.tabela}")
	@Override
	public void formulario(AdmPermissao obj) {
		// TODO Auto-generated method stub
		super.result.include("obj", obj).include("AdmUsuarioList", this.admUsuarioController.buscarTodos(AdmUsuario.class)).include("AdmGrupoList", this.admGrupoController.buscarTodos(AdmGrupo.class));
		super.formulario(obj);
	}
	
	@Post("")
	@Override
	public void salvar(AdmPermissao obj) {
		// TODO Auto-generated method stub
		super.setRedirect(false);
		if (obj.getIdgrupo() == null || obj.getIdgrupo().getId() == null)
			obj.setIdgrupo(null);
		if (obj.getIdusuario() == null || obj.getIdusuario().getId() == null)
			obj.setIdusuario(null);
		super.salvar(obj);
		super.result.redirectTo(this).listar(obj, criaLista(obj.getTabela()));
	}
	
	private List<ParametrosWeb> criaLista(String tabela) {
		List<ParametrosWeb> parametrosWeb = new ArrayList<ParametrosWeb>();
		parametrosWeb.add(new ParametrosWeb("tabela", tabela));
		return parametrosWeb;
	}
	
}
