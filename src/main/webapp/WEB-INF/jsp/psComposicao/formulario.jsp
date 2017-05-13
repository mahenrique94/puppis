<%@include file="/config/taglibraries.jsp" %>
<%@include file="/config/libraries-style.jsp"%>
<form action="<c:url value="/produto-servico/composicao"/>" class="o-form"id="formpscomposicao" method="post" name="formpscomposicao" onsubmit="requestModal(this, event);" role="form">
	<input aria-hidden="true" name="obj.id" type="hidden" value="${obj.id}">
	<input aria-hidden="true" name="obj.idprodutoservico.id" type="hidden" value="${obj.idprodutoservico.id}">
	<input aria-hidden="true" name="obj.idcomposicao.idaux" type="hidden" value="${obj.idcomposicao.id}">
	<header class="o-modal__header">
		<label class="o-modal__title" id="o-modal__title--1"><i class="icon-object-group"></i>&nbsp;<fmt:message key="titulo.psprodutoservico.composicao"/></label>
	</header>
	<section class="o-form__body o-form__body--padding o-modal__body">
		<div class="l-row" role="row">
			<div class="u-grid--10" role="grid">
				<label class="o-form__text" for="produtoservico"><fmt:message key="label.produto.servico"/><validate:validationMessage name="obj.idcomposicao.id"/></label>
				<select aria-required="true" class="o-form__data has-validation" data-select="sl" data-url="slProduto-Servico_Json" id="produtoservico" name="obj.idcomposicao.id" required></select>
			</div>
			<div class="u-grid--2" role="grid">
				<label class="o-form__text" for="quantidade"><fmt:message key="label.quantidade"/><validate:validationMessage name="obj.quantidade"/></label>
				<input aria-required="true" class="o-form__data has-validation" id="quantidade" min="0" name="obj.quantidade" pattern="numeric10-2" required type="text" value="<fmt:formatNumber pattern="0.00" type="currency" value="${obj.quantidade}"/>">
			</div>
		</div>
	</section>
	<footer class="o-modal__footer is-alignRight">
		<button class="o-button--ren o-button--large" role="button" title="<fmt:message key="button.salvar"/>" type="submit"><i class="icon-floppy"></i>&nbsp;<fmt:message key="button.salvar"/></button> 
	</footer>
</form>
<%@include file="/config/libraries-js.jsp"%>