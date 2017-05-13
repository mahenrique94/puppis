<%@include file="/config/taglibraries.jsp" %>
<%@include file="/config/libraries-style.jsp"%>
<c:set var="autoFocus" value="${obj.id != null ? '' : 'autofocus'}"/>
<form action="<c:url value="/tabela-de-preco/valor/outros"/>" class="o-form"id="formtblprecovaloroutros" method="post" name="formtblprecovaloroutros" onsubmit="requestModal(this, event);" role="form">
	<input aria-hidden="true" name="obj.id" type="hidden" value="${obj.id}">
	<input aria-hidden="true" name="obj.idtabelaprecopessoa.id" type="hidden" value="${obj.idtabelaprecopessoa.id}">
	<header class="o-modal__header">
		<label class="o-modal__title" id="o-modal__title--1"><i class="icon-dollar"></i>&nbsp;<fmt:message key="titulo.tblpreco.pessoa.outros"/></label>
	</header>
	<section class="o-form__body o-form__body--padding o-modal__body">
		<div class="l-row" role="row">
			<div class="u-grid--6" role="grid">
				<label class="o-form__text" for="descricao"><fmt:message key="label.descricao"/><validate:validationMessage name="obj.descricao"/></label>
				<input aria-required="true" ${autoFocus} class="o-form__data has-validation" id="descricao" maxlength="30" name="obj.descricao" pattern="espacoLetraNumero" required type="text" value="${obj.descricao}">
			</div>
			<div class="u-grid--6" role="grid">
				<label class="o-form__text" for="valor"><fmt:message key="label.valor"/><validate:validationMessage name="obj.valor"/></label>
				<input aria-required="true" class="o-form__data has-validation" id="valor" maxlength="13" name="obj.valor" pattern="numeric10-2" required type="text" value="<fmt:formatNumber pattern="0.00" type="currency" value="${obj.valor}"/>"/>
			</div>
		</div>
	</section>
	<footer class="o-modal__footer is-alignRight">
		<button class="o-button--ren o-button--large" role="button" title="<fmt:message key="button.salvar"/>" type="submit"><i class="icon-floppy"></i>&nbsp;<fmt:message key="button.salvar"/></button> 
	</footer>
</form>
<%@include file="/config/libraries-js.jsp"%>