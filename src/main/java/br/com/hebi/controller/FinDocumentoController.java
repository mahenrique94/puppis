package br.com.hebi.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.hebi.model.FinDocumento;
import br.com.mhc.parametrosweb.ParametrosWeb;

@Controller
@Path("financeiro/documento")
public class FinDocumentoController extends GenericController<FinDocumento> {
	
	private final SimpleDateFormat formatador = new SimpleDateFormat("dd/MM/yyyy");
	private final Calendar agora = Calendar.getInstance();
	
	@Get
	@Post
	@Path("baixa")
	public void baixa(List<ParametrosWeb> parametrosWeb) {
		if (parametrosWeb != null && !parametrosWeb.isEmpty()) {
			validaParametrosWeb(parametrosWeb);
			parametrosWeb.get(0).setCampo("idcontabancaria.id");
			parametrosWeb.get(1).setCampo("iddefinicao.id");
			parametrosWeb.get(2).setCampo("numero");
			parametrosWeb.get(2).setOperador(">=");
			parametrosWeb.get(3).setCampo("numero");
			parametrosWeb.get(3).setOperador("<=");
			parametrosWeb.get(4).setCampo("dataemissao");
			parametrosWeb.get(4).setOperador(">=");
			parametrosWeb.get(5).setCampo("dataemissao");
			parametrosWeb.get(5).setOperador("<=");
			this.result.include("FinDocumentoList", this.getDao().findAll(FinDocumento.class, parametrosWeb));
		}
	}
	
	@Get("{obj.id}")
	@Override
	public void editar(FinDocumento obj) {
		// TODO Auto-generated method stub
		super.editar(obj);
	}
	
	@Post("")
	@Override
	public void salvar(FinDocumento obj) {
		// TODO Auto-generated method stub
		obj.novo();
		super.salvar(obj);
	}
	
	private void validaParametrosWeb(List<ParametrosWeb> parametrosWeb) {
		if (parametrosWeb.get(2).getParametro() == null)
			parametrosWeb.get(2).setParametro("0");
		if (parametrosWeb.get(3).getParametro() == null)
			parametrosWeb.get(3).setParametro("999999");
		if (parametrosWeb.get(4).getParametro() == null)
			parametrosWeb.get(4).setParametro(formatador.format(agora));
		if (parametrosWeb.get(5).getParametro() == null)
			parametrosWeb.get(5).setParametro(parametrosWeb.get(4).getParametro());
	}
	
}
