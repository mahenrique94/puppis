package br.com.puppis.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.mhc.parametrosweb.ParametrosWeb;
import br.com.puppis.financeiro.Gerenciador;
import br.com.puppis.financeiro.GerenciadorFactory;
import br.com.puppis.model.FinDocumento;
import br.com.puppis.model.FinDocumentoCentroCusto;
import br.com.puppis.model.FinFormaPagamento;
import br.com.puppis.model.SysTipoOperacao;

@Controller
@Path("financeiro/documento")
public class FinDocumentoController extends GenericController<FinDocumento> {
	
	@Get
	@Post
	@Path("baixa")
	public void baixa(List<ParametrosWeb> parametrosWeb, Integer idTipoOperacao) {
		if (parametrosWeb != null && !parametrosWeb.isEmpty()) {
			parametrosWeb = validaParametrosWebBaixa(parametrosWeb);
			if (idTipoOperacao == 5) { // 5 = ESTORNO
				parametrosWeb.add(new ParametrosWeb("datapagamento", null, null, "is not null"));
				parametrosWeb.add(new ParametrosWeb("iddocumento.id", null, null, "is not null", "or"));
				parametrosWeb.add(new ParametrosWeb("idtipooperacao.descricao", "CANCELAMENTO", null, null, "or"));
			} else { // 4 = BAIXA, 6 = CANCELAMENTO
				parametrosWeb.add(new ParametrosWeb("datapagamento", null, null, "is null"));
			}
			this.result.include("parametrosWeb", parametrosWeb).include("idTipoOperacao", idTipoOperacao).include("FinDocumentoList", this.getDao().findAll(FinDocumento.class, parametrosWeb));
		}
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
		parametrosWeb = validaParamerosWebListar(parametrosWeb);
		this.result.include("parametrosWeb", parametrosWeb);
		super.listar(obj, parametrosWeb);
	}
	
	@Get
	@Post
	@Path("parcelamento")
	public void parcelamento(List<ParametrosWeb> parametrosWeb) {
		if (parametrosWeb != null) {
			this.result.include("parametrosWeb", parametrosWeb).include("FinDocumentoList", geraDocumentos(parametrosWeb));
		}
	}
	
	@Post
	@Path("parcelamento/confirmar")
	public void parcelamentoConfirmar(List<ParametrosWeb> parametrosWeb, List<FinDocumento> finDocumentoList) {
		if (finDocumentoList != null) {
			for (FinDocumento finDocumento : finDocumentoList) {
				criaDocumento(finDocumento, Integer.parseInt(parametrosWeb.get(11).getParametroInicial()));
			}
		}
		this.result.redirectTo(this).parcelamento(null);
	}
	
	@Post("processar")
	public void processar(List<FinDocumento> obj, Integer idTipoOperacao) {
		for (FinDocumento finDocumento : obj) {
			atualizar(finDocumento, idTipoOperacao);
		}
		this.result.redirectTo(this).baixa(null, null);
	}
	
	@Post("")
	@Override
	public void salvar(FinDocumento obj) {
		// TODO Auto-generated method stub
		this.setRedirect(false);
		super.salvar(obj.novo());
		this.result.redirectTo(this).editar(this.getObj());
	}
	
	protected void criaFinanceiro(List<ParametrosWeb> parametrosWeb) {
		List<FinDocumento> documentos = geraDocumentos(parametrosWeb);
		for (FinDocumento finDocumento : documentos) {
			FinDocumento finDocumentoCriado = criaDocumento(finDocumento);
			if (finDocumentoCriado.getIdformapagamento().getDescricao().equals("A VISTA") || finDocumentoCriado.getIdformapagamento().getDescricao().equals("DEBITO"))
				atualizar(finDocumentoCriado, 4); // 4 = OPERACAO DE BAIXA
		}		
	}
	
	private List<FinDocumento> geraDocumentos(List<ParametrosWeb> parametrosWeb) {
		List<FinDocumento> documentos = new ArrayList<FinDocumento>();
		FinFormaPagamento finFormaPagamento = (FinFormaPagamento) this.getDao().edit(new FinFormaPagamento(Integer.parseInt(parametrosWeb.get(0).getParametroInicial())));
		int desdobramentoInicial = parametrosWeb.get(10).getParametroInicial() != null ? Integer.parseInt(parametrosWeb.get(10).getParametroInicial()) : 1;
		for (int i = desdobramentoInicial; i <= finFormaPagamento.getQuantidadeparcela(); i++) {
			documentos.add(new FinDocumento().novoParcelamento(parametrosWeb, finFormaPagamento, i));
		}
		return documentos;
	}
	
	private FinDocumento criaDocumento(FinDocumento finDocumento) {
		this.getDao().save(finDocumento);
		return this.getObj();
	}
	
	private void criaDocumento(FinDocumento finDocumento, int idCentroCusto) {
		this.getDao().save(finDocumento);
		if (idCentroCusto > 0) {
			FinDocumentoCentroCusto finDocumentoCentroCusto = new FinDocumentoCentroCusto(this.getObj().getId(), idCentroCusto);
			this.getDao().save(finDocumentoCentroCusto);
		}
	}
	
	private void atualizar(FinDocumento finDocumento, Integer idTipoOperacao) {
		// TODO Auto-generated method stub
		SysTipoOperacao sysTipoOperacao = (SysTipoOperacao) this.getDao().edit(new SysTipoOperacao(idTipoOperacao));
		Gerenciador gerenciador = GerenciadorFactory.cria(sysTipoOperacao.getDescricao());
		gerenciador.gerencia(getDao(), finDocumento, sysTipoOperacao);
	}
	
	private List<ParametrosWeb> validaParametrosWebBaixa(List<ParametrosWeb> parametrosWeb) {
		SimpleDateFormat formatador = new SimpleDateFormat("dd/MM/yyyy");
		Calendar agora = Calendar.getInstance();
		// ParametrosWeb[1] = Id Definicao
		if (parametrosWeb.get(1).getParametroInicial().equals("0"))
			parametrosWeb.get(1).setParametroFinal("999999");
		
		// ParametrosWeb[2] = Nro. Documento
		if (parametrosWeb.get(2).getParametroInicial() != null && parametrosWeb.get(2).getParametroFinal() == null)
			parametrosWeb.get(2).setParametroFinal(parametrosWeb.get(2).getParametroInicial());
		if (parametrosWeb.get(2).getParametroInicial() == null && parametrosWeb.get(2).getParametroFinal() == null)
			parametrosWeb.get(2).setParametroFinal("999999999999999");
		if (parametrosWeb.get(2).getParametroInicial() == null)
			parametrosWeb.get(2).setParametroInicial("0");
		
		// ParametrosWeb[3] = Data Vencimento
		if (parametrosWeb.get(3).getParametroInicial() != null && parametrosWeb.get(3).getParametroFinal() == null)
			parametrosWeb.get(3).setParametroFinal(parametrosWeb.get(3).getParametroInicial());
		if (parametrosWeb.get(3).getParametroInicial() == null && parametrosWeb.get(3).getParametroFinal() == null)
			parametrosWeb.get(3).setParametroFinal(formatador.format(agora.getTime()));
		if (parametrosWeb.get(3).getParametroInicial() == null)
			parametrosWeb.get(3).setParametroInicial(formatador.format(agora.getTime()));
		
		parametrosWeb.get(0).setCampo("idcontabancaria.id");
		parametrosWeb.get(1).setCampo("iddefinicao.id");
		parametrosWeb.get(2).setCampo("numero");
		parametrosWeb.get(3).setCampo("datavencimento");
		return parametrosWeb;
	}
	
	private List<ParametrosWeb> validaParamerosWebListar(List<ParametrosWeb> parametrosWeb) {
		SimpleDateFormat formatador = new SimpleDateFormat("dd/MM/yyyy");
		Calendar agora = Calendar.getInstance();
		if (parametrosWeb == null) {
			parametrosWeb = new ArrayList<ParametrosWeb>();
			parametrosWeb.add(new ParametrosWeb("id", "0", null, ">"));
			parametrosWeb.add(new ParametrosWeb("datacreate", formatador.format(agora.getTime()), formatador.format(agora.getTime())));
			parametrosWeb.add(new ParametrosWeb("datapagamento", "", null, "is null"));
		} else {
			if (parametrosWeb.get(0).getCampo() == null || parametrosWeb.get(0).getParametroInicial() == null) {
				parametrosWeb.get(0).setCampo("id");
				parametrosWeb.get(0).setParametroInicial("0");
				parametrosWeb.get(0).setOperador(">");	
			}
			if (parametrosWeb.get(1).getParametroInicial() == null && parametrosWeb.get(1).getParametroFinal() == null) {
				parametrosWeb.get(1).setParametroInicial(formatador.format(agora.getTime()));
				parametrosWeb.get(1).setParametroFinal(formatador.format(agora.getTime()));
			}
			if (parametrosWeb.get(1).getParametroInicial() != null && parametrosWeb.get(1).getParametroFinal() == null)
				parametrosWeb.get(1).setParametroFinal(parametrosWeb.get(1).getParametroInicial());
			parametrosWeb.get(1).setCampo("datacreate");
			if (parametrosWeb.size() > 2) {
				parametrosWeb.get(2).setCampo("datapagamento");
				parametrosWeb.get(2).setParametroInicial("");
			} else {
				parametrosWeb.add(new ParametrosWeb("datapagamento", "", null, "is null"));
			}
		}
		parametrosWeb.add(new ParametrosWeb("idtipooperacao.descricao", "ENTRADA", null, "="));
		return parametrosWeb;
	}
	
}
