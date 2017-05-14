package br.com.puppis.interceptor;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import br.com.caelum.vraptor.InterceptionException;
import br.com.caelum.vraptor.Intercepts;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.controller.ControllerMethod;
import br.com.caelum.vraptor.core.InterceptorStack;
import br.com.caelum.vraptor.interceptor.Interceptor;
import br.com.mhc.parametrosweb.ParametrosWeb;
import br.com.puppis.controller.AdmPermissaoController;
import br.com.puppis.model.AdmPermissao;
import br.com.puppis.security.UserName;

@Intercepts
public class BlockInterceptor implements Interceptor {

	private UserName userName;
	private Result result;
	
	@Inject
	public BlockInterceptor(UserName userName, Result result) {
		// TODO Auto-generated constructor stub
		this.userName = userName;
		this.result = result;
	}
	public BlockInterceptor() {
		// TODO Auto-generated constructor stub
	}
	
	@Override
	public boolean accepts(ControllerMethod method) {
		// TODO Auto-generated method stub
		return this.userName.isLogged();
	}

	@Override
	public void intercept(InterceptorStack stack, ControllerMethod method, Object obj) throws InterceptionException {
		// TODO Auto-generated method stub
		if (this.userName.getUsuario().equals("PERMISSION") || this.userName.getUsuario().equals("PERMISSAO")) {
			String model = obj.getClass().getSimpleName().substring(0, obj.getClass().getSimpleName().lastIndexOf("Controller"));
			if (!model.equals("DashBoard") && !model.equals("Login") && !model.equals("Generic") && !model.equals("AdmPermissao")) {
				List<ParametrosWeb> parametrosWeb = new ArrayList<ParametrosWeb>();
				parametrosWeb.add(new ParametrosWeb("tabela", model.toUpperCase()));
				this.result.redirectTo(AdmPermissaoController.class).listar(new AdmPermissao(), parametrosWeb);
			} else {
				stack.next(method, obj);
			}
		} else {
			stack.next(method, obj);
		}
	}

}
