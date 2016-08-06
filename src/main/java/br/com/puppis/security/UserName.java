package br.com.puppis.security;

import java.io.Serializable;

import javax.enterprise.context.SessionScoped;
import javax.inject.Named;

import br.com.puppis.model.AdmComercio;
import br.com.puppis.model.AdmUsuario;

@SessionScoped
@Named("username")
public class UserName implements Serializable {
	
	private AdmUsuario usuario;
	private AdmComercio comercio;
	
	public void login(AdmUsuario usuario, AdmComercio comercio) {
		this.usuario = usuario;
		this.comercio = comercio;
	}
	
	public void logout() {
		this.usuario = null;
	}
	
	public AdmUsuario getUsuario() {
		return this.usuario;
	}
	public AdmComercio getComercio() {
		return comercio;
	}
	
	public boolean isLogado() {
		return this.usuario != null;
	}
	
}