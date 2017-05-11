<%@include file="/config/taglibraries.jsp"%>
<section class="o-form__body o-form__body--padding">
	<div class="l-row" role="row">
		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" role="separator">
			<label class="o-form__text" for=""><fmt:message key="label.nome"/></label>
			<input autofocus class="o-form__data has-validation" maxlength="60" name="obj.nome" pattern="letraNumeroEspaco" required type="text" value="${obj.nome}">
			<validate:validationMessage name="obj.nome"/>
		</div>
	</div>
	<div class="l-row" role="row">
		<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6" role="separator">
			<label class="o-form__text" for=""><fmt:message key="label.usuario"/></label>
			<input class="o-form__data has-validation" maxlength="30" name="obj.usuario" pattern="letraNumero" required type="text" value="${obj.usuario}">
			<validate:validationMessage name="obj.usuario"/>
		</div>
		<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6" role="separator">
			<label class="o-form__text" for=""><fmt:message key="label.senha"/></label>
			<input class="o-form__data has-validation" maxlength="8" name="obj.senha" pattern="letraNumeroMin8Max8" required type="password" value="${obj.senha}">
			<validate:validationMessage name="obj.senha"/>
		</div>
	</div>
	<div class="l-row" role="row">
		<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6" role="separator">
			<label class="o-form__text" for=""><fmt:message key="label.grupo"/></label>
			<select class="o-form__data has-validation" data-class="slAdmGrupo" id="slAdministrador_Usuario_Grupo_Json_01" name="obj.idgrupo.id"></select>
			<validate:validationMessage name="obj.idgrupo.id"/>
		</div>
		<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6" role="separator">
				<label class="o-form__text" for=""><fmt:message key="label.tipo.acesso"/></label>
				<select class="o-form__data has-validation" data-class="slAdmTipoAcesso" id="slAdministrador_Usuario_Tipo-de-acesso_Json_01" name="obj.idtipoacesso.id"></select>
				<validate:validationMessage name="obj.idtipoacesso.id"/>
			</div>
	</div>
	<div class="l-row" role="row">
		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" role="separator">
			<label class="o-form__text" for=""><fmt:message key="label.inativo"/></label>
			<input <c:if test="${obj.inativo == true}">checked</c:if> class="form-data" name="obj.inativo" type="checkbox" value="true">
		</div>
	</div>
</section>