package br.com.pupis.controller;

import javax.validation.Valid;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.interceptor.IncludeParameters;
import br.com.pupis.model.PsClasse;
import br.com.pupis.model.PsCusto;
import br.com.pupis.model.PsEstoque;
import br.com.pupis.model.PsGrupo;
import br.com.pupis.model.PsProdutoServico;

@Controller
@Path("produto-servico")
public class PsProdutoServicoController extends GenericController<PsProdutoServico> {

	@Get("{obj.id}")
	@Override
	public void editar(PsProdutoServico obj) {
		// TODO Auto-generated method stub
		super.editar(obj);
	}
	
	@Post("")
	@IncludeParameters
	@Override
	public void salvar(@Valid PsProdutoServico obj) {
		// TODO Auto-generated method stub
		if (obj.getId() == null && obj.getCusto().getId() == null && obj.getEstoque().getId() == null) {
			obj.getCusto().novo();
			obj.getCusto().setIdprodutoservico(obj);
			obj.getEstoque().novo();
			obj.getEstoque().setIdprodutoservico(obj);
		}
		super.salvar(obj);
	}
	
}
