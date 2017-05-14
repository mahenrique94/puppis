package br.com.puppis.controller;

import java.util.ArrayList;
import java.util.List;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.mhc.parametrosweb.ParametrosWeb;
import br.com.puppis.model.CadCidade;

@Controller
@Path("cadastro/cidade")
public class CadCidadeController extends GenericController<CadCidade> {

	@Get("json")
	@Override
	public void toJSON(CadCidade obj, List<ParametrosWeb> parametrosWeb) {
		// TODO Auto-generated method stub
		if (parametrosWeb == null) {
			parametrosWeb = new ArrayList<>();
			parametrosWeb.add(new ParametrosWeb());
			parametrosWeb.get(0).setCampo("");
			parametrosWeb.get(0).setParametroInicial("");
		}
		parametrosWeb.get(0).setOrderBy("descricao");
		parametrosWeb.get(0).setLimit(999999999);
		super.toJSON(obj, parametrosWeb);
	}
	
}
