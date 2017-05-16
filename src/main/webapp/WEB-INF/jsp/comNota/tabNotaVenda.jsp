<%@include file="/config/taglibraries.jsp"%>
<c:set var="autoFocus" value="${obj.id != null ? '' : 'autofocus'}"/>
<c:set var="readOnly" value="${obj.dataatualizacao != null ? 'readonly' : ''}"/>
<c:set var="disabled" value="${obj.dataatualizacao != null ? 'disabled' : ''}"/>
<section class="o-form__body o-form__body--padding">
	<input aria-hidden="true" name="obj.idcomercio.id" type="hidden" value="${obj.idcomercio.id}">
	<input aria-hidden="true" name="obj.idusuario.id" type="hidden" value="${obj.idusuario.id}">
	<input aria-hidden="true" name="obj.idtipooperacao.idaux" type="hidden" value="${obj.idtipooperacao.id}">
	<input aria-hidden="true" name="obj.iddefinicao.idaux" type="hidden" value="${obj.iddefinicao.id}">
	<input aria-hidden="true" name="obj.custo.idformapagamento.idaux" type="hidden" value="${obj.custo.idformapagamento.id}">
	<div class="l-row" role="row">
		<div class="u-grid--12" role="grid">
			<label class="o-form__text" for="operacao"><fmt:message key="label.operacao"/><validate:validationMessage name="obj.operacao"/></label>
			<select aria-readonly="true" aria-required="true" class="o-form__data has-validation" data-parameters-fields="[gruporesumo]" data-parameters-values="[NOTA]" data-select="slSysTipoOperacao" data-url="slSystem_Tipo-de-operacao_Json" id="operacao" name="obj.idtipooperacao.id" readonly required></select>
		</div>
	</div>
	<div class="l-row" role="row">
		<div class="u-grid--4" role="grid">
			<label class="o-form__text" for="id"><fmt:message key="label.id"/><validate:validationMessage name="obj.id"/></label>
			<input aria-readonly="true" aria-required="true" class="o-form__data has-validation" id="id" name="obj.id" pattern="number0to9" readonly required step="1" type="number" value="${obj.id}">
		</div>
		<div class="u-grid--4" role="grid">
			<label class="o-form__text" for="dataatualizacao"><fmt:message key="label.data.atualizacao"/><validate:validationMessage name="obj.dataatualizacao"/></label>
			<input aria-readonly="true" class="o-form__data has-validation" id="dataatualizacao" max="31-12-2900" maxlength="10" min="01-01-1900" name="obj.dataatualizacao" onkeypress="checkMask(event);" onkeyup="mask(maskData, this, event);" pattern="data" readonly type="text" value="<fmt:formatDate pattern="dd/MM/yyyy" value="${obj.dataatualizacao.time}" type="date"/>">
		</div>
		<div class="u-grid--4" role="grid">
			<label class="o-form__text" for="datacancelamento"><fmt:message key="label.data.cancelamento"/><validate:validationMessage name="obj.datacancelamento"/></label>
			<input aria-readonly="true" class="o-form__data has-validation" id="datacancelamento" max="31-12-2900" maxlength="10" min="01-01-1900" name="obj.datacancelamento" onkeypress="checkMask(event);" onkeyup="mask(maskData, this, event);" pattern="data" readonly type="text" value="<fmt:formatDate pattern="dd/MM/yyyy" value="${obj.datacancelamento.time}" type="date"/>">
		</div>
	</div>
	<div class="l-row" role="row">
		<div class="u-grid--12" role="grid">
			<label class="o-form__text" for="formapagamento"><fmt:message key="label.forma.pagamento"/><validate:validationMessage name="obj.custo.idformapagamento.id"/></label>
			<select class="o-form__data has-validation" data-select="slFinFormaPagamento" ${disabled} data-url="slFinanceiro_Forma-de-pagamento_Json" id="formapagamento" name="obj.custo.idformapagamento.id" ${readOnly}></select>
		</div>
	</div>
	<div class="l-row" role="row">
		<div class="u-grid--12" role="grid">
			<label class="o-form__text" for=""><fmt:message key="label.pessoa"/><validate:validationMessage name="obj.operacao"/></label>
			<select aria-required="true" class="o-form__data has-validation ss-search" data-parameters-fields="[idtipo.descricao]" data-parameters-values="[FORNECEDOR]" data-select="slPesDefinicao" data-url="slPessoa_Definicao_Json" ${disabled} ${readOnly} required name="obj.iddefinicao.id"></select>
		</div>
	</div>
</section>