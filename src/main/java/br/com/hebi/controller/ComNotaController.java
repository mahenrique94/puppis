package br.com.hebi.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.inject.Inject;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.interceptor.IncludeParameters;
import br.com.hebi.estoque.Compra;
import br.com.hebi.estoque.Estoque;
import br.com.hebi.estoque.GerenciadorEstoque;
import br.com.hebi.estoque.Venda;
import br.com.hebi.model.ComNota;
import br.com.hebi.model.ComNotaItens;
import br.com.hebi.model.PsProdutoServico;
import br.com.mhc.parametrosweb.ParametrosWeb;
import br.com.mhc.parametrosweb.ParametrosWebBuilder;

@Controller
@Path("comercio/nota")
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
		obj.setDataatualizacao(Calendar.getInstance());
		super.salvar(obj);
	}
	
	@Post("calcular")
	public void calcular(ComNota obj) {
		this.setRedirect(false);
		obj = (ComNota) this.getDao().edit(obj);
		double icms = 0.0;
		double ipi = 0.0;
		double desconto = 0.0;
		double total = 0.0;
		if (obj.getItens() != null && !obj.getItens().isEmpty()) {
			for (ComNotaItens item : obj.getItens()) {
				icms += item.getPorcicms();
				ipi += item.getPorcipi();
				desconto += item.getPorcdesconto();
				total += item.getValortotal();
			}
		}
		obj.getCusto().setPorcicms(icms);
		obj.getCusto().setPorcipi(ipi);
		obj.getCusto().setPorcdesconto(desconto);
		obj.getCusto().setValortotal(total);
		super.salvar(obj);
		this.result.redirectTo(this).editar(obj);
		
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
		if (obj.getId() != null) {
			ComNota comNota = (ComNota) this.getDao().edit(obj);
			obj.getCusto().calcularTotal(obj.getCusto(), comNota.getItens());
		}
		super.salvar(obj);
	}
	
}