package br.com.puppis.controller;

import javax.inject.Inject;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.util.StringUtils;
import br.com.mhc.function.StringFunction;

@Controller
@Path("dashboard")
public class DashBoardController {

	@Inject
	private Result result;
	
	@Get("")
	public void dashboard() {}
	
	@Get("{operacao*}")
	public void operacao(String operacao) {
		this.result.forwardTo(String.format("/WEB-INF/jsp/dashBoard/%s.jsp", StringFunction.splitBarToFirstUpper(operacao)));
	}
}
