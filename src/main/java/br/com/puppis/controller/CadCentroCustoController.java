package br.com.puppis.controller;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.mhc.parametrosweb.ParametrosWeb;
import br.com.puppis.model.CadCentroCusto;

import java.util.ArrayList;
import java.util.List;

@Controller
@Path("cadastro/centro-de-custo")
public class CadCentroCustoController extends GenericController<CadCentroCusto> {

	@Get("{obj.id}")
	@Override
	public void editar(CadCentroCusto obj) {
		// TODO Auto-generated method stub
		super.editar(obj);
	}

	@Get("json")
	@Override
	public void toJSON(CadCentroCusto obj, List<ParametrosWeb> parametrosWeb) {
		if (parametrosWeb == null) {
			parametrosWeb = new ArrayList<ParametrosWeb>();
		}
		parametrosWeb.add(new ParametrosWeb("id", "0", null, ">", null, "descricao"));
		super.toJSON(obj, parametrosWeb);
	}

}
