package br.com.hebi.controller;

import java.util.List;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.hebi.model.FinExtrato;
import br.com.mhc.parametrosweb.ParametrosWeb;

@Controller
@Path("financeiro/extrato")
public class FinExtratoController extends GenericController<FinExtrato> {
	
	@Get("")
	@Override
	public void listar(FinExtrato obj, List<ParametrosWeb> parametrosWeb) {
		// TODO Auto-generated method stub
		super.listar(obj, parametrosWeb);
	}

}
