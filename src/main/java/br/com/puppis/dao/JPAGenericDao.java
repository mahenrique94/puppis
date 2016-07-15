package br.com.puppis.dao;

import java.util.List;

import javax.inject.Inject;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import br.com.mhc.paginator.Paginator;
import br.com.mhc.parametrosweb.ParametrosWeb;
import br.com.mhc.parametrosweb.ParametrosWebBuilder;
import br.com.puppis.model.PesDefinicao;

public class JPAGenericDao<T> implements GenericDao<T>{

	@Inject
	private EntityManager em;

	public JPAGenericDao(EntityManager em) {
		this.em = em;
	}
	
	@Deprecated
	public JPAGenericDao() {}

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
	public List<T> executeNamedQuery(String namedQuery, Class clazz, Object[] parametros) {
		// TODO Auto-generated method stub
		TypedQuery query = this.em.createNamedQuery(namedQuery, clazz);
		for (int i = 0; i < parametros.length; i++) {
			query.setParameter(i, parametros[i]);
		}
		return query.getResultList();
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
	public T refresh(T obj) {
		// TODO Auto-generated method stub
		this.em.refresh(obj);
		return obj;
	}
	
	@Override
	public void save(T obj) {
		// TODO Auto-generated method stub
		this.em.merge(obj);
	}
	
}
