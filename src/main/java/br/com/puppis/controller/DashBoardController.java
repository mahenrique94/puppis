package br.com.puppis.controller;

import javax.inject.Inject;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Result;
import br.com.mhc.function.StringFunction;

@Controller
@Path("dashboard")
public class DashBoardController {

	private Result result;
	
	@Inject
	public DashBoardController(Result result) {
		// TODO Auto-generated constructor stub
		this.result = result;
	}
	@Deprecated
	public DashBoardController() {
		// TODO Auto-generated constructor stub
	}
	
	@Get("")
	public void dashboard() {}
	
	@Get("{operacao*}")
	public void operacao(String operacao) {
		this.result.forwardTo(String.format("/WEB-INF/jsp/dashBoard/%s.jsp", StringFunction.splitBarToFirstUpper(operacao)));
	}
}
