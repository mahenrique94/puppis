package br.com.puppis.interceptor;

import javax.inject.Inject;
import javax.persistence.EntityManager;

import br.com.caelum.vraptor.AfterCall;
import br.com.caelum.vraptor.BeforeCall;
import br.com.caelum.vraptor.Intercepts;

@Intercepts
public class EntityManagerInterceptor {

	private EntityManager em;
	
	@Inject
	public EntityManagerInterceptor(EntityManager em) {
		// TODO Auto-generated constructor stub
		this.em = em;
	}
	@Deprecated
	public EntityManagerInterceptor() {
		// TODO Auto-generated constructor stub
	}
	
	@BeforeCall
	public void before() {
		this.em.getTransaction().begin();
	}
	
	@AfterCall
	public void after() {
		this.em.getTransaction().commit();
	}
	
}
