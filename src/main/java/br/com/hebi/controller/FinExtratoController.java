package br.com.hebi.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.hebi.model.FinExtrato;
import br.com.mhc.parametrosweb.ParametrosWeb;

@Controller
@Path("financeiro/extrato")
public class FinExtratoController extends GenericController<FinExtrato> {
	
	private final SimpleDateFormat formatador = new SimpleDateFormat("dd/MM/yyyy");
	private final Calendar agora = Calendar.getInstance();
	
	@Get
	@Post
	@Path("listar")
	public void listar(List<ParametrosWeb> parametrosWeb) {
		// TODO Auto-generated method stub
		if (parametrosWeb != null) {
			validaParametrosWeb(parametrosWeb);
			parametrosWeb.get(0).setCampo("iddocumento.idcontabancaria.id");
			parametrosWeb.get(1).setCampo("datacreate");
			this.result.include("parametrosWeb", parametrosWeb).include("FinExtratoList", this.getDao().findAll(FinExtrato.class, parametrosWeb));
		}
	}
	
	private void validaParametrosWeb(List<ParametrosWeb> parametrosWeb) {
		// ParametrosWeb[1] = Data Emissão
		if (parametrosWeb.get(1).getParametroInicial() != null && parametrosWeb.get(1).getParametroFinal() == null)
			parametrosWeb.get(1).setParametroFinal(parametrosWeb.get(1).getParametroInicial());
		else
			parametrosWeb.get(1).setParametroFinal(formatador.format(agora.getTime()));
		if (parametrosWeb.get(1).getParametroInicial() == null)
			parametrosWeb.get(1).setParametroInicial(formatador.format(agora.getTime()));
	}

}
