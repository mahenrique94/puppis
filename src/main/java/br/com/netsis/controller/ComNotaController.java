package br.com.netsis.controller;

import java.util.ArrayList;
import java.util.List;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.interceptor.IncludeParameters;
import br.com.mhc.parametrosweb.ParametrosWeb;
import br.com.mhc.parametrosweb.ParametrosWebBuilder;
import br.com.netsis.estoque.Compra;
import br.com.netsis.estoque.Estoque;
import br.com.netsis.estoque.GerenciadorEstoque;
import br.com.netsis.estoque.Venda;
import br.com.netsis.model.ComNota;
import br.com.netsis.model.ComNotaItens;
import br.com.netsis.model.PsProdutoServico;

@Controller
@Path("nota")
public class ComNotaController extends GenericController<ComNota> {
	
	@Post("atualizar")
	public void atualizar(ComNota obj) {
		Estoque estoque = new Estoque();
		GerenciadorEstoque gerenciador;
		if (obj.getIdtipooperacao().getTipo().toString().equals("E"))
			gerenciador = new Compra();
		else
			gerenciador = new Venda();
		List<ParametrosWeb> parametrosWeb = new ArrayList<ParametrosWeb>();
		parametrosWeb.add(new ParametrosWeb("idnota", obj.getId().toString()));
		List<ComNotaItens> itens = this.getDao().findAll(ComNotaItens.class, parametrosWeb);
		for (ComNotaItens comNotaItens : itens) {
			estoque = estoque.criaEstoque(comNotaItens);
			PsProdutoServico item = new PsProdutoServico(estoque.getIdproduto());
			item = (PsProdutoServico) this.getDao().edit(item); 
			gerenciador.atualizaEstoque(item, estoque);
			this.getDao().save(item);
		}
		obj.setAtualizada("T");
		super.salvar(obj);
	}
	
	@Get("{obj.id}")
	@Override
	public void editar(ComNota obj) {
		// TODO Auto-generated method stub
		super.editar(obj);
	}
	
	@Get("")
	@Override
	public void listar(ComNota obj, List<ParametrosWeb> parametrosWeb) {
		// TODO Auto-generated method stub
		if (parametrosWeb == null) {
			parametrosWeb = new ArrayList<ParametrosWeb>();
		} 
		parametrosWeb.add(new ParametrosWeb("atualizada", "T", "<>"));
		super.listar(obj, parametrosWeb);
	}
	
	@Post("")
	@IncludeParameters
	@Override
	public void salvar(ComNota obj) {
		// TODO Auto-generated method stub
		ComNota comNota = (ComNota) this.getDao().edit(obj);
		obj.getCusto().calcularTotal(obj.getCusto(), comNota.getItens());
		super.salvar(obj);
	}
	
}