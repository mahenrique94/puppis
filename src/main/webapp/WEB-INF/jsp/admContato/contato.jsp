<%@include file="/config/taglibraries.jsp"%>
<div class="l-row" role="row">
	<div class="u-grid--2" role="grid">
		<label class="o-form__text" for="ddd"><fmt:message key="label.ddd"/><validate:validationMessage name="obj.contato.ddd"/></label>
		<input class="o-form__data has-validation" id="ddd" max="100" min="0" name="obj.contato.ddd" pattern="ddd" step="1" type="number" value="${obj.contato.ddd}">
	</div>
	<div class="u-grid--5" role="grid">
		<label class="o-form__text" for="telefone"><fmt:message key="label.telefone"/><validate:validationMessage name="obj.contato.telefone"/></label>
		<input class="o-form__data has-validation" id="telefone" maxlength="9" name="obj.contato.telefone" onkeypress="checkMask(event);" onkeyup="mask(maskTelefone, this, event);" pattern="telefone" type="text" value="${obj.contato.telefone}">
	</div>
	<div class="u-grid--5" role="grid">
		<label class="o-form__text" for="celular"><fmt:message key="label.celular"/><validate:validationMessage name="obj.contato.celular"/></label>
		<input class="o-form__data has-validation" id="celular" maxlength="11" name="obj.contato.celular" onkeypress="checkMask(event);" onkeyup="mask(maskCelular, this, event);" pattern="celular" type="text" value="${obj.contato.celular}">
	</div>
</div>
<div class="l-row" role="row">	
	<div class="u-grid--12" role="grid">
		<label class="o-form__text" for="email"><fmt:message key="label.email"/><validate:validationMessage name="obj.contato.email"/></label>
		<input class="o-form__data has-validation" id="email" maxlength="255" name="obj.contato.email" pattern="email" type="email" value="${obj.contato.email}">
	</div>
</div>