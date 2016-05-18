package br.com.hebi.validator;

import br.com.hebi.model.AdmUsuario;

public class ValidatorUser {

	public boolean validar(AdmUsuario admUsuario, String usuario, String senha) {
		return admUsuario.getUsuario().equals(usuario) && admUsuario.getSenha().equals(senha);
	}
	
}
