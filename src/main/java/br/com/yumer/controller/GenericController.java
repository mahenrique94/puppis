package br.com.yumer.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.validation.Valid;

import br.com.caelum.brutauth.auth.annotations.CustomBrutauthRules;
import br.com.caelum.vraptor.Delete;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.interceptor.IncludeParameters;
import br.com.caelum.vraptor.validator.Validator;
import br.com.caelum.vraptor.view.Results;
import br.com.mhc.paginator.Paginator;
import br.com.mhc.parametrosweb.ParametrosWeb;
import br.com.yumer.dao.Dao;
import br.com.yumer.dao.GenericDao;
import br.com.yumer.security.PermissionDelete;
import br.com.yumer.security.PermissionEdit;
import br.com.yumer.security.PermissionList;
import br.com.yumer.security.PermissionSave;

public abstract class GenericController<T> {
	
	@Inject
	protected Dao dao;
	@Inject
	protected Result result;
	@Inject
	private Validator validator;
	private boolean redirecionar = true;
	
	@CustomBrutauthRules(PermissionDelete.class)
	@Delete("")
	public void deletar(T obj) {
		this.getDao().delete(obj);
		if(this.isRedirecionar())
			this.result.redirectTo(this).listar(obj, null);
	}
	
	@CustomBrutauthRules(PermissionEdit.class)
	@Get
	public void editar(T obj) {
		this.result.include("obj", this.edit(obj));
		this.result.of(this).formulario(obj);
	}
	
	@CustomBrutauthRules(PermissionSave.class)
	@Get("formulario")
	public void formulario(T obj) {}
	
	@CustomBrutauthRules(PermissionList.class)
	@Get("")
	public void listar(T obj, List<ParametrosWeb> parametrosWeb) {
		this.result.include(this.getClassName(obj) + "List", this.getDao().findAll(obj.getClass(), parametrosWeb));
	}
	
	@CustomBrutauthRules(PermissionList.class)
	@Get("listarsl")
	public void listarSl(T obj, List<ParametrosWeb> parametrosWeb) {
		this.result.include(this.getClassName(obj) + "List", this.getDao().findAll(obj.getClass(), parametrosWeb));
	}
	
	@CustomBrutauthRules(PermissionList.class)
	@Get("page/{paginator.currentPage}")
	public void pagination(T obj, List<ParametrosWeb> parametrosWeb, Paginator paginator) {
		paginator.setFirst((paginator.getCurrentPage() * 10) - 10);
		paginator.setInterval(10);
		List<T> objRecords = this.getDao().findAll(obj.getClass(), null);
		List<T> objList = this.getDao().findPagination(obj.getClass(), null, paginator);
		paginator.setRecords(objRecords.size());
		paginator.setPages((paginator.getRecords() / paginator.getInterval()) + 1);
		this.result.include(this.getClassName(obj) + "List", objList);
		this.result.include("paginator", paginator);
	}
	
	@CustomBrutauthRules(PermissionSave.class)
	@Post("")
	@IncludeParameters
	public void salvar(@Valid T obj) {
		this.validator.onErrorForwardTo(this).formulario(obj);
		this.getDao().save(obj);
		this.result.include("mensagem", "Operação concluída com sucesso");
		if(this.isRedirecionar())
			this.result.redirectTo(this).listar(obj, null);
	}	
	
	@Get("json")
	public void toJSON(T obj, List<ParametrosWeb> parametrosWeb) {
		List<T> list = this.getDao().findAll(obj.getClass(), parametrosWeb);
		this.result.use(Results.json()).from(list).serialize();
	}
	
	@Get("xml")
	public void toXML(T obj, List<ParametrosWeb> parametrosWeb) {
		List<T> list = this.getDao().findAll(obj.getClass(), parametrosWeb);
		this.result.use(Results.xml()).from(list).recursive().serialize();
	}
	
	protected Object edit(T obj) {
		return this.getDao().edit(obj);
	}
	
	protected String getClassName(T obj) {
		return obj.getClass().getSimpleName();
	}
	
	protected GenericDao getDao() {
		return this.dao.getDao();
	}
	
	private boolean isRedirecionar() {
		return redirecionar;
	}

	protected void setRedirecionar(boolean redirecionar) {
		this.redirecionar = redirecionar;
	}
	
}
