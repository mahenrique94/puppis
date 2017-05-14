package br.com.puppis.validator;

import br.com.puppis.model.AdmUsuario;

public class ValidatorUser {

	public boolean active(AdmUsuario usuario) {
		return usuario.isActive();
	}
	
	public boolean campare(AdmUsuario admUsuario, String usuario, String senha) {
		return admUsuario.getUsuario().equals(usuario) && admUsuario.getSenha().equals(senha);
	}
	
	public boolean valida(AdmUsuario usuario) {
		return usuario != null && usuario.getId() != null && active(usuario) && validarUsuario(usuario.getUsuario()) && validarSenha(usuario.getSenha());
	}
	
	public boolean validarUsuario(String usuario) {
		return usuario != null && usuario.length() > 0 && !usuario.equals("");
	}
	
	public boolean validarSenha(String senha) {
		return senha != null && senha.length() == 8 && !senha.equals("");
	}
	
}
