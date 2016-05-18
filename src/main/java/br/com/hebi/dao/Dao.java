package br.com.hebi.dao;

import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;

@RequestScoped
public class Dao {

	@Inject
	private GenericDao dao;
	
	public GenericDao getDao() {
		return this.dao;
	}
	
}
