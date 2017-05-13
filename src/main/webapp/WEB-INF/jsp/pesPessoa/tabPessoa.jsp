<%@include file="/config/taglibraries.jsp"%>
<c:set var="autoFocus" value="${obj.id != null ? '' : 'autofocus'}"/>
<section class="o-form__body o-form__body--padding">
	<div class="l-row" role="row">
		<div class="u-grid--6" role="grid">
			<label class="o-form__text" for="id"><fmt:message key="label.id"/><validate:validationMessage name="obj.id"/></label>
			<input aria-readonly="true" aria-required="true" class="o-form__data has-validation" id="id" min="0" name="obj.id" pattern="number0to9" readonly required step="1" type="number" value="${obj.id}">
		</div>							
		<div class="u-grid--6" role="grid">
			<label class="o-form__text" for="datacreate"><fmt:message key="label.data.create"/><validate:validationMessage name="obj.datacreate"/></label>
			<input aria-readonly="true" aria-required="true" class="o-form__data has-validation" id="datacreate" maxlength="10" onkeypress="checkMask(event);" onkeyup="mask(maskData, this, event);" pattern="data" readonly required type="text" value="<fmt:formatDate pattern="dd/MM/yyyy" value="${obj.datacreate.time}" type="date"/>"/>
		</div>							
	</div>
	<c:import url="../documento.jsp"/>
	<c:import url="../dados.jsp"/>
	<div class="l-row" role="row">
		<div class="u-grid--4" role="grid">
			<label class="o-form__text" for="sexo"><fmt:message key="label.sexo"/><validate:validationMessage name="obj.idsexo.id"/></label>
			<select aria-required="true" class="o-form__data has-validation" data-select="slPesSexo" data-url="slPessoa_Sexo_Json" id="sexo" name="obj.idsexo.id" required></select>
		</div>
		<div class="u-grid--4" role="grid">
			<label class="o-form__text" for="estadocivil"><fmt:message key="label.estado.civil"/><validate:validationMessage name="obj.idestadocivil.id"/></label>
			<select aria-required="true" class="o-form__data has-validation" data-select="slPesEstadoCivil" data-url="slPessoa_Estado-civil_Json" id="estadocivil" name="obj.idestadocivil.id" required></select>
		</div>							
		<div class="u-grid--4" role="grid">
			<label class="o-form__text" for="apelido"><fmt:message key="label.apelido"/><validate:validationMessage name="obj.apelido"/></label>
			<input class="o-form__data has-validation" id="apelido" maxlength="30" name="obj.apelido" pattern="espacoLetraNumero" type="text" value="${obj.apelido}">
		</div>
	</div>
	<div class="l-row" role="row">
		<div class="u-grid--12" role="grid">
			<label class="o-form__text" for=""><fmt:message key="label.inativo"/><validate:validationMessage name="obj.inativo"/></label>
			<input <c:if test="${obj.inativo == true}">checked</c:if> class="o-mark__data--checkbox" id="inativo" name="obj.inativo" type="hidden" value="${obj.inativo}">
			<label class="o-mark__text"><span class="o-mark__element" data-marked="true" data-unmarked="false" onclick="MarkController.mark(this);"></span></label>
		</div>
	</div>
	<c:import url="../pesEndereco/endereco.jsp"/>
	<c:import url="../pesDocumento/documento.jsp"/>
	<div class="l-row" role="row">
		<div class="u-grid--12" role="grid">
			<label class="o-form__text" for="observacao"><fmt:message key="label.observacao"/></label>
			<textarea class="o-form__data has-validation" id="observacao" name="obj.observacao" pattern="textarea">${obj.observacao}</textarea>
		</div>
	</div>
</section>