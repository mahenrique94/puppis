package br.com.netsis.dao;

import java.io.Serializable;
import java.lang.reflect.Field;
import java.util.List;

import javax.inject.Inject;
import javax.persistence.EntityManager;

import br.com.mhc.paginator.Paginator;
import br.com.mhc.parametrosweb.ParametrosWeb;
import br.com.mhc.parametrosweb.ParametrosWebBuilder;

public class JPAGenericDao<T> implements GenericDao<T>{

	@Inject
	private EntityManager em;
	private final ParametrosWebBuilder parametrosWebBuilder = new ParametrosWebBuilder();

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
	public T find(Class clazz, List<ParametrosWeb> parametrosWeb) {
		// TODO Auto-generated method stub
		return (T) this.em.createQuery(parametrosWebBuilder.buildJpql(clazz, parametrosWeb)).setFirstResult(0).setMaxResults(1).getSingleResult();
	}
	
	@Override
	public List<T> findAll(Class clazz, List<ParametrosWeb> parametrosWeb) {
		// TODO Auto-generated method stub
		int max = parametrosWeb != null ? parametrosWeb.get(0).getLimit() : 100;
		return this.em.createQuery(parametrosWebBuilder.buildJpql(clazz, parametrosWeb)).setFirstResult(0).setMaxResults(max).getResultList();
	}
	
	@Override
	public List<T> findPagination(Class clazz, List<ParametrosWeb> parametrosWeb, Paginator paginator) {
		return this.em.createQuery(parametrosWebBuilder.buildJpql(clazz, parametrosWeb)).setFirstResult(paginator.getFirst()).setMaxResults(paginator.getInterval()).getResultList();
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
