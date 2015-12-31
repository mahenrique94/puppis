package br.com.netsis.controller;

import javax.validation.Valid;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.interceptor.IncludeParameters;
import br.com.netsis.model.PsClasse;
import br.com.netsis.model.PsCusto;
import br.com.netsis.model.PsEstoque;
import br.com.netsis.model.PsGrupo;
import br.com.netsis.model.PsProdutoServico;

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
		if (obj.getId() != null && obj.getCusto().getId() == null && obj.getEstoque().getId() == null) {
			obj.setCusto(new PsCusto(obj.getIdgrupo().getId(), obj.getIdclasse().getId(), obj.getId()));
			obj.setEstoque(new PsEstoque(obj.getIdgrupo().getId(), obj.getIdclasse().getId(), obj.getId()));
		}
		super.salvar(obj);
	}
	
}
