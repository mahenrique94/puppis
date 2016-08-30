package br.com.puppis.security;

import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;

import javax.enterprise.context.SessionScoped;
import javax.inject.Named;

import br.com.puppis.model.AdmComercio;
import br.com.puppis.model.AdmPermissao;
import br.com.puppis.model.AdmUsuario;

@SessionScoped
@Named("username")
public class UserName implements Serializable {
	
	private AdmUsuario usuario;
	private AdmComercio comercio;
	private Map<String, AdmPermissao> permissoes;
	
	public void login(AdmUsuario usuario, AdmComercio comercio, Map<String, AdmPermissao> permissoes) {
		this.usuario = usuario;
		this.comercio = comercio;
		this.permissoes = permissoes;
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
	public Map<String, AdmPermissao> getPermissoes() {
		return permissoes;
	}
	
	public boolean isLogged() {
		return this.usuario != null;
	}
	
}