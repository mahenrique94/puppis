package br.com.hebi.controller;

import java.util.List;

import javax.inject.Inject;
import javax.validation.Valid;

import br.com.caelum.vraptor.Delete;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.interceptor.IncludeParameters;
import br.com.caelum.vraptor.validator.Validator;
import br.com.caelum.vraptor.view.Results;
import br.com.hebi.dao.Dao;
import br.com.hebi.dao.GenericDao;
import br.com.mhc.paginator.Paginator;
import br.com.mhc.parametrosweb.ParametrosWeb;

public abstract class GenericController<T> {
	
	@Inject
	protected Dao dao;
	@Inject
	protected Result result;
	@Inject
	private Validator validator;
	private boolean redirect = true;
	
	@Delete("")
	public void deletar(T obj) {
		this.getDao().delete(obj);
		if(this.isRedirect())
			this.result.redirectTo(this).listar(obj, null);
	}
	
	@Get
	public void editar(T obj) {
		this.result.include("obj", edit(obj));
		this.result.of(this).formulario(obj);
	}
	
	@Get("formulario")
	public void formulario(T obj) {}
	
	@Get("")
	public void listar(T obj, List<ParametrosWeb> parametrosWeb) {
		this.result.include(getClassName(obj) + "List", getDao().findAll(obj.getClass(), parametrosWeb));
	}
	
	@Get("listarsl")
	public void listarSl(T obj, List<ParametrosWeb> parametrosWeb) {
		this.result.include(getClassName(obj) + "List", getDao().findAll(obj.getClass(), parametrosWeb));
	}
	
	@Get("pagina/{paginator.currentPage}")
	public void paginacao(T obj, List<ParametrosWeb> parametrosWeb, Paginator paginator) {
		paginator.setFirst((paginator.getCurrentPage() * 10) - 10);
		paginator.setInterval(10);
		List<T> objRecords = getDao().findAll(obj.getClass(), parametrosWeb);
		List<T> objList = getDao().findPagination(obj.getClass(), parametrosWeb, paginator);
		paginator.setRecords(objRecords.size());
		paginator.setPages((paginator.getRecords() / paginator.getInterval()) + 1);
		this.result.include(getClassName(obj) + "List", objList);
		this.result.include("paginator", paginator);
		this.result.include("parametrosWeb", parametrosWeb);
	}
	
	@Post("")
	@IncludeParameters
	public void salvar(@Valid T obj) {
		this.validator.onErrorForwardTo(this).formulario(obj);
		getDao().save(obj);
		this.result.include("mensagem", "Operação concluída com sucesso");
		if(isRedirect())
			this.result.redirectTo(this).listar(obj, null);
	}	
	
	@Get("json")
	public void toJSON(T obj, List<ParametrosWeb> parametrosWeb) {
		List<T> list = getDao().findAll(obj.getClass(), parametrosWeb);
		this.result.use(Results.json()).from(list).serialize();
	}
	
	@Get("xml")
	public void toXML(T obj, List<ParametrosWeb> parametrosWeb) {
		List<T> list = getDao().findAll(obj.getClass(), parametrosWeb);
		this.result.use(Results.xml()).from(list).recursive().serialize();
	}
	
	protected Object edit(T obj) {
		return getDao().edit(obj);
	}
	
	protected String getClassName(T obj) {
		return obj.getClass().getSimpleName();
	}
	
	protected GenericDao getDao() {
		return this.dao.getDao();
	}
	
	private boolean isRedirect() {
		return redirect;
	}

	protected void setRedirect(boolean redirect) {
		this.redirect = redirect;
	}
	
}
