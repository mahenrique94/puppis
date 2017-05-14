<%@include file="/config/taglibraries.jsp" %>
<%@include file="/config/libraries-style.jsp"%>
<c:set var="autoFocus" value="${obj.id != null ? '' : 'autofocus'}"/>
<c:set var="readOnly" value="${obj.idnota.dataatualizacao != null ? 'readonly' : ''}"/>
<c:set var="disabled" value="${obj.idnota.dataatualizacao != null ? 'disabled' : ''}"/>
<form action="<c:url value="/comercio/nota-item"/>" class="o-form"id="formcomnotaitem" method="post" name="formcomnotaitem" onsubmit="requestModal(this, event);" role="form">
	<input aria-hidden="true" name="obj.id" type="hidden" value="${obj.id}">
	<input aria-hidden="true" name="obj.idnota.id" type="hidden" value="${obj.idnota.id}">
	<input aria-hidden="true" name="obj.idprodutoservico.idaux" type="hidden" value="${obj.idprodutoservico.id}">
	<header class="o-modal__header">
		<label class="o-modal__title" id="o-modal__title--1"><i class="icon-box"></i>&nbsp;<fmt:message key="titulo.comnota.item"/></label>
	</header>
	<section class="o-form__body o-form__body--padding o-modal__body">
		<div class="l-row" role="row">
			<div class="u-grid--12" role="separator">
				<label class="o-form__text" for="item"><fmt:message key="label.item"/><validate:validationMessage name="obj.idprodutoservico.id"/></label>
				<select aria-required="true" ${autoFocus} class="o-form__data has-validation" data-select="sl" data-url="slProduto-Servico_Json" id="item" name="obj.idprodutoservico.id" ${readOnly} required></select>
			</div>
		</div>
		<div class="l-row" role="row">
			<div class="u-grid--6" role="separator">
				<label class="o-form__text" for="quantidade"><fmt:message key="label.quantidade"/><validate:validationMessage name="obj.quantidade"/></label>
				<input aria-required="true" class="o-form__data has-validation" id="quantidade" maxlength="13" name="obj.quantidade" pattern="numeric10-2" ${readOnly} required type="text" value="<fmt:formatNumber pattern="0.00" type="currency" value="${obj.quantidade}"/>">
			</div>
			<div class="u-grid--6" role="separator">
				<label class="o-form__text" for="valorunitario"><fmt:message key="label.valor.unitario"/><validate:validationMessage name="obj.valorunitario"/></label>
				<input aria-readonly="true" aria-required="true" class="o-form__data has-validation" id="valorunitario" maxlength="13" name="obj.valorunitario" pattern="numeric10-2" readonly required type="text" value="<fmt:formatNumber pattern="0.00" type="currency" value="${obj.valorunitario}"/>">
			</div>
		</div>
		<div class="l-row" role="row">
			<div class="u-grid--12" role="grid">
				<label class="o-form__text" for="porcdesconto"><fmt:message key="label.porc.desconto"/><validate:validationMessage name="obj.porcdesconto"/></label>
				<input class="o-form__data has-validation" id="porcdesconto" maxlength="13" name="obj.porcdesconto" pattern="numeric10-2" ${readOnly} type="text" value="<fmt:formatNumber pattern="0.00" type="currency" value="${obj.porcdesconto}"/>">
			</div>
		</div>
		<div class="l-row" role="row">
			<div class="u-grid--12" role="separator">
				<label class="o-form__text" for="valortotal"><fmt:message key="label.valor.total"/><validate:validationMessage name="obj.valortotal"/></label>
				<input aria-readonly="true" class="o-form__data has-validation" id="valortotal" maxlength="13" name="obj.valortotal" pattern="numeric10-2" readonly type="text" value="<fmt:formatNumber pattern="0.00" type="currency" value="${obj.valortotal}"/>">
			</div>
		</div>
	</section>
	<footer class="o-modal__footer is-alignRight">
		<button class="o-button--ren o-button--large" role="button" title="<fmt:message key="button.salvar"/>" type="submit"><i class="icon-floppy"></i>&nbsp;<fmt:message key="button.salvar"/></button> 
	</footer>
</form>
<%@include file="/config/libraries-js.jsp"%>