package br.com.puppis.interceptor;

import javax.inject.Inject;

import br.com.caelum.vraptor.InterceptionException;
import br.com.caelum.vraptor.Intercepts;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.controller.ControllerMethod;
import br.com.caelum.vraptor.core.InterceptorStack;
import br.com.caelum.vraptor.interceptor.Interceptor;
import br.com.caelum.vraptor.view.Results;
import br.com.puppis.security.PermissionModule;
import br.com.puppis.security.UserName;

@Intercepts
public class PermissionInterceptor implements Interceptor {
	
	@Inject
	private Result result;
	@Inject
	private PermissionModule permissionModule;
	@Inject
	private UserName userName;

	@Override
	public boolean accepts(ControllerMethod method) {
		// TODO Auto-generated method stub
		return this.userName.isLogged();
	}

	@Override
	public void intercept(InterceptorStack stack, ControllerMethod method, Object obj) throws InterceptionException {
		// TODO Auto-generated method stub
		if (this.permissionModule.allowed(obj.getClass().getSimpleName().substring(0, obj.getClass().getSimpleName().lastIndexOf("Controller")), method.getMethod().getName()))
			stack.next(method, obj);
		else
			this.result.use(Results.http()).sendError(403);
	}

}
