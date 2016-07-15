package br.com.puppis.controller;

import java.util.ArrayList;
import java.util.List;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.interceptor.IncludeParameters;
import br.com.mhc.parametrosweb.ParametrosWeb;
import br.com.puppis.model.ComNota;
import br.com.puppis.model.ComNotaItem;

@Controller
@Path("comercio/nota")
public class ComNotaController extends GenericController<ComNota> {
	
	@Post("atualizar")
	public void atualizar(ComNota obj) {
		
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
			for (ComNotaItem item : obj.getItens()) {
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
		parametrosWeb.add(new ParametrosWeb("dataatualizacao", null, null, "is not null"));
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