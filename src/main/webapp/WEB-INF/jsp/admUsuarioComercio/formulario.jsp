<%@include file="/config/taglibraries.jsp" %>
<%@include file="/config/libraries-style.jsp"%>
<form action="<c:url value="/administrador/usuario/comercio"/>" class="o-form"id="formadmusuariocomercio" method="post" name="formadmusuariocomercio" onsubmit="requestModal(this, event);" role="form">
	<input aria-hidden="true" name="obj.id" type="hidden" value="${obj.id}">
	<input aria-hidden="true" name="obj.idcomercio.idaux" type="hidden" value="${obj.idcomercio.id}">
	<input aria-hidden="true" name="obj.idusuario.id" type="hidden" value="${obj.idusuario.id}">
	<header class="o-modal__header">
		<label class="o-modal__title" id="o-modal__title--1"><fmt:message key="titulo.admusuario.comercio"/></label>
	</header>
	<section class="o-form__body o-form__body--padding o-modal__body">
		<div class="l-row" role="row">
			<div class="u-grid--12" role="grid">
				<label class="o-form__text" for="comercio"><fmt:message key="label.comercio"/><validate:validationMessage name="obj.idcomercio.id"/></label>
				<select aria-required="true" class="o-form__data has-validation" data-select="slAdmComercio" data-url="slAdministrador_Comercio_Json" id="comercio" name="obj.idcomercio.id" required></select>
			</div>
		</div>
	</section>
	<footer class="o-modal__footer is-alignRight">
		<button class="o-button--ren o-button--large" role="button" title="<fmt:message key="button.salvar"/>" type="submit"><i class="icon-floppy"></i>&nbsp;<fmt:message key="button.salvar"/></button> 
	</footer>
</form>
<%@include file="/config/libraries-js.jsp"%>