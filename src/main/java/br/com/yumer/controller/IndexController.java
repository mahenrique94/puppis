package br.com.yumer.controller;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;

@Controller
public class IndexController {

	@Get
	@Path("/")
	public void index() {}
	
}
