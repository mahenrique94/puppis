package br.com.hebi.security;

import java.io.Serializable;

import javax.enterprise.context.SessionScoped;
import javax.inject.Named;

import br.com.hebi.model.AdmUsuario;

@SessionScoped
@Named("username")
public class UserName implements Serializable {
	
	private AdmUsuario usuario;
	
	public AdmUsuario getUsuario() {
		return this.usuario;
	}
	
	public boolean isLogado() {
		return this.usuario != null;
	}
	
	public void login(AdmUsuario usuario) {
		this.usuario = usuario;
	}
	
	public void logout() {
		this.usuario = null;
	}
	
}