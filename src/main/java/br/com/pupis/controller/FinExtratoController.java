package br.com.pupis.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import javax.validation.Valid;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.interceptor.IncludeParameters;
import br.com.mhc.parametrosweb.ParametrosWeb;
import br.com.pupis.model.FinExtrato;

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
			Object[] parametros = null;
			try {
				parametros = new Object[]{Integer.parseInt(parametrosWeb.get(0).getParametroInicial()), 
										  formatador.parse(parametrosWeb.get(1).getParametroInicial()),
										  formatador.parse(parametrosWeb.get(1).getParametroFinal())};
			} catch (NumberFormatException | ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			List list = this.getDao().executeNamedQuery("buscaExtrato", FinExtrato.class, parametros);
			this.result.include("parametrosWeb", parametrosWeb).include("FinExtratoList", list);
		}
	}
	
	@Post("")
	@IncludeParameters
	@Override
	public void salvar(@Valid FinExtrato obj) {
		// TODO Auto-generated method stub
		obj.setIddocumento(null);
		super.salvar(obj);
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
