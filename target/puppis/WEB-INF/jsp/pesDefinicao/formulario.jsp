<%@include file="/config/taglibraries.jsp" %>
<%@include file="/config/libraries-style.jsp"%>
<c:set var="autoFocus" value="${obj.id != null ? '' : 'autofocus'}"/>
<form action="<c:url value="/pessoa/definicao"/>" class="o-form"id="formpesdefinicao" method="post" name="formpesdefinicao" onsubmit="requestModal(this, event);" role="form">
	<input aria-hidden="true" name="obj.id" type="hidden" value="${obj.id}">
	<input aria-hidden="true" name="obj.idpessoa.id" type="hidden" value="${obj.idpessoa.id}">
	<input aria-hidden="true" name="obj.idtipo.idaux" type="hidden" value="${obj.idtipo.id}">
	<header class="o-modal__header">
		<label class="o-modal__title" id="o-modal__title--1"><i class="icon-lightbulb"></i>&nbsp;<fmt:message key="titulo.pespessoa.definicao"/></label>
	</header>
	<section class="o-form__body o-form__body--padding o-modal__body">
		<div class="l-row" role="row">
			<div class="u-grid--12" role="grid">
				<label class="o-form__text" for="tipo"><fmt:message key="label.tipo"/><validate:validationMessage name="obj.idtipo.id"/></label>
				<select aria-required="true" ${autoFocus} class="o-form__data has-validation" data-select="sl" data-url="slPessoa_Tipo_Json" id="tipo" name="obj.idtipo.id" required></select>
			</div>
		</div>
		<div class="l-row" role="row">
			<div class="u-grid--12" role="grid">
				<label class="o-form__text" for="inativo"><fmt:message key="label.inativo"/><validate:validationMessage name="obj.inativo"/></label>
				<input <c:if test="${obj.inativo == true}">checked</c:if> class="o-mark__data--checkbox" id="inativo" name="obj.inativo" type="hidden" value="${obj.inativo}">
				<label class="o-mark__text"><span class="o-mark__element" data-marked="true" data-unmarked="false" onclick="MarkController.mark(this);"></span></label>
			</div>
		</div>
	</section>
	<footer class="o-modal__footer is-alignRight">
		<button class="o-button--ren o-button--large" role="button" title="<fmt:message key="button.salvar"/>" type="submit"><i class="icon-floppy"></i>&nbsp;<fmt:message key="button.salvar"/></button> 
	</footer>
</form>
<%@include file="/config/libraries-js.jsp"%>