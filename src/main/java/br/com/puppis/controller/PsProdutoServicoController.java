package br.com.puppis.controller;

import java.util.ArrayList;
import java.util.List;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.mhc.parametrosweb.ParametrosWeb;
import br.com.puppis.model.PsCusto;
import br.com.puppis.model.PsEstoque;
import br.com.puppis.model.PsProdutoServico;

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
	@Override
	public void salvar(PsProdutoServico obj) {
		// TODO Auto-generated method stub
		super.setRedirect(false);
		if (obj.getId() == null) {
			obj.setCusto(new PsCusto());
			obj.getCusto().setIdprodutoservico(obj);
			obj.setEstoque(new PsEstoque());
			obj.getEstoque().setIdprodutoservico(obj);
		}
		super.salvar(obj);
		super.result.redirectTo(this).editar(super.getObj());
	}
	
	protected PsProdutoServico buscaProduto(int id) {
		List<ParametrosWeb> parametrosWeb = new ArrayList<ParametrosWeb>();
		parametrosWeb.add(new ParametrosWeb("id", Integer.toString(id)));
		return (PsProdutoServico) super.getDao().find(PsProdutoServico.class, parametrosWeb);
	}
	
}
