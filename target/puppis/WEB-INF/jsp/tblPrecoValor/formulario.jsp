<%@include file="/config/taglibraries.jsp" %>
<%@include file="/config/libraries-style.jsp"%>
<c:set var="autoFocus" value="${obj.id != null ? '' : 'autofocus'}"/>
<form action="<c:url value="/tabela-de-preco/valor"/>" class="o-form"id="formtblprecovalor" method="post" name="formtblprecovalor" onsubmit="requestModal(this, event);" role="form">
	<input aria-hidden="true" name="obj.id" type="hidden" value="${obj.id}">
	<input aria-hidden="true" name="obj.idtabelaprecopessoa.id" type="hidden" value="${obj.idtabelaprecopessoa.id}">
	<header class="o-modal__header">
		<label class="o-modal__title" id="o-modal__title--1"><i class="icon-money"></i>&nbsp;<fmt:message key="titulo.tblpreco.pessoa.valor"/></label>
	</header>
	<section class="o-form__body o-form__body--padding o-modal__body">
		<div class="l-row" role="row">
			<div class="u-grid--6" role="grid">
				<label class="o-form__text" for="datavigenciainicial"><fmt:message key="label.data.vigencia.inicial"/><validate:validationMessage name="obj.datavigenciainicial"/></label>
				<input aria-required="true" ${autoFocus} class="o-form__data has-validation" id="datavigenciainicial" max="31-12-2900" maxlength="16" min="01-01-1900" name="obj.datavigenciainicial" onkeypress="checkMask(event);" onkeyup="mask(maskDataHora, this, event);" pattern="dataHora" required type="text" value="<fmt:formatDate pattern="dd/MM/yyyy HH:mm" type="date" value="${obj.datavigenciainicial.time}"/>">
			</div>
			<div class="u-grid--6" role="grid">
				<label class="o-form__text" for="datavigenciafinal"><fmt:message key="label.data.vigencia.final"/><validate:validationMessage name="obj.datavigenciafinal"/></label>
				<input aria-required="true" class="o-form__data has-validation" id="datavigenciafinal" max="31-12-2900" maxlength="16" min="01-01-1900" name="obj.datavigenciafinal" onkeypress="checkMask(event);" onkeyup="mask(maskDataHora, this, event);" pattern="dataHora" required type="text" value="<fmt:formatDate pattern="dd/MM/yyyy HH:mm" type="date" value="${obj.datavigenciafinal.time}"/>">
			</div>
		</div>
		<div class="l-row" role="row">
			<div class="u-grid--12" role="grid">
				<label class="o-form__text" for="valor"><fmt:message key="label.valor"/><validate:validationMessage name="obj.valor"/></label>
				<input aria-required="true" class="o-form__data has-validation" id="valor" maxlength="13" name="obj.valor" pattern="numeric10-2" required type="text" value="<fmt:formatNumber pattern="0.00" type="currency" value="${obj.valor}"/>"/>
			</div>
		</div>
		<div class="l-row" role="row">
			<div class="u-grid--6" role="grid">
				<label class="o-form__text" for="valorpromocao"><fmt:message key="label.valor.promocao"/><validate:validationMessage name="obj.valorpromocao"/></label>
				<input class="o-form__data has-validation" id="valorpromocao" maxlength="13" name="obj.valorpromocao" pattern="numeric10-2" type="text" value="<fmt:formatNumber pattern="0.00" type="currency" value="${obj.valorpromocao}"/>"/>
			</div>
			<div class="u-grid--6" role="grid">
				<label class="o-form__text" for="valordesconto"><fmt:message key="label.valor.desconto"/><validate:validationMessage name="obj.valordesconto"/></label>
				<input class="o-form__data has-validation" id="valordesconto" maxlength="13" name="obj.valordesconto" pattern="numeric10-2" type="text" value="<fmt:formatNumber pattern="0.00" type="currency" value="${obj.valordesconto}"/>"/>
			</div>
		</div>
		<div class="l-row" role="row">
			<div class="u-grid--6" role="grid">
				<label class="o-form__text" for="valorparcelamento"><fmt:message key="label.valor.parcelamento"/><validate:validationMessage name="obj.valorparcelamento"/></label>
				<input class="o-form__data has-validation" id="valorparcelamento" maxlength="13" name="obj.valorparcelamento" pattern="numeric10-2" type="text" value="<fmt:formatNumber pattern="0.00" type="currency" value="${obj.valorparcelamento}"/>"/>
			</div>
			<div class="u-grid--6" role="grid">
				<label class="o-form__text" for="valorfaturado"><fmt:message key="label.valor.faturado"/><validate:validationMessage name="obj.valorfaturado"/></label>
				<input class="o-form__data has-validation" id="valorfaturado" maxlength="13" name="obj.valorfaturado" pattern="numeric10-2" type="text" value="<fmt:formatNumber pattern="0.00" type="currency" value="${obj.valorfaturado}"/>"/>
			</div>
		</div>
		<div class="l-row" role="row">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" role="grid">
				<label class="o-form__text" for=""><fmt:message key="label.inativo"/><validate:validationMessage name="obj.inativo"/></label>
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