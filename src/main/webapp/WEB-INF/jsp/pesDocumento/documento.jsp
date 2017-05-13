<%@include file="/config/taglibraries.jsp"%>
<fieldset class="c-block--lube" style="margin-bottom: 1rem;">
	<legend class="c-block__header"><label class="c-block__title"><i class="icon-id-card"></i>&nbsp;<fmt:message key="titulo.documento"/></label></legend>
	<section class="c-block__body c-block__body--padding">
		<div class="l-row" role="row">
			<div class="u-grid--6" role="grid">
				<label class="o-form__text" for="cnh"><fmt:message key="label.cnh"/><validate:validationMessage name="obj.documento.cnh"/></label>
				<input class="o-form__data has-validation" id="cnh" maxlength="20" name="obj.documento.cnh" type="text" value="${obj.documento.cnh}">
			</div>
			<div class="u-grid--2" role="grid">
				<label class="o-form__text" for="tipo"><fmt:message key="label.tipo"/><validate:validationMessage name="obj.documento.tipocnh"/></label>
				<input class="o-form__data has-validation" maxlength="2" name="obj.documento.tipocnh" pattern="tipoCnh" type="text" value="${obj.documento.tipocnh}">
			</div>
			<div class="u-grid--2" role="grid">
				<label class="o-form__text" for="dataexpedicao"><fmt:message key="label.data.expedicao"/><validate:validationMessage name="obj.documento.dataexpedicaocnh"/></label>
				<input class="o-form__data has-validation" id="dataexpedicao" maxlength="10" max="31-12-2900" min="01-01-1900" name="obj.documento.dataexpedicaocnh" onkeypress="checkMask(event);" onkeyup="mask(maskData, this, event);" pattern="data" type="text" value="<fmt:formatDate pattern="dd/MM/yyyy" type="date" value="${obj.documento.dataexpedicaocnh.time}"/>">
			</div>
			<div class="u-grid--2" role="grid">
				<label class="o-form__text" for="datavencimento"><fmt:message key="label.data.vencimento"/><validate:validationMessage name="obj.documento.datavencimentocnh"/></label>
				<input class="o-form__data has-validation" id="datavencimento" maxlength="10" max="31-12-2900" min="01-01-1970" name="obj.documento.datavencimentocnh" onkeypress="checkMask(event);" onkeyup="mask(maskData, this, event);" pattern="data" type="text" value="<fmt:formatDate pattern="dd/MM/yyyy" type="date" value="${obj.documento.datavencimentocnh.time}"/>">
			</div>
		</div>
		<div class="l-row" role="row">
			<div class="u-grid--4" role="grid">
				<label class="o-form__text" for="ctps"><fmt:message key="label.ctps"/><validate:validationMessage name="obj.documento.ctps"/></label>
				<input class="o-form__data has-validation" id="ctps" min="0" name="obj.documento.ctps" pattern="number0to9" step="1" type="number" value="${obj.documento.ctps}">
			</div>
			<div class="u-grid--4" role="grid">
				<label class="o-form__text" for="serie"><fmt:message key="label.serie"/><validate:validationMessage name="obj.documento.seriectps"/></label>
				<input class="o-form__data has-validation" id="serie" min="0" name="obj.documento.seriectps" pattern="number0to9" step="1" type="number" value="${obj.documento.seriectps}">
			</div>
			<div class="u-grid--4" role="grid">
				<label class="o-form__text" for="pis"><fmt:message key="label.pis"/><validate:validationMessage name="obj.documento.pis"/></label>
				<input class="o-form__data has-validation" id="pis" maxlength="15" name="obj.documento.pis" type="text" value="${obj.documento.pis}">
			</div>
		</div>
	</section>
</fieldset>