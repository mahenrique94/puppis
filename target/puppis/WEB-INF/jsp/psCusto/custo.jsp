<%@include file="/config/taglibraries.jsp"%>
<section class="o-form__body o-form__body--padding">
	<div class="l-row" role="row">
		<div class="u-grid--6" role="grid">
			<label class="o-form__text" for="valormin"><fmt:message key="label.valor.min"/><validate:validationMessage name="obj.custo.valormin"/></label>
			<input class="o-form__data has-validation" id="valormin" maxlength="13" name="obj.custo.valormin" pattern="numeric10-2" type="text" value="<fmt:formatNumber pattern="0.00" type="currency" value="${obj.custo.valormin}"/>">
		</div>
		<div class="u-grid--6" role="grid">
			<label class="o-form__text" for="valormax"><fmt:message key="label.valor.max"/><validate:validationMessage name="obj.custo.valormax"/></label>
			<input class="o-form__data has-validation" id="valormax" maxlength="13" name="obj.custo.valormax" pattern="numeric10-2" type="text" value="<fmt:formatNumber pattern="0.00" type="currency" value="${obj.custo.valormax}"/>"/>
		</div>
	</div>
	<div class="l-row" role="row">
		<div class="u-grid--12" role="grid">
			<label class="o-form__text" for="valorpago"><fmt:message key="label.valor.pago"/><validate:validationMessage name="obj.custo.valor"/></label>
			<input aria-readonly="true" aria-required="true" class="o-form__data has-validation" id="valorpago" maxlength="13" name="obj.custo.valor" pattern="numeric10-2" readonly required step="0.01" type="text" value="<fmt:formatNumber pattern="0.00" type="currency" value="${obj.custo.valor}"/>"/>
		</div>
	</div>
</section>