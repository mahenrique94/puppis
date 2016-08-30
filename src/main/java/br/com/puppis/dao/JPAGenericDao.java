package br.com.puppis.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.inject.Inject;
import javax.persistence.EntityManager;
import javax.persistence.ParameterMode;
import javax.persistence.Query;
import javax.persistence.StoredProcedureQuery;
import javax.persistence.TypedQuery;

import org.hibernate.Session;
import org.hibernate.engine.spi.SessionFactoryImplementor;

import br.com.mhc.paginator.Paginator;
import br.com.mhc.parametrosweb.ParametrosWeb;
import br.com.mhc.parametrosweb.ParametrosWebBuilder;
import br.com.puppis.model.PesDefinicao;

public class JPAGenericDao<T> implements GenericDao<T> {

	@Inject
	private EntityManager em;
	private T obj;

	@Override
	public void delete(T obj) {
		// TODO Auto-generated method stub
		this.em.remove(this.em.getReference(obj.getClass(), this.em.getEntityManagerFactory().getPersistenceUnitUtil().getIdentifier(obj)));
	}
	
	@Override
	public T edit(T obj) {
		// TODO Auto-generated method stub
		return (T) this.em.find(obj.getClass(), this.em.getEntityManagerFactory().getPersistenceUnitUtil().getIdentifier(obj));
	}
	
	@Override
	public List<T> executeNamedQuery(String namedQuery, Class clazz, Object[] parameters) {
		// TODO Auto-generated method stub
		TypedQuery query = this.em.createNamedQuery(namedQuery, clazz);
		addParameters(query, parameters);
		return query.getResultList();
	}
	

	@Override
	public void executeProcedure(String procedure, Object[] parameters, Class[] clazzs) {
		// TODO Auto-generated method stub
		StoredProcedureQuery query = this.em.createStoredProcedureQuery(procedure);
		for (int i = 0; i < clazzs.length; i++) {
			query.registerStoredProcedureParameter(i, clazzs[i], ParameterMode.IN);
		}
		addParameters(query, parameters);
		query.execute();
	}
	
	@Override
	public T find(Class clazz, List<ParametrosWeb> parametrosWeb) {
		// TODO Auto-generated method stub
		try {
			return (T) this.em.createQuery(new ParametrosWebBuilder().createQuery(clazz, parametrosWeb)).setFirstResult(0).setMaxResults(1).getSingleResult();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
	
	@Override
	public List<T> findAll(Class clazz, List<ParametrosWeb> parametrosWeb) {
		// TODO Auto-generated method stub
		int max = parametrosWeb != null && parametrosWeb.get(0).getLimit() != null ? parametrosWeb.get(0).getLimit() : 100;
		try {
			return this.em.createQuery(new ParametrosWebBuilder().createQuery(clazz, parametrosWeb)).setFirstResult(0).setMaxResults(max).getResultList();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
	
	@Override
	public List<T> findLimit(Class clazz, List<ParametrosWeb> parametrosWeb, Integer limite) {
		// TODO Auto-generated method stub
		try {
			return this.em.createQuery(new ParametrosWebBuilder().createQuery(clazz, parametrosWeb)).setFirstResult(0).setMaxResults(limite).getResultList();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
	
	@Override
	public List<T> findPagination(Class clazz, List<ParametrosWeb> parametrosWeb, Paginator paginator) {
		try {
			return this.em.createQuery(new ParametrosWebBuilder().createQuery(clazz, parametrosWeb)).setFirstResult(paginator.getFirst()).setMaxResults(paginator.getInterval()).getResultList();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
	
	@Override
	public Connection getConnection() {
		Session session = (Session) this.em.getDelegate();
		SessionFactoryImplementor sessionFactory = (SessionFactoryImplementor) session.getSessionFactory();
		try {
			return sessionFactory.getConnectionProvider().getConnection();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			return null;
		}
	}
	
	@Override
	public T getObj() {
		// TODO Auto-generated method stub
		return this.obj;
	}
	
	@Override
	public T refresh(T obj) {
		// TODO Auto-generated method stub
		this.em.refresh(obj);
		return obj;
	}
	
	@Override
	public void save(T obj) {
		// TODO Auto-generated method stub
		this.obj = this.em.merge(obj);
	}
	
	private void addParameters(Query query, Object[] parameters) {
		for (int i = 0; i < parameters.length; i++) {
			query.setParameter(i, parameters[i]);
		}
	}
	
}
