<%@include file="/config/taglibraries.jsp"%>
<section class="o-form__body o-form__body--padding">
	<input aria-hidden="true" name="obj.custo.id" type="hidden" value="${obj.custo.id}">
	<input aria-hidden="true" name="obj.custo.idnota.id" type="hidden" value="${obj.id}">
	<input aria-hidden="true" name="obj.custo.valoricms" type="hidden" value="${obj.custo.valoricms}">
	<input aria-hidden="true" name="obj.custo.valoripi" type="hidden" value="${obj.custo.valoripi}">
	<div class="l-row" role="row">
		<div class="u-grid--12" role="grid">
			<label class="o-form__text" for="porcdesconto"><fmt:message key="label.porc.desconto"/><validate:validationMessage name="obj.custo.valordesconto"/></label>
			<input aria-readonly="true" class="o-form__data has-validation" id="porcdesconto" maxlength="13" name="obj.custo.valordesconto" pattern="numeric10-2" readonly type="text" value="${obj.custo.valordesconto}">
		</div>
	</div>
	<div class="l-row" role="row">
		<div class="u-grid--12" role="grid">
			<label class="o-form__text" for="valortotal"><fmt:message key="label.valor.total"/><validate:validationMessage name="obj.custo.valortotal"/></label>
			<input aria-readonly="true" class="o-form__data has-validation" id="valortotal" maxlength="13" name="obj.custo.valortotal" pattern="numeric10-2" readonly type="text" value="<fmt:formatNumber pattern="0.00" type="currency" value="${obj.custo.valortotal}"/>">
		</div>
	</div>
</section>