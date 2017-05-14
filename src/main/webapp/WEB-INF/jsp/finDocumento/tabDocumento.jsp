<%@include file="/config/taglibraries.jsp"%>
<c:set var="autoFocus" value="${obj.id != null ? '' : 'autofocus'}"/>
<c:set var="readOnly" value="${obj.datapagamento != null ? 'readonly' : ''}"/>
<c:set var="disabled" value="${obj.datapagamento != null ? 'disabled' : ''}"/>
<section class="o-form__body o-form__body--padding">
	<div class="l-row" role="row">
		<div class="u-grid--6">
			<label class="o-form__text" for="operacao"><fmt:message key="label.operacao"/><validate:validationMessage name="obj.idtipooperacao.id"/></label>
			<select aria-readonly="true" class="o-form__data has-validation" data-parameters-fields="[idmodulo.id, gruporesumo]" data-parameters-values="[2, DOCUMENTO]" data-select="slSysTipoOperacao" data-url="slSystem_Tipo-de-operacao_Json" ${disabled} id="operacao" name="obj.idtipooperacao.id" readonly></select>
		</div>
		<div class="u-grid--6" role="grid">
			<label class="o-form__text" for="formapagamento"><fmt:message key="label.forma.pagamento"/><validate:validationMessage name="obj.idformapagamento.id"/></label>
			<select aria-required="true" ${autoFocus} class="o-form__data has-validation" data-select="slFinFormaPagamento" data-url="slFinanceiro_Forma-de-pagamento_Json" ${disabled} id="formapagamento" name="obj.idformapagamento.id" ${readOnly} required></select>
		</div>
	</div>
	<div class="l-row" role="row">
		<div class="u-grid--6" role="grid">
			<label class="o-form__text" for="pessoa"><fmt:message key="label.pessoa"/><validate:validationMessage name="obj.iddefinicao.id"/></label>
			<select aria-required="true" class="o-form__data has-validation" data-select="slPesDefinicao" data-url="slPessoa_Definicao_Json" ${disabled} id="pessoa" name="obj.iddefinicao.id" ${readOnly} required></select>
		</div>
		<div class="u-grid--3" role="grid">
			<label class="o-form__text" for="conta"><fmt:message key="label.conta"/><validate:validationMessage name="obj.idcontabancaria.id"/></label>
			<select aria-required="true" class="o-form__data has-validation" data-select="slFinContaBancaria" data-url="slFinanceiro_Conta-bancaria_Json" ${disabled} id="conta" name="obj.idcontabancaria.id" ${readOnly} required></select>
		</div>
		<div class="u-grid--3" role="grid">
			<label class="o-form__text" for="tipodocumento"><fmt:message key="label.tipo.documento"/><validate:validationMessage name="obj.idtipodocumento.id"/></label>
			<select aria-required="true" class="o-form__data has-validation" data-select="slFinTipoDocumento" data-url="slFinanceiro_Tipo-de-documento_Json" ${disabled} id="tipodocumento" name="obj.idtipodocumento.id" ${readOnly} required></select>
		</div>
	</div>
	<div class="l-row" role="row">
		<div class="u-grid--2" role="grid">
			<label class="o-form__text" for="numero"><fmt:message key="label.numero"/><validate:validationMessage name="obj.numero"/></label>
			<div class="o-form__group">
				<input aria-required="true" class="o-form__data has-validation" id="numero" min="0" name="obj.numero" pattern="number0to9" ${readOnly} required step="1" type="number" value="${obj.numero}">
				<span class="o-form__groupElement"><button class="o-button--lube" onclick="createCode(this);" role="button" title="<fmt:message key="button.gerar.numero"/>" type="button"><i class="icon-cog"></i></button></span>
			</div>
		</div>		
		<div class="u-grid--2" role="grid">
			<label class="o-form__text" for="serie"><fmt:message key="label.serie"/><validate:validationMessage name="obj.serie"/></label>
			<input class="o-form__data has-validation" min="0" name="obj.serie" pattern="number0to9" ${readOnly} step="1" type="number" value="${obj.serie}">
		</div>
		<div class="u-grid--2" role="grid">
			<label class="o-form__text" for="desdobramento"><fmt:message key="label.desdobramento"/><validate:validationMessage name="obj.desdobramento"/></label>
			<div class="o-form__tooltip">
				<input aria-required="true" class="o-form__data has-validation" id="desdobramento" maxlength="7" minlength="0" name="obj.desdobramento" ${readOnly} pattern="desdobramento" required type="text" value="${obj.desdobramento}">
				<span class="o-tooltip--gary"></span>
			</div>
		</div>
		<div class="u-grid--3" role="grid">
			<label class="o-form__text" for="dataemissao"><fmt:message key="label.data.emissao"/><validate:validationMessage name="obj.dataemissao"/></label>
			<input aria-required="true" class="o-form__data has-validation" id="dataemissao" max="12-31-2900" maxlength="10" min="01-01-1900" name="obj.dataemissao" onkeypress="checkMask(event);" onkeyup="mask(maskData, this, event);" pattern="data" ${readOnly} required type="text" value="<fmt:formatDate pattern="dd/MM/yyyy" type="date" value="${obj.dataemissao.time}"/>">
		</div>
		<div class="u-grid--3" role="grid">
			<label class="o-form__text" for="datavencimento"><fmt:message key="label.data.vencimento"/><validate:validationMessage name="obj.datavencimento"/></label>
			<input aria-required="true" class="o-form__data has-validation" id="datavencimento" max="12-31-2900" maxlength="10" min="01-01-1900" name="obj.datavencimento" onkeypress="checkMask(event);" onkeyup="mask(maskData, this, event);" pattern="data" ${readOnly} required type="text" value="<fmt:formatDate pattern="dd/MM/yyyy" type="date" value="${obj.datavencimento.time}"/>">
		</div>
	</div>
	<div class="l-row" role="row">
		<div class="u-grid--6" role="grid">
			<label class="o-form__text" for="valortotal"><fmt:message key="label.valor.total"/><validate:validationMessage name="obj.valortotal"/></label>
			<input aria-required="true" class="o-form__data has-validation" id="valortotal" maxlength="13" name="obj.valortotal" pattern="numeric10-2" ${readOnly} required type="text" value="<fmt:formatNumber pattern="0.00" type="currency" value="${obj.valortotal}"/>"/>
		</div>
		<div class="u-grid--6" role="grid">
			<label class="o-form__text" for="saldo"><fmt:message key="label.saldo"/><validate:validationMessage name="obj.saldo"/></label>
			<input aria-readonly="true" class="o-form__data has-validation" id="saldo" maxlength="13" name="obj.saldo" pattern="numeric10-2" readonly type="text" value="<fmt:formatNumber pattern="0.00" type="currency" value="${obj.saldo}"/>"/>
		</div>
	</div>
	<div class="l-row" role="row">
		<div class="u-grid--12" role="grid">
			<label class="o-form__text" for="codigobarra"><fmt:message key="label.codigo.barra"/><validate:validationMessage name="obj.codigobarra"/></label>
			<input class="o-form__data has-validation" id="codigobarra" maxlength="120" name="obj.codigobarra" pattern="letraNumero" ${readOnly} type="text" value="${obj.codigobarra}">
		</div>
	</div>
	<div class="l-row" role="row">
		<div class="u-grid--12" role="grid">
			<label class="o-form__text" for="historico"><fmt:message key="label.historico"/><validate:validationMessage name="obj.idhistorico.id"/></label>
			<select class="o-form__data has-validation" data-select="sl" data-url="slFinanceiro_Historico_Json" ${disabled} id="historico" name="obj.idhistorico.id" ${readOnly}></select>
		</div>
	</div>
</section>