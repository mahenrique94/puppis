package br.com.hebi.controller;

import javax.validation.Valid;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.interceptor.IncludeParameters;
import br.com.hebi.model.PesPessoa;

@Controller
@Path("pessoa")
public class PesPessoaController extends GenericController<PesPessoa> {

	@Get("{obj.id}")
	@Override
	public void editar(PesPessoa obj) {
		// TODO Auto-generated method stub
		super.editar(obj);
	}
	
	@Post("")
	@IncludeParameters
	@Override
	public void salvar(@Valid PesPessoa obj) {
		// TODO Auto-generated method stub
		if (obj.getId() == null && obj.getEndereco().getId() == null && obj.getDocumento().getId() == null) {
			obj.getEndereco().setIdpessoa(obj);
			obj.getDocumento().setIdpessoa(obj);
		}
		super.salvar(obj);
	}
	
}
