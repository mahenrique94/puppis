<%@include file="/config/taglibraries.jsp" %>
<%@include file="/config/libraries-style.jsp"%>
<form action="<c:url value="/financeiro/extrato"/>" class="o-form"id="formfinextrato" method="post" name="formfinextrato" onsubmit="requestModal(this, event);" role="form">
	<input aria-hidden="true" name="obj.id" type="hidden" value="${obj.id}">
	<input aria-hidden="true" name="obj.idcontabancaria.idaux" type="hidden" value="${obj.idcontabancaria.id}">
	<header class="o-modal__header">
		<label class="o-modal__title" id="o-modal__title--1"><i class="icon-list-bullet"></i>&nbsp;<fmt:message key="titulo.finextrato"/></label>
	</header>
	<section class="o-form__body o-form__body--padding o-modal__body">
		<div class="l-row" role="row">
			<div class="u-grid--12" role="separator">
				<label class="o-form__text" for="conta"><fmt:message key="label.conta"/><validate:validationMessage name="obj.idcontabancaria.id"/></label>
				<select aria-readonly="true" aria-required="true" class="o-form__data has-validation" data-select="slFinContaBancaria" data-url="slFinanceiro_Conta-bancaria_Json" id="conta" name="obj.idcontabancaria.id" readonly required></select>
			</div>
		</div>
		<div class="l-row" role="row">
			<div class="u-grid--6" role="separator">
				<label class="o-form__text" for="operacao"><fmt:message key="label.operacao"/><validate:validationMessage name="obj.idtipooperacao.id"/></label>
				<select aria-readonly="true" class="o-form__data has-validation" data-parameters-fields="[idmodulo.id, gruporesumo]" data-parameters-values="[2, EXTRATO]" data-select="slSysTipoOperacao" data-url="slSystem_Tipo-de-operacao_Json" id="operacao" name="obj.idtipooperacao.id" readonly></select>
			</div>
			<div class="u-grid--6" role="separator">
				<label class="o-form__text" for="tipo"><fmt:message key="label.tipo"/><validate:validationMessage name="obj.creditodebito"/></label>
				<select aria-required="true" class="o-form__data has-validation" id="tipo" name="obj.creditodebito" required>
					<option value=""></option>
					<option value="C">CREDITO</option>
					<option value="D">DEBITO</option>
				</select>
			</div>
		</div>
		<div class="l-row" role="row">
			<div class="u-grid--12" role="separator">
				<label class="o-form__text" for="valor"><fmt:message key="label.valor"/><validate:validationMessage name="obj.valor"/></label>
				<input aria-required="true" class="o-form__data has-validation" id="valor" maxlength="13" name="obj.valor" pattern="numeric10-2" required type="text" value="<fmt:formatNumber pattern="0.00" type="currency" value="${obj.valor}"/>"/>
			</div>
		</div>
		<div class="l-row" role="row">
			<div class="u-grid--12" role="separator">
				<label class="o-form__text" for="historico"><fmt:message key="label.historico"/><validate:validationMessage name="obj.historico"/></label>
				<textarea class="o-form__data has-validation" id="historico" name="obj.historico" pattern="textarea">${obj.historico}</textarea>
			</div>
		</div>
	</section>
	<footer class="o-modal__footer is-alignRight">
		<button class="o-button--ren o-button--large" role="button" title="<fmt:message key="button.salvar"/>" type="submit"><i class="icon-floppy"></i>&nbsp;<fmt:message key="button.salvar"/></button> 
	</footer>
</form>
<%@include file="/config/libraries-js.jsp"%>