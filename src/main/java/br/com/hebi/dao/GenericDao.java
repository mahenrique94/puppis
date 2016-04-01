package br.com.hebi.dao;

import java.io.Serializable;
import java.lang.reflect.Field;
import java.util.List;

import br.com.mhc.paginator.Paginator;
import br.com.mhc.parametrosweb.ParametrosWeb;

public interface GenericDao<T> {

	void delete(T obj);
	T edit(T obj);
	List<T> findLimit(Class clazz, List<ParametrosWeb> parametrosWeb, Integer limit);
	T find(Class clazz, List<ParametrosWeb> parametrosWeb);
	List<T> findAll(Class clazz, List<ParametrosWeb> parametrosWeb);
	List<T> findPagination(Class clazz, List<ParametrosWeb> parametrosWeb, Paginator paginator);
	T refresh(T obj);
	void save(T obj);
	
}
