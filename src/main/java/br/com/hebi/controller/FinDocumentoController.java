package br.com.hebi.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.inject.Inject;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.hebi.model.FinDocumento;
import br.com.hebi.model.FinDocumentoCusto;
import br.com.hebi.model.FinExtrato;
import br.com.mhc.parametrosweb.ParametrosWeb;
import br.com.mhc.util.Functions;

@Controller
@Path("financeiro/documento")
public class FinDocumentoController extends GenericController<FinDocumento> {
	
	@Inject
	private SysTipoOperacaoController sysTipoOperacaoController;
	
	public FinDocumentoController(SysTipoOperacaoController sysTipoOperacaoController) {
		// TODO Auto-generated constructor stub
		this.sysTipoOperacaoController = sysTipoOperacaoController;
	}
	
	@Deprecated
	public FinDocumentoController() {
		// TODO Auto-generated constructor stub
	}
	
	@Post("atualizar")
	public void atualizar(FinDocumento obj) {
		FinDocumento finDocumento = (FinDocumento) this.getDao().edit(obj);
		obj.setAtualizado(true);
		for (FinDocumentoCusto finDocumentoCusto : finDocumento.getCustos()) {
			this.getDao().save(new FinExtrato().criar(finDocumentoCusto, this.sysTipoOperacaoController.buscaOperacaoPorDescricao(obj.getIdtipooperacao().getDescricao())));
		}
		super.salvar(obj);;
	}
	
	@Post("calcular")
	public void calcular(FinDocumento obj) {
		for(int i = 1; i <= obj.getIdformapagamento().getQuantidadeparcela(); i++) {
			this.getDao().save(new FinDocumentoCusto().criar(obj, i));
		}
		this.result.redirectTo(this).editar(obj);
	}
	
	@Get("{obj.id}")
	@Override
	public void editar(FinDocumento obj) {
		// TODO Auto-generated method stub
		super.editar(obj);
	}
	
	@Get("")
	@Override
	public void listar(FinDocumento obj, List<ParametrosWeb> parametrosWeb) {
		// TODO Auto-generated method stub
		if (parametrosWeb == null) {
			parametrosWeb = new ArrayList<ParametrosWeb>();
		}
		parametrosWeb.add(new ParametrosWeb("atualizado", "true", "<>"));
		super.listar(obj, parametrosWeb);
	}

}
