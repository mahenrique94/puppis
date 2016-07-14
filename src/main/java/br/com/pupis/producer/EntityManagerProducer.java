package br.com.pupis.producer;

import javax.enterprise.context.ApplicationScoped;
import javax.enterprise.context.RequestScoped;
import javax.enterprise.inject.Disposes;
import javax.enterprise.inject.Produces;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

@ApplicationScoped
public class EntityManagerProducer {

	private static EntityManagerFactory factory = Persistence.createEntityManagerFactory("default");
	
	@Produces
	@RequestScoped
	public EntityManager getEntityManager() {
		return factory.createEntityManager();
	}
	
	public void close(@Disposes EntityManager em) {
		em.close();
	}
	
}
