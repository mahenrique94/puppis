package br.com.puppis.controller;

import java.util.ArrayList;
import java.util.List;

import br.com.caelum.brutauth.auth.annotations.CustomBrutauthRules;
import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Path;
import br.com.mhc.parametrosweb.ParametrosWeb;
import br.com.puppis.model.SysTipoOperacao;

@Controller
@Path("system/tipo-de-operacao")
public class SysTipoOperacaoController extends GenericController<SysTipoOperacao> {

	protected SysTipoOperacao buscaOperacaoPorDescricao(String descricao) {
		List<ParametrosWeb> parametrosWeb = new ArrayList<ParametrosWeb>();
		parametrosWeb.add(new ParametrosWeb("descricao", descricao));
		SysTipoOperacao sysTipoOperacao = (SysTipoOperacao) this.getDao().find(SysTipoOperacao.class, parametrosWeb);
		return sysTipoOperacao;
	}
	
}
