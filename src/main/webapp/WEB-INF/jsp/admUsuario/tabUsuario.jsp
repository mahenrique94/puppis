<%@include file="/config/taglibraries.jsp"%>
<section aria-expanded="true" aria-hidden="false" class="form-body" role="form">
	<input name="obj.id" type="hidden" value="${obj.id}">
	<input name="obj.idgrupo.idaux" type="hidden" value="${obj.idgrupo.id}">
	<div class="row" role="row">
		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" role="separator">
			<label><fmt:message key="label.nome"/></label>
			<input autofocus class="form-data validate" maxlength="60" name="obj.nome" pattern="letraNumeroEspaco" required type="text" value="${obj.nome}">
			<netsis:validationMessage name="obj.nome"/>
		</div>
	</div>
	<div class="row" role="row">
		<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6" role="separator">
			<label><fmt:message key="label.usuario"/></label>
			<input class="form-data validate" maxlength="30" name="obj.usuario" pattern="letraNumero" required type="text" value="${obj.usuario}">
			<netsis:validationMessage name="obj.usuario"/>
		</div>
		<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6" role="separator">
			<label><fmt:message key="label.senha"/></label>
			<input class="form-data validate" maxlength="8" name="obj.senha" pattern="letraNumeroMin8Max8" required type="password" value="${obj.senha}">
			<netsis:validationMessage name="obj.senha"/>
		</div>
	</div>
	<div class="row" role="row">
		<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6" role="separator">
			<label><fmt:message key="label.grupo"/></label>
			<select class="form-data validate" data-class="slAdmGrupo" id="slAdministrador_Usuario_Grupo_Json_01" name="obj.idgrupo.id"></select>
			<netsis:validationMessage name="obj.idgrupo.id"/>
		</div>
		<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6" role="separator">
				<label><fmt:message key="label.tipo.acesso"/></label>
				<select class="form-data validate" data-class="slAdmTipoAcesso" id="slAdministrador_Usuario_Tipo-de-acesso_Json_01" name="obj.idtipoacesso.id"></select>
				<netsis:validationMessage name="obj.idtipoacesso.id"/>
			</div>
	</div>
	<div class="row" role="row">
		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" role="separator">
			<label><fmt:message key="label.inativo"/></label>
			<input <c:if test="${obj.inativo == true}">checked</c:if> class="form-data" name="obj.inativo" type="checkbox" value="true">
		</div>
	</div>
</section>