package br.com.yumer.validator;

import br.com.yumer.model.AdmUsuario;

public class ValidatorUsuario {

	public boolean validar(AdmUsuario admUsuario, String usuario, String senha) {
		return admUsuario.getUsuario().equals(usuario) && admUsuario.getSenha().equals(senha);
	}
	
}
