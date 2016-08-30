package br.com.puppis.dao;

import java.sql.Connection;
import java.util.List;

import br.com.mhc.paginator.Paginator;
import br.com.mhc.parametrosweb.ParametrosWeb;

public interface GenericDao<T> {

	void delete(T obj);
	T edit(T obj);
	List<T> executeNamedQuery(String namedQuery, Class clazz, Object[] parameters);
	void executeProcedure(String procedure, Object[] parameters, Class[] clazzs);
	T find(Class clazz, List<ParametrosWeb> parametrosWeb);
	List<T> findAll(Class clazz, List<ParametrosWeb> parametrosWeb);
	List<T> findLimit(Class clazz, List<ParametrosWeb> parametrosWeb, Integer limit);
	List<T> findPagination(Class clazz, List<ParametrosWeb> parametrosWeb, Paginator paginator);
	Connection getConnection();
	T getObj();
	T refresh(T obj);
	void save(T obj);
	
}
