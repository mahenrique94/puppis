package br.com.netsis.controller;

import java.util.List;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.mhc.parametrosweb.ParametrosWeb;
import br.com.netsis.model.FinExtrato;

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
