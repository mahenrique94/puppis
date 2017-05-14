<%@include file="/config/taglibraries.jsp"%>
<c:set var="autoFocus" value="${obj.id != null ? '' : 'autofocus'}"/>
<section class="o-form__body o-form__body--padding">
	<input aria-hidden="true" name="obj.idcomercio.id" type="hidden" value="${userName.idComercio}">
	<input aria-hidden="true" name="obj.idusuario.id" type="hidden" value="${userName.id}">
	<input aria-hidden="true" name="obj.custo.id" type="hidden" value="${obj.custo.id}">
	<input aria-hidden="true" name="obj.custo.idnota.id" type="hidden" value="${obj.id}">
	<div class="l-row" role="row">
		<div class="u-grid--12" role="grid">
			<label class="o-form__text" for="operacao"><fmt:message key="label.operacao"/><validate:validationMessage name="obj.operacao"/></label>
			<select aria-required="true" ${autoFocus} class="o-form__data has-validation" data-parameters-fields="[gruporesumo]" data-parameters-values="[NOTA]" data-select="slSysTipoOperacao" data-url="slSystem_Tipo-de-operacao_Json" id="operacao" name="obj.idtipooperacao.id" ${readOnly} required></select>
		</div>
	</div>
</section>