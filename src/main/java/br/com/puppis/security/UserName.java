package br.com.puppis.security;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import javax.enterprise.context.SessionScoped;
import javax.inject.Named;

import br.com.puppis.model.AdmComercio;
import br.com.puppis.model.AdmModulo;
import br.com.puppis.model.AdmPermissao;
import br.com.puppis.model.AdmUsuario;

@SessionScoped
@Named("userName")
public class UserName implements Serializable {
	
	private Integer id;
	private Integer idComercio;
	private String nome;
	private String usuario;
	private String comercio;
	private Map<String, AdmPermissao> permissoes;
	private Set<String> modulos;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getIdComercio() {
		return idComercio;
	}
	public void setIdComercio(Integer idComercio) {
		this.idComercio = idComercio;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getUsuario() {
		return usuario;
	}
	public void setUsuario(String usuario) {
		this.usuario = usuario;
	}
	public String getComercio() {
		return comercio;
	}
	public void setComercio(String comercio) {
		this.comercio = comercio;
	}
	public Map<String, AdmPermissao> getPermissoes() {
		return permissoes;
	}
	public void setPermissoes(Map<String, AdmPermissao> permissoes) {
		this.permissoes = permissoes;
	}
	public Set<String> getModulos() {
		return modulos;
	}
	public void setModulos(Set<String> modulos) {
		this.modulos = modulos;
	}
	
	public void login(AdmUsuario usuario, AdmComercio comercio, Map<String, AdmPermissao> permissoes) {
		setId(usuario.getId());
		setIdComercio(comercio.getId());
		setNome(usuario.getNome());
		setUsuario(usuario.getUsuario());
		setComercio(comercio.getNomerazaosocial());
		setPermissoes(permissoes);
		setaModulos(comercio.getModulos());
	}
	
	public void logout() {
		setId(null);
		setIdComercio(null);
		setNome(null);
		setUsuario(null);
		setComercio(null);
		setPermissoes(null);
		setModulos(null);
	}
	
	public boolean isLogged() {
		return getId() != null;
	}
	
	private void setaModulos(Set<AdmModulo> modulos) {
		setModulos(new HashSet<String>());
		for (AdmModulo admModulo : modulos) {
			getModulos().add(admModulo.getIdmodulo().getDescricao());
		}
	}
	
}