<%@include file="/config/taglibraries.jsp"%>
<input name="obj.id" type="hidden" value="${obj.id}">
<input name="obj.iddefinicao.idaux" type="hidden" value="${obj.iddefinicao.id}">
<input name="obj.idtipooperacao.idaux" type="hidden" value="${obj.idtipooperacao.id}">
<input name="obj.idcontabancaria.idaux" type="hidden" value="${obj.idcontabancaria.id}">
<input name="obj.idtipodocumento.idaux" type="hidden" value="${obj.idtipodocumento.id}">
<input name="obj.idformapagamento.idaux" type="hidden" value="${obj.idformapagamento.id}">
<input name="obj.idhistorico.idaux" type="hidden" value="${obj.idhistorico.id}">
<input name="obj.valordesconto" type="hidden" value="${obj.valordesconto}">
<input name="obj.valorjuros" type="hidden" value="${obj.valorjuros}">
<section aria-expanded="true" aria-hidden="false" class="form-body" role="form">
	<div class="row-input" role="row">
		<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
			<label><fmt:message key="label.operacao"/></label>
			<select class="form-data validate" data-class="slSysTipoOperacao" data-fields="idmodulo.id, gruporesumo" data-parameters="2, DOCUMENTO" id="slSystem_Tipo-de-operacao_Json_01" name="obj.idtipooperacao.id" required></select>
			<netsis:validationMessage name="obj.idtipooperacao.id"/>
		</div>
		<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6" role="separator">
			<label><fmt:message key="label.forma.pagamento"/></label>
			<select class="form-data validate" data-class="slFinFormaPagamento" id="slFinanceiro_Forma-de-pagamento_Json_01" name="obj.idformapagamento.id"></select>
		</div>
	</div>
	<div class="row" role="row">
		<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6" role="separator">
			<label><fmt:message key="label.pessoa"/></label>
			<select class="form-data ss validate" data-class="slPesDefinicao" id="slPessoa_Definicao_Json_01" name="obj.iddefinicao.id" required></select>
			<netsis:validationMessage name="obj.iddefinicao.id"/>
		</div>
		<div class="col-xs-3 col-sm-3 col-md-3 col-lg-3" role="separator">
			<label><fmt:message key="label.conta"/></label>
			<select class="form-data validate" data-class="slFinContaBancaria" id="slFinanceiro_Conta-bancaria_Json_01" name="obj.idcontabancaria.id" required></select>
			<netsis:validationMessage name="obj.idcontabancaria.id"/>
		</div>
		<div class="col-xs-3 col-sm-3 col-md-3 col-lg-3" role="separator">
			<label><fmt:message key="label.tipo.documento"/></label>
			<select class="form-data validate" data-class="slFinTipoDocumento" id="slFinanceiro_Tipo-de-documento_Json_01" name="obj.idtipodocumento.id"></select>
			<netsis:validationMessage name="obj.idtipodocumento.id"/>
		</div>
	</div>
	<div class="row" role="row">
		<div class="col-xs-2 col-sm-2 col-md-2 col-lg-2" role="separator">
			<label><fmt:message key="label.numero"/></label>
			<div class="form-data-group">
				<input class="form-data validate" id="code-target" min="0" name="obj.numero" pattern="numero0a9" required type="number" value="${obj.numero}">
				<span class="form-data-group-btn"><button class="btn-default" onclick="gerarCode();" type="button"><i class="icon-cog"></i></button></span>
			</div>
			<netsis:validationMessage name="obj.numero"/>
		</div>		
		<div class="col-xs-2 col-sm-2 col-md-2 col-lg-2" role="separator">
			<label><fmt:message key="label.serie"/></label>
			<input class="form-data validate" min="0" name="obj.serie" pattern="numero0a9" type="number" value="${obj.serie}">
			<netsis:validationMessage name="obj.serie"/>
		</div>
		<div class="col-xs-2 col-sm-2 col-md-2 col-lg-2" role="separator">
			<label><fmt:message key="label.desdobramento"/></label>
			<input class="form-data validate" name="obj.desdobramento" required type="text" value="${obj.desdobramento}">
			<netsis:validationMessage name="obj.desdobramento"/>
		</div>
		<div class="col-xs-3 col-sm-3 col-md-3 col-lg-3" role="separator">
			<label><fmt:message key="label.data.emissao"/></label>
			<input class="form-data validate" maxlength="10" min="01-01-1970" name="obj.dataemissao" onkeypress="format(this, event, maskData);" pattern="data" required type="text" value="<fmt:formatDate pattern="dd/MM/yyyy" type="date" value="${obj.dataemissao.time}"/>">
			<netsis:validationMessage name="obj.dataemissao"/>
		</div>
		<div class="col-xs-3 col-sm-3 col-md-3 col-lg-3" role="separator">
			<label><fmt:message key="label.data.vencimento"/></label>
			<input class="form-data validate" maxlength="10" min="01-01-1970" name="obj.datavencimento" onkeypress="format(this, event, maskData);" required type="text" value="<fmt:formatDate pattern="dd/MM/yyyy" type="date" value="${obj.datavencimento.time}"/>">
			<netsis:validationMessage name="obj.datavencimento"/>
		</div>
	</div>
	<div class="row" role="row">
		<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6" role="separator">
			<label><fmt:message key="label.valor.total"/></label>
			<input class="form-data validate" maxlength="13" name="obj.valortotal" pattern="numeric10_2" required type="text" value="<fmt:formatNumber pattern="0.00" type="currency" value="${obj.valortotal}"/>"/>
			<netsis:validationMessage name="obj.valortotal"/>
		</div>
		<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6" role="separator">
			<label><fmt:message key="label.saldo"/></label>
			<input class="form-data validate" name="obj.saldo" readonly type="text" value="<fmt:formatNumber pattern="0.00" type="currency" value="${obj.saldo}"/>"/>
			<netsis:validationMessage name="obj.saldo"/>
		</div>
	</div>
	<div class="row" role="row">
		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" role="separator">
			<label><fmt:message key="label.codigo.barra"/></label>
			<input class="form-data validate" maxlength="120" name="obj.codigobarra" pattern="letraNumero" type="text" value="${obj.codigobarra}">
			<netsis:validationMessage name="obj.codigobarra"/>
		</div>
	</div>
	<div class="row" role="row">
		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" role="separator">
			<label><fmt:message key="label.id.historico"/></label>
			<select class="form-data ss validate" data-class="sl" id="slFinanceiro_Historico_Json_01" name="obj.idhistorico.id"></select>
			<netsis:validationMessage name="obj.idhistorico.id"/>
		</div>
	</div>
</section>