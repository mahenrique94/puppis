package br.com.puppis.controller;

import java.util.List;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Delete;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.view.Results;
import br.com.mhc.parametrosweb.ParametrosWeb;
import br.com.puppis.model.PsClasse;

@Controller
@Path("produto-servico/classe")
public class PsClasseController extends GenericController<PsClasse> {

	@Get("{obj.id}")
	@Override
	public void editar(PsClasse obj) {
		// TODO Auto-generated method stub
		super.editar(obj);
	}
	
	@Get("json")
	@Override
	public void toJSON(PsClasse obj, List<ParametrosWeb> parametrosWeb) {
		// TODO Auto-generated method stub
		List<PsClasse> list = this.getDao().findAll(PsClasse.class, parametrosWeb);
		this.result.use(Results.json()).from(list).include("idgrupo").serialize();
	}
	
}
