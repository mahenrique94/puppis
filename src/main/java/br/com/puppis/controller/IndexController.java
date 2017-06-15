package br.com.puppis.controller;

import javax.inject.Inject;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Result;

@Controller
public class IndexController {

	private Result result;

	@Inject
	public IndexController(Result result) {
		// TODO Auto-generated constructor stub
		this.result = result;
	}
	
	@Deprecated
	public IndexController() {
		// TODO Auto-generated constructor stub
	}
	
	@Get("")
	public void index() {
		this.result.redirectTo(DashBoardController.class).dashboard();
	}
	
}
