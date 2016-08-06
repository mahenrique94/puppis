package br.com.puppis.controller;

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
import br.com.puppis.dao.Dao;
import br.com.puppis.dao.GenericDao;
import br.com.puppis.model.AdmComercio;
import br.com.puppis.model.AdmModulo;
import br.com.puppis.model.AdmUsuario;
import br.com.puppis.security.UserName;
import br.com.puppis.validator.ValidatorUser;

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

	@Get("formulario")
	@Public
	public void formulario() {}
	
	@Post("")
	@Public
	public void login(String usuario, String senha, Integer idComercio) {
		List<ParametrosWeb> parametrosWeb = new ArrayList<ParametrosWeb>();
		parametrosWeb.add(new ParametrosWeb("usuario", usuario));
		parametrosWeb.add(new ParametrosWeb("senha", senha));
		parametrosWeb.add(new ParametrosWeb("inativo", "true", null, "<>"));
		AdmUsuario admUsuario = (AdmUsuario) getDao().find(AdmUsuario.class, parametrosWeb);
		if (admUsuario != null && new ValidatorUser().validar(admUsuario, usuario, senha)) {
			if (admUsuario.getComercios() != null && admUsuario.getComercios().size() > 1) {
				if (idComercio != null && idComercio >= 0) {
					AdmComercio admComercio = (AdmComercio) getDao().edit(new AdmComercio(idComercio));
					this.userName.login(admUsuario, admComercio);
					this.result.redirectTo(DashBoardController.class).dashboard();
				} else {
					this.result.include("usuario", usuario).include("senha", senha).include("AdmUsuarioComercioList", admUsuario.getComercios());
					this.result.redirectTo(this).formulario();
				}
			} else {
				this.userName.login(admUsuario, admUsuario.getComercios().iterator().next().getIdcomercio());
				this.result.redirectTo(DashBoardController.class).dashboard();
			}
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
	
	private GenericDao getDao() {
		return this.dao.getDao();
	}
	
}
