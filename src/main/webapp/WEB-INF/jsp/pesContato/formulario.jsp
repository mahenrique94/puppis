<%@include file="/config/taglibraries.jsp" %>
<%@include file="/config/libraries-style.jsp"%>
<c:set var="autoFocus" value="${obj.id != null ? '' : 'autofocus'}"/>
<form action="<c:url value="/pessoa/contato"/>" class="o-form"id="formpescontato" method="post" name="formpescontato" onsubmit="requestModal(this, event);" role="form">
	<input aria-hidden="true" name="obj.id" type="hidden" value="${obj.id}">
	<input aria-hidden="true" name="obj.idpessoa.id" type="hidden" value="${obj.idpessoa.id}">
	<header class="o-modal__header">
		<label class="o-modal__title" id="o-modal__title--1"><fmt:message key="titulo.pespessoa.contato"/></label>
	</header>
	<section class="o-form__body o-form__body--padding o-modal__body">
		<div class="l-row" role="row">
			<div class="u-grid--12" role="grid">
				<label class="o-form__text" for="nome"><fmt:message key="label.nome"/><validate:validationMessage name="obj.nome"/></label>
				<input aria-required="true" ${autoFocus} class="o-form__data has-validation" id="nome" maxlength="60" name="obj.nome" pattern="espacoLetraNumero" required type="text" value="${obj.nome}">
			</div>
		</div>
		<div class="l-row" role="row">
			<div class="u-grid--2" role="grid">
				<label class="o-form__text" for="ddd"><fmt:message key="label.ddd"/><validate:validationMessage name="obj.ddd"/></label>
				<input class="o-form__data has-validation" id="ddd" max="100" min="0" name="obj.ddd" pattern="ddd" step="1" type="number" value="${obj.ddd}">
			</div>
			<div class="u-grid--5" role="grid">
				<label class="o-form__text" for="telefone"><fmt:message key="label.telefone"/><validate:validationMessage name="obj.telefone"/></label>
				<input class="o-form__data has-validation" id="telefone" maxlength="9" name="obj.telefone" onkeypress="checkMask(event);" onkeyup="mask(maskTelefone, this, event);" pattern="telefone" type="text" value="${obj.telefone}">
			</div>
			<div class="u-grid--5" role="grid">
				<label class="o-form__text" for="celular"><fmt:message key="label.celular"/><validate:validationMessage name="obj.celular"/></label>
				<input class="o-form__data has-validation" id="celular" maxlength="11" name="obj.celular" onkeypress="checkMask(event);" onkeyup="mask(maskCelular, this, event);" pattern="celular" type="text" value="${obj.celular}">
			</div>
		</div>
		<div class="l-row" role="row">	
			<div class="u-grid--12" role="grid">
				<label class="o-form__text" for="email"><fmt:message key="label.email"/><validate:validationMessage name="obj.email"/></label>
				<input class="o-form__data has-validation" id="email" maxlength="255" name="obj.email" pattern="email" type="email" value="${obj.email}">
			</div>
		</div>
	</section>
	<footer class="o-modal__footer is-alignRight">
		<button class="o-button--ren o-button--large" role="button" title="<fmt:message key="button.salvar"/>" type="submit"><i class="icon-floppy"></i>&nbsp;<fmt:message key="button.salvar"/></button> 
	</footer>
</form>
<%@include file="/config/libraries-js.jsp"%>