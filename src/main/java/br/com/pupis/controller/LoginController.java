package br.com.pupis.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import br.com.caelum.brutauth.auth.annotations.Public;
import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.validator.SimpleMessage;
import br.com.caelum.vraptor.validator.Validator;
import br.com.mhc.parametrosweb.ParametrosWeb;
import br.com.pupis.dao.Dao;
import br.com.pupis.model.AdmUsuario;
import br.com.pupis.security.UserName;
import br.com.pupis.validator.ValidatorUser;

@Controller
@Path("login")
public class LoginController {
	
	@Inject
	private Dao dao;
	@Inject
	private Result result;
	@Inject
	private UserName userName;
	@Inject
	private Validator validator;

	public LoginController(Dao dao, Result result, UserName userName, Validator validator) {
		this.dao = dao;
		this.result = result;
		this.userName = userName;
		this.validator = validator;
	}
	
	@Deprecated
	public LoginController() {}
	
	@Get("formulario")
	@Public
	public void formulario() {}
	
	@Post("")
	@Public
	public void login(String usuario, String senha) {
		List<ParametrosWeb> parametrosWeb = new ArrayList<ParametrosWeb>();
		parametrosWeb.add(new ParametrosWeb("usuario", usuario));
		parametrosWeb.add(new ParametrosWeb("senha", senha));
		parametrosWeb.add(new ParametrosWeb("inativo", "true", null, "<>"));
		AdmUsuario admUsuario = (AdmUsuario) this.dao.getDao().find(AdmUsuario.class, parametrosWeb);
		if (admUsuario != null && new ValidatorUser().validar(admUsuario, usuario, senha)) {
			this.userName.login(admUsuario);
			this.result.redirectTo(DashBoardController.class).dashboard();
		} else {
			this.validator.add(new SimpleMessage("login.invalido", "Usuário ou senha inválidos"));
			this.validator.onErrorRedirectTo(this).formulario();
		}
	}
	
	@Get("logout")
	public void logout() {
		this.userName.logout();
		this.result.redirectTo(this).formulario();
	}
	
}
