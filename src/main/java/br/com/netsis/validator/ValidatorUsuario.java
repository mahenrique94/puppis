package br.com.netsis.validator;

import br.com.netsis.model.AdmUsuario;

public class ValidatorUsuario {

	public boolean validar(AdmUsuario admUsuario, String usuario, String senha) {
		return admUsuario.getUsuario().equals(usuario) && admUsuario.getSenha().equals(senha);
	}
	
}
