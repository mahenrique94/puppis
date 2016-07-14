package br.com.pupis.controller;

import javax.inject.Inject;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Result;

@Controller
@Path("dashboard")
public class DashBoardController {

	@Inject
	private Result result;
	
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
		this.result.forwardTo("/WEB-INF/jsp/dashBoard/" + operacao + ".jsp");
	}
}
