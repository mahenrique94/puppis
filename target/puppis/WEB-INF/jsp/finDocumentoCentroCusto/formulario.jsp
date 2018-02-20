<%@include file="/config/taglibraries.jsp" %>
<%@include file="/config/libraries-style.jsp"%>
<c:set var="autoFocus" value="${obj.id != null ? '' : 'autofocus'}"/>
<form action="<c:url value="/financeiro/documento/centro-de-custo"/>" class="o-form"id="formfindocumento" method="post" name="formfindocumento" onsubmit="requestModal(this, event);" role="form">
	<input aria-hidden="true" name="obj.id" type="hidden" value="${obj.id}">
	<input aria-hidden="true" name="obj.iddocumento.id" type="hidden" value="${obj.iddocumento.id}">
	<input aria-hidden="true" name="obj.idcentrocusto.idaux" type="hidden" value="${obj.idcentrocusto.id}">
	<header class="o-modal__header">
		<label class="o-modal__title" id="o-modal__title--1"><i class="icon-dollar"></i>&nbsp;<fmt:message key="titulo.findocumento.centro.custo"/></label>
	</header>
	<section class="o-form__body o-form__body--padding o-modal__body">
		<div class="l-row" role="row">
			<div class="u-grid--12" role="grid">
				<label class="o-form__text" for="centrocusto"><fmt:message key="label.centro.custo"/><validate:validationMessage name="obj.idcentrocusto.id"/></label>
				<select aria-required="true" ${autoFocus} class="o-form__data has-validation" data-select="sl" data-url="slCadastro_Centro-de-custo_Json" id="centrocusto" name="obj.idcentrocusto.id" required></select>
			</div>
		</div>
	</section>
	<footer class="o-modal__footer is-alignRight">
		<button class="o-button--ren o-button--large" role="button" title="<fmt:message key="button.salvar"/>" type="submit"><i class="icon-floppy"></i>&nbsp;<fmt:message key="button.salvar"/></button> 
	</footer>
</form>
<%@include file="/config/libraries-js.jsp"%>