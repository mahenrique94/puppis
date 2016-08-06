<%@include file="/config/taglibraries.jsp"%>
<section aria-expanded="true" aria-hidden="false" class="form-body" role="form">
	<input name="obj.id" type="hidden" value="${obj.id}">
	<div class="row" role="row">
		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" role="separator">
			<label><fmt:message key="label.descricao"/></label>
			<input autofocus class="form-data validate" maxlength="60" name="obj.descricao" pattern="letraNumeroEspaco" required type="text" value="${obj.descricao}">
			<netsis:validationMessage name="obj.descricao"/>
		</div>
	</div>
	<div class="row" role="row">
		<div class="col-xs-2 col-sm-2 col-md-2 col-lg-2" role="separator">
			<label><fmt:message key="label.deletar"/></label>
			<input <c:if test="${obj.deletar == true}">checked</c:if> class="form-data" name="obj.deletar" type="checkbox" value="true">
			<netsis:validationMessage name="obj.deletar"/>
		</div>
		<div class="col-xs-2 col-sm-2 col-md-2 col-lg-2" role="separator">
			<label><fmt:message key="label.editar"/></label>
			<input <c:if test="${obj.editar == true}">checked</c:if> class="form-data" name="obj.editar" type="checkbox" value="true">
			<netsis:validationMessage name="obj.editar"/>
		</div>
		<div class="col-xs-2 col-sm-2 col-md-2 col-lg-2" role="separator">
			<label><fmt:message key="label.editar"/></label>
			<input <c:if test="${obj.editar == true}">checked</c:if> class="form-data" name="obj.formulario" type="checkbox" value="true">
			<netsis:validationMessage name="obj.formulario"/>
		</div>
		<div class="col-xs-2 col-sm-2 col-md-2 col-lg-2" role="separator">
			<label><fmt:message key="label.listar"/></label>
			<input <c:if test="${obj.listar == true}">checked</c:if> class="form-data" name="obj.listar" type="checkbox" value="true">
			<netsis:validationMessage name="obj.listar"/>
		</div>
		<div class="col-xs-2 col-sm-2 col-md-2 col-lg-2" role="separator">
			<label><fmt:message key="label.salvar"/></label>
			<input <c:if test="${obj.salvar == true}">checked</c:if> class="form-data" name="obj.salvar" type="checkbox" value="true">
			<netsis:validationMessage name="obj.salvar"/>
		</div>
	</div>
</section>