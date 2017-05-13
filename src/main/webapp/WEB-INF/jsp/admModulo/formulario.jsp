<%@include file="/config/taglibraries.jsp" %>
<%@include file="/config/libraries-style.jsp"%>
<form action="<c:url value="/administrador/comercio/modulo"/>" class="o-form"id="formadmmodulo" method="post" name="formadmmodulo" onsubmit="requestModal(this, event);" role="form">
	<input aria-hidden="true" name="obj.id" type="hidden" value="${obj.id}">
	<input aria-hidden="true" name="obj.idmodulo.idaux" type="hidden" value="${obj.idmodulo.id}">
	<input aria-hidden="true" name="obj.idcomercio.id" type="hidden" value="${obj.idcomercio.id}">
	<header class="o-modal__header">
		<label class="o-modal__title" id="o-modal__title--1"><fmt:message key="titulo.admusuario.comercio"/></label>
	</header>
	<section class="o-form__body o-form__body--padding o-modal__body">
		<div class="l-row" role="row">
			<div class="u-grid--12" role="grid">
				<label class="o-form__text" for="modulo"><fmt:message key="label.modulo"/><validate:validationMessage name="obj.idmodulo.id"/></label>
				<select aria-required="true" class="o-form__data has-validation" data-select="sl" data-url="slSystem_Modulo_Json" id="modulo" name="obj.idmodulo.id" required></select>
			</div>
		</div>
	</section>
	<footer class="o-modal__footer is-alignRight">
		<button class="o-button--ren o-button--large" role="button" title="<fmt:message key="button.salvar"/>" type="submit"><i class="icon-floppy"></i>&nbsp;<fmt:message key="button.salvar"/></button> 
	</footer>
</form>
<%@include file="/config/libraries-js.jsp"%>