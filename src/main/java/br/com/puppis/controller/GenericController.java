package br.com.puppis.controller;

import java.util.ArrayList;
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
import br.com.mhc.function.ClassFunction;
import br.com.mhc.paginator.Paginator;
import br.com.mhc.parametrosweb.ParametrosWeb;
import br.com.puppis.dao.Dao;
import br.com.puppis.dao.GenericDao;
import br.com.puppis.model.AdmUsuario;

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
		this.result.nothing();
	}
	
	@Get
	public void editar(T obj) {
		this.result.include("obj", edit(obj));
		this.result.of(this).formulario(obj);
	}
	
	@Get("formulario")
	public void formulario(T obj) {
		if (obj == null)
			this.result.include("obj", ClassFunction.invokeConstructorDefault(obj.getClass()));
		else
			this.result.include("obj", obj);
	}
	
	@Get("")
	public void listar(T obj, List<ParametrosWeb> parametrosWeb) {
		parametrosWeb = filterIdGreaterThanZero(parametrosWeb);
		this.result.include(getClassName(obj) + "List", getDao().findAll(obj.getClass(), parametrosWeb)).include("parametrosWeb", parametrosWeb);
	}

	@Get("listarsl")
	public void listarSL(T obj, List<ParametrosWeb> parametrosWeb) {
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
		this.result.include("mensagem", "mensagem.operacao.sucesso");
		if(isRedirect())
			this.result.redirectTo(this).listar(obj, null);
	}	
	
	@Get("json")
	public void toJSON(T obj, List<ParametrosWeb> parametrosWeb) {

		this.result.use(Results.json()).from(getDao().findAll(obj.getClass(), parametrosWeb)).serialize();
	}
	
	@Get("xml")
	public void toXML(T obj, List<ParametrosWeb> parametrosWeb) {
		this.result.use(Results.xml()).from(getDao().findAll(obj.getClass(), parametrosWeb)).recursive().serialize();
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
	
	protected T getObj() {
		return (T) getDao().getObj();
	}
	
	protected void setRedirect(boolean redirect) {
		this.redirect = redirect;
	}
	
	protected List<AdmUsuario> buscarTodos(Class clazz) {
		return getDao().findAll(clazz, null);
	}

	protected List<ParametrosWeb> filterIdGreaterThanOne(List<ParametrosWeb> parametrosWeb) {
		return filterByIdGreaterThan(parametrosWeb, 1);
	}

	protected List<ParametrosWeb> filterIdGreaterThanZero(List<ParametrosWeb> parametrosWeb) {
		return filterByIdGreaterThan(parametrosWeb, 0);
	}

	private List<ParametrosWeb> filterByIdGreaterThan(List<ParametrosWeb> parametrosWeb, int id) {
		if (parametrosWeb == null) {
			parametrosWeb = new ArrayList<ParametrosWeb>();
		}
		parametrosWeb.add(new ParametrosWeb("id", Integer.toString(id), null, ">"));
		return parametrosWeb;
	}

	private boolean isRedirect() {
		return redirect;
	}
	
}
