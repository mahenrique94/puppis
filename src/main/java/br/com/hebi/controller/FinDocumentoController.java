package br.com.hebi.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.hebi.financeiro.Gerenciador;
import br.com.hebi.financeiro.GerenciadorDeBaixa;
import br.com.hebi.financeiro.GerenciadorDeDocumento;
import br.com.hebi.financeiro.GerenciadorFactory;
import br.com.hebi.model.FinDocumento;
import br.com.hebi.model.SysTipoOperacao;
import br.com.mhc.parametrosweb.ParametrosWeb;

@Controller
@Path("financeiro/documento")
public class FinDocumentoController extends GenericController<FinDocumento> {
	
	private final SimpleDateFormat formatador = new SimpleDateFormat("dd/MM/yyyy");
	private final Calendar agora = Calendar.getInstance();
	
	@Get
	@Post
	@Path("baixa")
	public void baixa(List<ParametrosWeb> parametrosWeb, Integer idTipoOperacao) {
		if (parametrosWeb != null && !parametrosWeb.isEmpty()) {
			validaParametrosWeb(parametrosWeb);
			parametrosWeb.get(0).setCampo("idcontabancaria.id");
			parametrosWeb.get(1).setCampo("iddefinicao.id");
			parametrosWeb.get(2).setCampo("numero");
			parametrosWeb.get(3).setCampo("dataemissao");
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
	
	@Post("processar")
	public void processar(List<FinDocumento> obj, Integer idTipoOperacao) {
		SysTipoOperacao sysTipoOperacao = (SysTipoOperacao) this.getDao().edit(new SysTipoOperacao(idTipoOperacao));
		Gerenciador gerenciador = GerenciadorFactory.cria(sysTipoOperacao.getDescricao());
		for (FinDocumento finDocumento : obj) {
			gerenciador.gerencia(getDao(), finDocumento, sysTipoOperacao);
		}
		this.result.redirectTo(this).baixa(null, null);
	}
	
	@Post("")
	@Override
	public void salvar(FinDocumento obj) {
		// TODO Auto-generated method stub
		super.salvar(obj.novo());
	}
	
	private void validaParametrosWeb(List<ParametrosWeb> parametrosWeb) {
		// ParametrosWeb[2] = Nro. Documento
		if (parametrosWeb.get(2).getParametroInicial() != null && parametrosWeb.get(2).getParametroFinal() == null)
			parametrosWeb.get(2).setParametroFinal(parametrosWeb.get(2).getParametroInicial());
		else
			parametrosWeb.get(2).setParametroFinal("999999");
		if (parametrosWeb.get(2).getParametroInicial() == null)
			parametrosWeb.get(2).setParametroInicial("0");
		
		// ParametrosWeb[3] = Data Emissão
		if (parametrosWeb.get(3).getParametroInicial() != null && parametrosWeb.get(3).getParametroFinal() == null)
			parametrosWeb.get(3).setParametroFinal(parametrosWeb.get(3).getParametroInicial());
		else
			parametrosWeb.get(3).setParametroFinal(formatador.format(agora.getTime()));
		if (parametrosWeb.get(3).getParametroInicial() == null)
			parametrosWeb.get(3).setParametroInicial(formatador.format(agora.getTime()));
	}
	
}
