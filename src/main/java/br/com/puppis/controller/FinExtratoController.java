package br.com.puppis.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.mhc.parametrosweb.ParametrosWeb;
import br.com.puppis.model.FinExtrato;
import br.com.puppis.util.CreditoDebito;

@Controller
@Path("financeiro/extrato")
public class FinExtratoController extends GenericController<FinExtrato> {
	
	@Get("")
	@Override
	public void listar(FinExtrato obj, List<ParametrosWeb> parametrosWeb) {
		// TODO Auto-generated method stub
		parametrosWeb = validaParametrosWeb(parametrosWeb);
		if (parametrosWeb != null && !parametrosWeb.isEmpty()) {
			super.result.include("parametrosWeb", parametrosWeb);
			super.listar(obj, parametrosWeb);
		}
	}
	
	@Post("")
	@Override
	public void salvar(FinExtrato obj) {
		// TODO Auto-generated method stub
		super.setRedirect(false);
		super.salvar(obj);
		super.result.nothing();
	}

	protected void transferencia(int idContaOrigem, int idContaDestino, double valor) {
		super.getDao().save(FinExtrato.transferencia(idContaOrigem, CreditoDebito.DEBITO, valor));
		super.getDao().save(FinExtrato.transferencia(idContaDestino, CreditoDebito.CREDITO, valor));
	}

	private List<ParametrosWeb> validaParametrosWeb(List<ParametrosWeb> parametrosWeb) {
		if (parametrosWeb != null && !parametrosWeb.isEmpty()) {
			SimpleDateFormat formatador = new SimpleDateFormat("dd/MM/yyyy");
			Calendar agora = Calendar.getInstance();
			// ParametrosWeb[1] = Data Emissão
			if (parametrosWeb.get(1).getParametroInicial() != null && parametrosWeb.get(1).getParametroFinal() == null)
				parametrosWeb.get(1).setParametroFinal(parametrosWeb.get(1).getParametroInicial());
			else
				parametrosWeb.get(1).setParametroFinal(formatador.format(agora.getTime()));
			if (parametrosWeb.get(1).getParametroInicial() == null)
				parametrosWeb.get(1).setParametroInicial(formatador.format(agora.getTime()));
			parametrosWeb.get(0).setCampo("idcontabancaria.id");
			parametrosWeb.get(1).setCampo("datacreate");
		}			
		return parametrosWeb;
	}

}
