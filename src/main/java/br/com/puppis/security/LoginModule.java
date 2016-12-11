package br.com.puppis.security;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.validator.SimpleMessage;
import br.com.caelum.vraptor.validator.Validator;
import br.com.mhc.parametrosweb.ParametrosWeb;
import br.com.puppis.controller.DashBoardController;
import br.com.puppis.controller.LoginController;
import br.com.puppis.dao.Dao;
import br.com.puppis.dao.GenericDao;
import br.com.puppis.model.AdmComercio;
import br.com.puppis.model.AdmUsuario;
import br.com.puppis.validator.ValidatorUser;

public class LoginModule {

	@Inject
	private Dao dao;
	@Inject
	private Result result;
	@Inject
	private Validator validator;
	@Inject
	private ValidatorUser validatorUser;
	@Inject
	private UserName userName;
	
	public void loga(String usuario, String senha, Integer idComercio) {
		if (this.validatorUser.validarUsuario(usuario) && this.validatorUser.validarSenha(senha)) {
			AdmUsuario admUsuario = buscaUsuario(usuario, senha);
			if (this.validatorUser.valida(admUsuario)) {
				success(admUsuario, idComercio);
			} else {
				erro();
			}
		} else {
			erro();
		}
	}
	
	private AdmUsuario buscaUsuario(String usuario, String senha) {
		PreparedStatement query = null;
		ResultSet result = null;
		try {
			query = getDao().getConnection().prepareStatement("select * from adm_usuario where usuario like ? and senha like ? and inativo <> true");
			query.setString(1, usuario);
			query.setString(2, senha);
			result = query.executeQuery();
			result.next();
			if (result.getRow() > 0)
				return getUsuario(result);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	private void erro() {
		this.validator.add(new SimpleMessage("login.invalido", "Usuário ou senha inválidos"));
		this.validator.onErrorRedirectTo(LoginController.class).formulario();
	}
	
	private void retornaLoginParaSelecionarComercio(AdmUsuario admUsuario) {
		this.result.include("usuario", admUsuario.getUsuario()).include("senha", admUsuario.getSenha()).include("AdmUsuarioComercioList", admUsuario.getComercios());
		this.result.redirectTo(LoginController.class).formulario();
	}
	
	private void success(AdmUsuario admUsuario, Integer idComercio) {
		if (admUsuario.possuiMaisDeUmComercio()) {
			if (selecionouComercio(idComercio)) {
				AdmComercio admComercio = (AdmComercio) getDao().edit(new AdmComercio(idComercio));
				this.userName.login(admUsuario, admComercio, admUsuario.getPermissoes());
				this.result.redirectTo(DashBoardController.class).dashboard();
			} else {
				retornaLoginParaSelecionarComercio(admUsuario);
			}
		} else {
			this.userName.login(admUsuario, admUsuario.getComercio(), admUsuario.getPermissoes());
			this.result.redirectTo(DashBoardController.class).dashboard();
		}
	}
	
	private GenericDao getDao() {
		return this.dao.getDao();
	}
	
	private boolean selecionouComercio(Integer idComercio) {
		return idComercio != null && idComercio >= 0;
	}
	
	private AdmUsuario getUsuario(ResultSet result) {
		try {
			return (AdmUsuario) getDao().edit(new AdmUsuario(result.getInt("id")));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
}