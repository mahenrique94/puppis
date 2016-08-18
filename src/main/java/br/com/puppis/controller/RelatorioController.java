package br.com.puppis.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Result;
import br.com.mhc.function.StringFunction;
import br.com.mhc.parametrosweb.ParametrosWeb;
import br.com.mhc.relatorio.RelatorioBuilder;
import br.com.puppis.dao.Dao;
import br.com.puppis.dao.GenericDao;

@Controller
@Path("relatorio")
public class RelatorioController {

	@Inject
	private Dao dao;
	@Inject
	private Result result;
	private final String PATH_RELATORIO = "/WEB-INF/jsp/relatorio/";
	private final String PATH_JASPER = this.PATH_RELATORIO + "jasper/";
	private final String LOGOTIPO = this.PATH_RELATORIO + "img/logo.png";			 
	
	@Get("{operacao*}")
	public void operacao(String operacao) {
		this.result.forwardTo(String.format(getPathRelatorio() + "%s.jsp", StringFunction.splitBarToFirstUpper(operacao)));
	}
	
	@Post("processar")
	public void processar(List<ParametrosWeb> parametrosWeb, HttpServletRequest request, HttpServletResponse response) throws ParseException {
		// 0 = NOME RELATORIO
		// 1 = EXCEL - HTML - PDF - TXT - WORD
		if (parametrosWeb != null && !parametrosWeb.isEmpty()) {
			Map<String, Object> parameters = new HashMap<String, Object>();
			SimpleDateFormat formatador = new SimpleDateFormat("dd/MM/yyyy");
			String dataAtual = formatador.format(Calendar.getInstance().getTime());
			String nomeRelatorio = request.getServletContext().getRealPath(String.format(getPathJasper() + "%s.jasper", parametrosWeb.get(0).getParametroInicial()));
			parameters.put("LOGOTIPO", "/Users/matheus/workspace/puppis/src/main/webapp/WEB-INF/jsp/relatorio/img/logo.png");
			
			switch (parametrosWeb.get(0).getParametroInicial()) {
			case "IRPESSOA" :				
				// IDPESSOA
				if (parametrosWeb.get(2).getParametroFinal() == null && parametrosWeb.get(2).getParametroInicial() != null)
					parametrosWeb.get(2).setParametroFinal(parametrosWeb.get(2).getParametroInicial());
				if (parametrosWeb.get(2).getParametroFinal() == null)
					parametrosWeb.get(2).setParametroFinal("999999999");
				if (parametrosWeb.get(2).getParametroInicial() == null)
					parametrosWeb.get(2).setParametroInicial("0");
				
				// DATACADASTRO
				if (parametrosWeb.get(3).getParametroFinal() == null && parametrosWeb.get(3).getParametroInicial() != null)
					parametrosWeb.get(3).setParametroFinal(parametrosWeb.get(3).getParametroInicial());
				if (parametrosWeb.get(3).getParametroFinal() == null)
					parametrosWeb.get(3).setParametroFinal(dataAtual);
				if (parametrosWeb.get(3).getParametroInicial() == null)
					parametrosWeb.get(3).setParametroInicial(dataAtual);
				
				// INATIVO
				if (parametrosWeb.size() == 4)
					parametrosWeb.add(new ParametrosWeb(null, "false"));
				
				parameters.put("IDPESSOA_INICIAL", Long.parseLong(parametrosWeb.get(2).getParametroInicial()));
				parameters.put("IDPESSOA_FINAL", Long.parseLong(parametrosWeb.get(2).getParametroFinal()));
				parameters.put("DATACADASTRO_INICIAL", formatador.parse(parametrosWeb.get(3).getParametroInicial()));
				parameters.put("DATACADASTRO_FINAL", formatador.parse(parametrosWeb.get(3).getParametroFinal()));
				parameters.put("INATIVO", Boolean.parseBoolean(parametrosWeb.get(4).getParametroInicial()));
				break;
			case "IREXTRATO" :				
				// DATACREATE
				if (parametrosWeb.get(2).getParametroFinal() == null && parametrosWeb.get(2).getParametroInicial() != null)
					parametrosWeb.get(2).setParametroFinal(parametrosWeb.get(2).getParametroInicial());
				if (parametrosWeb.get(2).getParametroFinal() == null)
					parametrosWeb.get(2).setParametroFinal(dataAtual);
				if (parametrosWeb.get(2).getParametroInicial() == null)
					parametrosWeb.get(2).setParametroInicial(dataAtual);
				
				parameters.put("DATA_INICIAL", formatador.parse(parametrosWeb.get(2).getParametroInicial()));
				parameters.put("DATA_FINAL", formatador.parse(parametrosWeb.get(2).getParametroFinal()));
				parameters.put("CREDITODEBITO", parametrosWeb.get(3).getParametroInicial());
				break;
			case "IRFINDOCPESSOA" :
				// IDDEFINICAO
				if (parametrosWeb.get(2).getParametroFinal() == null && parametrosWeb.get(2).getParametroInicial() != null)
					parametrosWeb.get(2).setParametroFinal(parametrosWeb.get(2).getParametroInicial());
				if (parametrosWeb.get(2).getParametroFinal() == null)
					parametrosWeb.get(2).setParametroFinal("999999999");
				if (parametrosWeb.get(2).getParametroInicial() == null)
					parametrosWeb.get(2).setParametroInicial("0");
				
				// DATAEMISSAO
				if (parametrosWeb.get(3).getParametroFinal() == null && parametrosWeb.get(3).getParametroInicial() != null)
					parametrosWeb.get(3).setParametroFinal(parametrosWeb.get(3).getParametroInicial());
				if (parametrosWeb.get(3).getParametroFinal() == null)
					parametrosWeb.get(3).setParametroFinal(dataAtual);
				if (parametrosWeb.get(3).getParametroInicial() == null)
					parametrosWeb.get(3).setParametroInicial(dataAtual);
				
				// DATAPAGAMENTO
				if (parametrosWeb.get(4).getParametroFinal() == null && parametrosWeb.get(4).getParametroInicial() != null)
					parametrosWeb.get(4).setParametroFinal(parametrosWeb.get(4).getParametroInicial());
				if (parametrosWeb.get(4).getParametroFinal() == null)
					parametrosWeb.get(4).setParametroFinal(dataAtual);
				if (parametrosWeb.get(4).getParametroInicial() == null)
					parametrosWeb.get(4).setParametroInicial(dataAtual);
				
				// DATAVENCIMENTO
				if (parametrosWeb.get(5).getParametroFinal() == null && parametrosWeb.get(5).getParametroInicial() != null)
					parametrosWeb.get(5).setParametroFinal(parametrosWeb.get(5).getParametroInicial());
				if (parametrosWeb.get(5).getParametroFinal() == null)
					parametrosWeb.get(5).setParametroFinal(dataAtual);
				if (parametrosWeb.get(5).getParametroInicial() == null)
					parametrosWeb.get(5).setParametroInicial(dataAtual);
				
				parameters.put("IDDEFINICAO_INICIAL", Long.parseLong(parametrosWeb.get(2).getParametroInicial()));
				parameters.put("IDDEFINICAO_FINAL", Long.parseLong(parametrosWeb.get(2).getParametroFinal()));
				parameters.put("DATAEMISSAO_INICIAL", formatador.parse(parametrosWeb.get(3).getParametroInicial()));
				parameters.put("DATAEMISSAO_FINAL", formatador.parse(parametrosWeb.get(3).getParametroFinal()));
				parameters.put("DATAPAGAMENTO_INICIAL", formatador.parse(parametrosWeb.get(4).getParametroInicial()));
				parameters.put("DATAPAGAMENTO_FINAL", formatador.parse(parametrosWeb.get(4).getParametroFinal()));
				parameters.put("DATAVENCIMENTO_INICIAL", formatador.parse(parametrosWeb.get(5).getParametroInicial()));
				parameters.put("DATAVENCIMENTO_FINAL", formatador.parse(parametrosWeb.get(5).getParametroFinal()));
				break;
			case "IRFINDOCCUSTO" :
				// IDCENTROCUSTO
				if (parametrosWeb.get(2).getParametroFinal() == null && parametrosWeb.get(2).getParametroInicial() != null)
					parametrosWeb.get(2).setParametroFinal(parametrosWeb.get(2).getParametroInicial());
				if (parametrosWeb.get(2).getParametroFinal() == null)
					parametrosWeb.get(2).setParametroFinal("999999999");
				if (parametrosWeb.get(2).getParametroInicial() == null)
					parametrosWeb.get(2).setParametroInicial("0");
				
				// DATAEMISSAO
				if (parametrosWeb.get(3).getParametroFinal() == null && parametrosWeb.get(3).getParametroInicial() != null)
					parametrosWeb.get(3).setParametroFinal(parametrosWeb.get(3).getParametroInicial());
				if (parametrosWeb.get(3).getParametroFinal() == null)
					parametrosWeb.get(3).setParametroFinal(dataAtual);
				if (parametrosWeb.get(3).getParametroInicial() == null)
					parametrosWeb.get(3).setParametroInicial(dataAtual);
				
				// DATAPAGAMENTO
				if (parametrosWeb.get(4).getParametroFinal() == null && parametrosWeb.get(4).getParametroInicial() != null)
					parametrosWeb.get(4).setParametroFinal(parametrosWeb.get(4).getParametroInicial());
				if (parametrosWeb.get(4).getParametroFinal() == null)
					parametrosWeb.get(4).setParametroFinal(dataAtual);
				if (parametrosWeb.get(4).getParametroInicial() == null)
					parametrosWeb.get(4).setParametroInicial(dataAtual);
				
				// DATAVENCIMENTO
				if (parametrosWeb.get(5).getParametroFinal() == null && parametrosWeb.get(5).getParametroInicial() != null)
					parametrosWeb.get(5).setParametroFinal(parametrosWeb.get(5).getParametroInicial());
				if (parametrosWeb.get(5).getParametroFinal() == null)
					parametrosWeb.get(5).setParametroFinal(dataAtual);
				if (parametrosWeb.get(5).getParametroInicial() == null)
					parametrosWeb.get(5).setParametroInicial(dataAtual);
				
				parameters.put("IDCENTROCUSTO_INICIAL", Integer.parseInt(parametrosWeb.get(2).getParametroInicial()));
				parameters.put("IDCENTROCUSTO_FINAL", Integer.parseInt(parametrosWeb.get(2).getParametroFinal()));
				parameters.put("DATAEMISSAO_INICIAL", formatador.parse(parametrosWeb.get(3).getParametroInicial()));
				parameters.put("DATAEMISSAO_FINAL", formatador.parse(parametrosWeb.get(3).getParametroFinal()));
				parameters.put("DATAPAGAMENTO_INICIAL", formatador.parse(parametrosWeb.get(4).getParametroInicial()));
				parameters.put("DATAPAGAMENTO_FINAL", formatador.parse(parametrosWeb.get(4).getParametroFinal()));
				parameters.put("DATAVENCIMENTO_INICIAL", formatador.parse(parametrosWeb.get(5).getParametroInicial()));
				parameters.put("DATAVENCIMENTO_FINAL", formatador.parse(parametrosWeb.get(5).getParametroFinal()));
				break;
			case "IRFINDOCPAGAMENTO" :
				// IDFORMAPAGAMENTO
				if (parametrosWeb.get(2).getParametroFinal() == null && parametrosWeb.get(2).getParametroInicial() != null)
					parametrosWeb.get(2).setParametroFinal(parametrosWeb.get(2).getParametroInicial());
				if (parametrosWeb.get(2).getParametroFinal() == null)
					parametrosWeb.get(2).setParametroFinal("999999999");
				if (parametrosWeb.get(2).getParametroInicial() == null)
					parametrosWeb.get(2).setParametroInicial("0");
				
				// DATAEMISSAO
				if (parametrosWeb.get(3).getParametroFinal() == null && parametrosWeb.get(3).getParametroInicial() != null)
					parametrosWeb.get(3).setParametroFinal(parametrosWeb.get(3).getParametroInicial());
				if (parametrosWeb.get(3).getParametroFinal() == null)
					parametrosWeb.get(3).setParametroFinal(dataAtual);
				if (parametrosWeb.get(3).getParametroInicial() == null)
					parametrosWeb.get(3).setParametroInicial(dataAtual);
				
				// DATAPAGAMENTO
				if (parametrosWeb.get(4).getParametroFinal() == null && parametrosWeb.get(4).getParametroInicial() != null)
					parametrosWeb.get(4).setParametroFinal(parametrosWeb.get(4).getParametroInicial());
				if (parametrosWeb.get(4).getParametroFinal() == null)
					parametrosWeb.get(4).setParametroFinal(dataAtual);
				if (parametrosWeb.get(4).getParametroInicial() == null)
					parametrosWeb.get(4).setParametroInicial(dataAtual);
				
				// DATAVENCIMENTO
				if (parametrosWeb.get(5).getParametroFinal() == null && parametrosWeb.get(5).getParametroInicial() != null)
					parametrosWeb.get(5).setParametroFinal(parametrosWeb.get(5).getParametroInicial());
				if (parametrosWeb.get(5).getParametroFinal() == null)
					parametrosWeb.get(5).setParametroFinal(dataAtual);
				if (parametrosWeb.get(5).getParametroInicial() == null)
					parametrosWeb.get(5).setParametroInicial(dataAtual);
				
				parameters.put("IDFORMAPAGAMENTO_INICIAL", Integer.parseInt(parametrosWeb.get(2).getParametroInicial()));
				parameters.put("IDFORMAPAGAMENTO_FINAL", Integer.parseInt(parametrosWeb.get(2).getParametroFinal()));
				parameters.put("DATAEMISSAO_INICIAL", formatador.parse(parametrosWeb.get(3).getParametroInicial()));
				parameters.put("DATAEMISSAO_FINAL", formatador.parse(parametrosWeb.get(3).getParametroFinal()));
				parameters.put("DATAPAGAMENTO_INICIAL", formatador.parse(parametrosWeb.get(4).getParametroInicial()));
				parameters.put("DATAPAGAMENTO_FINAL", formatador.parse(parametrosWeb.get(4).getParametroFinal()));
				parameters.put("DATAVENCIMENTO_INICIAL", formatador.parse(parametrosWeb.get(5).getParametroInicial()));
				parameters.put("DATAVENCIMENTO_FINAL", formatador.parse(parametrosWeb.get(5).getParametroFinal()));
				break;
			default :
				throw new RuntimeException("Não foi possível localizar o relatório " + parametrosWeb.get(0).getParametroInicial());
			}
			
			RelatorioBuilder builder = new RelatorioBuilder(nomeRelatorio, parameters, getDao().getConnection());
			try {
				builder.gera(response.getOutputStream());
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	private GenericDao getDao() {
		return this.dao.getDao();
	}
	private String getPathRelatorio() {
		return this.PATH_RELATORIO;
	}
	public String getPathJasper() {
		return this.PATH_JASPER;
	}
	public String getLogoTipo() {
		return this.LOGOTIPO;
	}
	
}
