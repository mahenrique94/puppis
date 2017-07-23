<%@include file="/config/taglibraries.jsp"%>
<section class="o-form__body o-form__body--padding">
	<input aria-hidden="true" name="obj.custo.id" type="hidden" value="${obj.custo.id}">
	<input aria-hidden="true" name="obj.custo.idnota.id" type="hidden" value="${obj.id}">
	<div class="l-row" role="row">
		<div class="u-grid--3" role="grid">
			<label class="o-form__text" for="valoricms"><fmt:message key="label.valor.icms"/><validate:validationMessage name="obj.custo.valoricms"/></label>
			<input aria-readonly="true" class="o-form__data has-validation" id="valoricms" maxlength="13" name="obj.custo.valoricms" pattern="numeric10-2" readonly type="text" value="<fmt:formatNumber pattern="0.00" type="currency" value="${obj.custo.valoricms}"/>">
		</div>
		<div class="u-grid--3" role="grid">
			<label class="o-form__text" for="valoripi"><fmt:message key="label.valor.ipi"/><validate:validationMessage name="obj.custo.valoripi"/></label>
			<input aria-readonly="true" class="o-form__data has-validation" id="valoripi" maxlength="13" name="obj.custo.valoripi" pattern="numeric10-2" readonly type="text" value="<fmt:formatNumber pattern="0.00" type="currency" value="${obj.custo.valoripi}"/>">
		</div>
		<div class="u-grid--3" role="grid">
			<label class="o-form__text" for="valordesconto"><fmt:message key="label.valor.desconto"/><validate:validationMessage name="obj.custo.valordesconto"/></label>
			<input aria-readonly="true" class="o-form__data has-validation" id="valordesconto" maxlength="13" name="obj.custo.valordesconto" pattern="numeric10-2" readonly type="text" value="<fmt:formatNumber pattern="0.00" type="currency" value="${obj.custo.valordesconto}"/>">
		</div>
		<div class="u-grid--3" role="grid">
			<label class="o-form__text" for="valorjuros"><fmt:message key="label.valor.juros"/><validate:validationMessage name="obj.custo.valorjuros"/></label>
			<input aria-readonly="true" class="o-form__data has-validation" id="valorjuros" maxlength="13" name="obj.custo.valorjuros" pattern="numeric10-2" readonly type="text" value="<fmt:formatNumber pattern="0.00" type="currency" value="${obj.custo.valorjuros}"/>">
		</div>
	</div>
	<div class="l-row" role="row">
		<div class="u-grid--12" role="grid">
			<label class="o-form__text" for="valortotal"><fmt:message key="label.valor.total"/><validate:validationMessage name="obj.custo.valortotal"/></label>
			<input aria-readonly="true" class="o-form__data has-validation" id="valortotal" maxlength="13" name="obj.custo.valortotal" pattern="numeric10-2" readonly type="text" value="<fmt:formatNumber pattern="0.00" type="currency" value="${obj.custo.valortotal}"/>">
		</div>
	</div>
</section>