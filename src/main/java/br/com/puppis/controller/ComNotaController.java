package br.com.puppis.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.inject.Inject;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.interceptor.IncludeParameters;
import br.com.mhc.parametrosweb.ParametrosWeb;
import br.com.puppis.estoque.Gerenciador;
import br.com.puppis.estoque.GerenciadorFactory;
import br.com.puppis.model.ComNota;
import br.com.puppis.model.ComNotaItem;

@Controller
@Path("comercio/nota")
public class ComNotaController extends GenericController<ComNota> {
	
	@Inject
	private FinDocumentoController finDocumentoController;
	
	@Post("atualizar")
	public void atualizar(ComNota obj) {
		obj = (ComNota) this.getDao().edit(obj);
		Gerenciador gerenciador = GerenciadorFactory.cria(obj.getIdtipooperacao().getDescricao());
		for (ComNotaItem item : obj.getItens()) {
			gerenciador.gerencia(this.getDao(), item.getIdprodutoservico().getId(), item.getQuantidade(), item.getValorVenda());
		}
		finDocumentoController.atualizaFinanceiro(criaParametrosAtualizarFinanceiro(obj));
		obj.setDataatualizacao(Calendar.getInstance());
		this.result.include("mensagem", "Nota atualizada com sucesso");
		this.result.redirectTo(this).listar(obj, null);
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
	
	private List<ParametrosWeb> criaParametrosAtualizarFinanceiro(ComNota obj) {
		// TODO Auto-generated method stub
		List<ParametrosWeb> parametrosWeb = new ArrayList<ParametrosWeb>();
		parametrosWeb.add(new ParametrosWeb(null, obj.getCusto().getIdformapagamento().getId().toString())); // FORMAPAGAMENTO
		parametrosWeb.add(new ParametrosWeb(null, obj.getIddefinicao().getId().toString())); // DEFINICAO
		parametrosWeb.add(new ParametrosWeb(null, "1")); // CONTABANCARIA
		parametrosWeb.add(new ParametrosWeb(null, "1")); // TIPODOCUMENTO, 1 = CUPOM FISCAL
		parametrosWeb.add(new ParametrosWeb(null, obj.getNumero() != null ? obj.getNumero().toString() : obj.getId().toString())); // NUMERODOCUMENTO
		parametrosWeb.add(new ParametrosWeb(null, obj.getSerie() != null ? obj.getSerie().toString() : null)); // SERIE
		parametrosWeb.add(new ParametrosWeb(null, obj.getDataemissao() != null ? new SimpleDateFormat("dd/MM/yyyy").format(obj.getDataemissao().getTime()) : new SimpleDateFormat("dd/MM/yyyy").format(obj.getDatacreate().getTime()))); // DATAEMISSAO
		parametrosWeb.add(new ParametrosWeb(null, obj.getCusto().getValortotal().toString())); // VALORTOTAL
		parametrosWeb.add(new ParametrosWeb(null, "0")); // HISTORICO, 0 = EM BRANCO
		parametrosWeb.add(new ParametrosWeb(null, "3")); // OPERACAO, 3 = ENTRADA FINANCEIRO
		parametrosWeb.add(new ParametrosWeb(null, null)); // DESDOBRAMENTOINICIAL
		return parametrosWeb;
	}
	
}