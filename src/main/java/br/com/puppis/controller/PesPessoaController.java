package br.com.puppis.controller;

import br.com.caelum.brutauth.auth.annotations.CustomBrutauthRules;
import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.puppis.model.PesPessoa;
import br.com.puppis.security.ModuleCadastroAccess;
import br.com.puppis.security.UserModuleCadastroAccess;

@Controller
@Path("pessoa")
@CustomBrutauthRules({ModuleCadastroAccess.class, UserModuleCadastroAccess.class})
public class PesPessoaController extends GenericController<PesPessoa> {

	@Get("{obj.id}")
	@Override
	public void editar(PesPessoa obj) {
		// TODO Auto-generated method stub
		super.editar(obj);
	}
	
	@Post("")
	@Override
	public void salvar(PesPessoa obj) {
		// TODO Auto-generated method stub
		this.setRedirect(false);
		if (obj.getId() == null) {
			obj.getEndereco().setIdpessoa(obj);
			obj.getDocumento().setIdpessoa(obj);
		}
		super.salvar(obj);
		this.result.redirectTo(this).editar(this.getObj());
	}
	
}
