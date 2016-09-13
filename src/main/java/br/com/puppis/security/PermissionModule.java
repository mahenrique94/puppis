package br.com.puppis.security;

import javax.inject.Inject;

import br.com.puppis.model.AdmPermissao;

public class PermissionModule {

	@Inject
	private UserName userName;
	
	public boolean allowed(String clazz, String method) {
		AdmPermissao permissao = this.userName.getPermissoes().get(clazz.toUpperCase());
		if (permissao != null) {
			switch (method) {
				case "deletar" :
					return permissao.getDeletar() == true;
				case "editar" :
					return permissao.getEditar() == true;
				case "formulario" : 
					return permissao.getFormulario() == true;
				case "listar" :
					return permissao.getListar() == true;
				case "salvar" :
					return permissao.getSalvar() == true;
				default :
					return false;
			}
		} else {
			return true;
		}
	}
	
}
