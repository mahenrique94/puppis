package br.com.netsis.controller;

import javax.validation.Valid;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.interceptor.IncludeParameters;
import br.com.netsis.model.PsClasse;
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
			obj.getCusto().setIdgrupo(new PsGrupo(obj.getIdgrupo().getId()));
			obj.getCusto().setIdclasse(new PsClasse(obj.getIdclasse().getId()));
			obj.getCusto().setIdproduto(new PsProdutoServico(obj.getId()));
			obj.getCusto().setPorclucro(0.0);
			obj.getCusto().setValoranterior(0.0);
			obj.getCusto().setValorvenda(0.0);
			obj.getCusto().setValorpago(0.0);
			obj.getCusto().setValortotal(0.0);
			obj.getEstoque().setIdgrupo(new PsGrupo(obj.getIdgrupo().getId()));
			obj.getEstoque().setIdclasse(new PsClasse(obj.getIdclasse().getId()));
			obj.getEstoque().setIdproduto(new PsProdutoServico(obj.getId()));
			obj.getEstoque().setQuantidade(0);
			obj.getEstoque().setQuantidadeven(0);
		}
		super.salvar(obj);
	}
	
}
