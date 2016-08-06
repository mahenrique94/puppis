package br.com.puppis.controller;

import br.com.caelum.brutauth.auth.annotations.CustomBrutauthRules;
import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.puppis.model.PsProdutoServico;
import br.com.puppis.security.ModuleCadastroAccess;
import br.com.puppis.security.UserModuleCadastroAccess;

@Controller
@Path("produto-servico")
@CustomBrutauthRules({ModuleCadastroAccess.class, UserModuleCadastroAccess.class})
public class PsProdutoServicoController extends GenericController<PsProdutoServico> {

	@Get("{obj.id}")
	@Override
	public void editar(PsProdutoServico obj) {
		// TODO Auto-generated method stub
		super.editar(obj);
	}
	
	@Post("")
	@Override
	public void salvar(PsProdutoServico obj) {
		// TODO Auto-generated method stub
		this.setRedirect(false);
		if (obj.getId() == null) {
			obj.getCusto().novo();
			obj.getCusto().setIdprodutoservico(obj);
			obj.getEstoque().novo();
			obj.getEstoque().setIdprodutoservico(obj);
		}
		super.salvar(obj);
		this.result.redirectTo(this).editar(this.getObj());
	}
	
}
