package br.com.puppis.validator;

import br.com.puppis.model.AdmUsuario;

public class ValidatorUser {

	public boolean validar(AdmUsuario admUsuario, String usuario, String senha) {
		return admUsuario.getUsuario().equals(usuario) && admUsuario.getSenha().equals(senha) 
				&& admUsuario.getComercios() != null && !admUsuario.getComercios().isEmpty();
	}
	
}
