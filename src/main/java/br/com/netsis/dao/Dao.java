package br.com.netsis.dao;

import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;

@RequestScoped
public class Dao {

	@Inject
	private GenericDao dao;
	
	public GenericDao getDao() {
		return dao;
	}
	
}
