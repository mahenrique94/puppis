package br.com.puppis.dao;

import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;

@RequestScoped
public class Dao {

	private GenericDao dao;
	
	@Inject
	public Dao(GenericDao dao) {
		// TODO Auto-generated constructor stub
		this.dao = dao;
	}
	@Deprecated
	public Dao() {
		// TODO Auto-generated constructor stub
	}
	
	public GenericDao getDao() {
		return this.dao;
	}
	
}
