<%@include file="/config/taglibraries.jsp"%>
<fieldset class="c-block--lube">
	<legend class="c-block__header"><label class="c-block__title"><i class="icon-dollar"></i>&nbsp;<fmt:message key="titulo.pagamento"/></label></legend>
	<section class="c-block__body c-block__body--padding">
		<div class="l-row" role="row">
			<div class="u-grid--12" role="grid">
				<label class="o-form__text" for="conta"><fmt:message key="label.conta"/><validate:validationMessage name="obj.pagamento.idcontabancaria.id"/></label>
				<select aria-required="true" class="o-form__data has-validation" data-select="slFinContaBancaria" data-url="slFinanceiro_Conta-Bancaria_Json" id="conta" name="obj.pagamento.idcontabancaria.id" required></select>
			</div>
		</div>
	</section>
</fieldset>