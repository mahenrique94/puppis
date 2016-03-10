package br.com.yumer.interceptor;

import javax.inject.Inject;
import javax.persistence.EntityManager;

import br.com.caelum.vraptor.AfterCall;
import br.com.caelum.vraptor.BeforeCall;
import br.com.caelum.vraptor.Intercepts;

@Intercepts
public class EntityManagerInterceptor {

	@Inject
	private EntityManager em;
	
	@AfterCall
	public void after() {
		this.em.getTransaction().commit();
	}
	
	@BeforeCall
	public void before() {
		this.em.getTransaction().begin();
	}
	
	
}
