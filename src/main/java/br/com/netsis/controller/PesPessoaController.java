package br.com.netsis.controller;

import java.util.Calendar;

import javax.validation.Valid;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.interceptor.IncludeParameters;
import br.com.netsis.model.PesDocumento;
import br.com.netsis.model.PesPessoa;

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
		if (obj.getId() != null) {
			obj.getEndereco().setIdpessoa(new PesPessoa(obj.getId()));
			obj.getDocumento().setIdpessoa(new PesPessoa(obj.getId()));
		}
		super.salvar(obj);
	}
	
}
