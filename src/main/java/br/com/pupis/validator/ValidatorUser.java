package br.com.pupis.validator;

import br.com.pupis.model.AdmUsuario;

public class ValidatorUser {

	public boolean validar(AdmUsuario admUsuario, String usuario, String senha) {
		return admUsuario.getUsuario().equals(usuario) && admUsuario.getSenha().equals(senha);
	}
	
}
