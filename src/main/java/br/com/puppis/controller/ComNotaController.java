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
import br.com.mhc.parametrosweb.ParametrosWeb;
import br.com.puppis.estoque.Gerenciador;
import br.com.puppis.estoque.GerenciadorFactory;
import br.com.puppis.model.ComNota;
import br.com.puppis.model.ComNotaItem;
import br.com.puppis.model.FinDocumento;

@Controller
@Path("comercio/nota")
public class ComNotaController extends GenericController<ComNota> {
	
	private FinDocumentoController finDocumentoController;
	
	@Inject
	public ComNotaController(FinDocumentoController finDocumentoController) {
		// TODO Auto-generated constructor stub
		this.finDocumentoController = finDocumentoController;
	}
	@Deprecated
	public ComNotaController() {
		// TODO Auto-generated constructor stub
	}
	
	@Post("atualizar")
	public void atualizar(ComNota obj) {
		super.setRedirect(false);
		obj = (ComNota) super.edit(obj);
		atualiza(obj);
		this.finDocumentoController.criaFinanceiro(criaParametrosAtualizarFinanceiro(obj));
		super.salvar(obj);
		super.result.include("mensagem", "mensagem.nota.atualizar.sucesso");
		super.result.redirectTo(this).listar(obj, null);
	}
	
	@Post("calcular")
	public void calcular(ComNota obj) {
		super.setRedirect(false);
		obj = (ComNota) super.edit(obj);
		super.salvar(obj.calcular(super.getDao()));
		super.result.redirectTo(this).editar(obj);
	}
	
	@Get("{obj.id}")
	@Override
	public void editar(ComNota obj) {
		// TODO Auto-generated method stub
		super.editar(obj);
	}
	
	@Post("estornar/{obj.id}")
	public void estornar(ComNota obj) {
		if (existeBaixa(obj.getIdtipooperacao().getDescricao().equals("VENDA") ? obj.getId() : obj.getNumero())) {
			super.result.include("erro", "mensagem.nota.estornar.erro");
			super.result.redirectTo(this).editar(obj);
		} else {
			obj = (ComNota) super.edit(obj);
			List<FinDocumento> documentos = buscaDocumentoComNumero(obj.getIdtipooperacao().getDescricao().equals("VENDA") ? obj.getId() : obj.getNumero());
			for (FinDocumento finDocumento : documentos) {
				super.getDao().delete(finDocumento);
			}
			atualiza(obj);
			super.result.include("mensagem", "mensagem.nota.estornar.sucesso");
			super.result.redirectTo(this).editar(obj);
		}
	}
	
	@Get("")
	@Override
	public void listar(ComNota obj, List<ParametrosWeb> parametrosWeb) {
		// TODO Auto-generated method stub
		parametrosWeb = validaParamerosWebListar(parametrosWeb);
		super.result.include("parametrosWeb", parametrosWeb);
		super.listar(obj, parametrosWeb);
	}
	
	@Post("")
	@Override
	public void salvar(ComNota obj) {
		// TODO Auto-generated method stub
		super.setRedirect(false);
		if (obj.getId() == null) {
			obj.getCusto().setIdnota(obj);
		}
		super.salvar(obj);
		super.result.redirectTo(this).editar(super.getObj());
	}
	
	private void atualiza(ComNota nota) {
		Gerenciador gerenciador = GerenciadorFactory.cria(nota.getIdtipooperacao().getDescricao(), nota.getDataatualizacao());
		for (ComNotaItem item : nota.getItens()) {
			gerenciador.gerencia(super.getDao(), nota.getId(), item.getIdprodutoservico().getId(), item.getQuantidade(), item.getValorunitario());
		}
		nota.setDataatualizacao(nota.getDataatualizacao() != null ? null : Calendar.getInstance());
	}
	
	private List<FinDocumento> buscaDocumentoComNumero(long idNota) {
		List<ParametrosWeb> parametrosWeb = new ArrayList<ParametrosWeb>();
		parametrosWeb.add(new ParametrosWeb("numero", Long.toString(idNota)));
		return super.getDao().findAll(FinDocumento.class, parametrosWeb);
	}
	
	private List<ParametrosWeb> criaParametrosAtualizarFinanceiro(ComNota obj) {
		// TODO Auto-generated method stub
		List<ParametrosWeb> parametrosWeb = new ArrayList<ParametrosWeb>();
		parametrosWeb.add(new ParametrosWeb(null, obj.getCusto().getIdformapagamento().getId().toString())); // FORMAPAGAMENTO
		parametrosWeb.add(new ParametrosWeb(null, obj.getIddefinicao().getId().toString())); // DEFINICAO
		parametrosWeb.add(new ParametrosWeb(null, obj.getIdcomercio().getPagamento().getIdcontabancaria().getId().toString())); // CONTABANCARIA
		parametrosWeb.add(new ParametrosWeb(null, "1")); // TIPODOCUMENTO, 1 = CUPOM FISCAL
		parametrosWeb.add(new ParametrosWeb(null, obj.getNumero() != null ? obj.getNumero().toString() : obj.getId().toString())); // NUMERODOCUMENTO
		parametrosWeb.add(new ParametrosWeb(null, obj.getSerie() != null ? obj.getSerie().toString() : null)); // SERIE
		parametrosWeb.add(new ParametrosWeb(null, obj.getDataemissao() != null ? new SimpleDateFormat("dd/MM/yyyy").format(obj.getDataemissao().getTime()) : new SimpleDateFormat("dd/MM/yyyy").format(obj.getDatacreate().getTime()))); // DATAEMISSAO
		parametrosWeb.add(new ParametrosWeb(null, Double.toString(obj.getCusto().getValortotal() / obj.getCusto().getIdformapagamento().getQuantidadeparcela()))); // VALORTOTAL
		parametrosWeb.add(new ParametrosWeb(null, "0")); // HISTORICO, 0 = EM BRANCO
		parametrosWeb.add(new ParametrosWeb(null, "3")); // OPERACAO, 3 = ENTRADA FINANCEIRO
		parametrosWeb.add(new ParametrosWeb(null, null)); // DESDOBRAMENTOINICIAL
		return parametrosWeb;
	}
	
	private boolean existeBaixa(long idNota) {
		List<ParametrosWeb> parametrosWeb = new ArrayList<ParametrosWeb>();
		parametrosWeb.add(new ParametrosWeb("numero", Long.toString(idNota)));
		parametrosWeb.add(new ParametrosWeb("datapagamento", "", null, "is not null"));
		List<FinDocumento> finDocumentos = super.getDao().findAll(FinDocumento.class, parametrosWeb);
		return finDocumentos != null && !finDocumentos.isEmpty();
	}
	
	private List<ParametrosWeb> validaParamerosWebListar(List<ParametrosWeb> parametrosWeb) {
		SimpleDateFormat formatador = new SimpleDateFormat("dd/MM/yyyy");
		Calendar agora = Calendar.getInstance();
		if (parametrosWeb == null) {
			parametrosWeb = new ArrayList<ParametrosWeb>();
			parametrosWeb.add(new ParametrosWeb("id", "0", null, ">"));
			parametrosWeb.add(new ParametrosWeb("datacreate", formatador.format(agora.getTime()), formatador.format(agora.getTime())));
			parametrosWeb.add(new ParametrosWeb("dataatualizacao", "", null, "is null"));
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
				parametrosWeb.get(2).setCampo("dataatualizacao");
				parametrosWeb.get(2).setParametroInicial("");
			} else {
				parametrosWeb.add(new ParametrosWeb("dataatualizacao", "", null, "is null"));
			}
		}
		return parametrosWeb;
	}
	
}