package br.com.puppis.controller;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.mhc.parametrosweb.ParametrosWeb;
import br.com.puppis.model.AdmComercio;

import java.util.List;

@Controller
@Path("administrador/comercio")
public class AdmComercioController extends GenericController<AdmComercio> {

	@Get("{obj.id}")
	@Override
	public void editar(AdmComercio obj) {
		// TODO Auto-generated method stub
		super.editar(obj);
	}

	@Get("json")
	@Override
	public void toJSON(AdmComercio obj, List<ParametrosWeb> parametrosWeb) {
		super.toJSON(obj, super.filterIdGreaterThanOne(parametrosWeb));
	}

	@Post("")
	@Override
	public void salvar(AdmComercio obj) {
		// TODO Auto-generated method stub
		super.setRedirect(false);
		if (obj.getId() == null) {
			obj.getContato().setIdcomercio(obj);
			obj.getEndereco().setIdcomercio(obj);
			obj.getDocumento().setIdcomercio(obj);
			obj.getPagamento().setIdcomercio(obj);
		}
		super.salvar(obj);
		super.result.redirectTo(this).editar(super.getObj());
	}
	
}
