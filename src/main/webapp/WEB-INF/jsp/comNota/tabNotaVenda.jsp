<%@include file="/config/taglibraries.jsp"%>
<c:set var="readOnly" value="${obj.dataatualizacao != null ? 'readonly' : ''}"/>
<c:set var="disabled" value="${obj.dataatualizacao != null ? 'disabled' : ''}"/>
<section aria-expanded="true" aria-hidden="false" class="form-body" role="form">
	<input name="obj.idcomercio.id" type="hidden" value="${username.comercio.id}">
	<input name="obj.idusuario.id" type="hidden" value="${username.usuario.id}">
	<input name="obj.idtipooperacao.idaux" type="hidden" value="${obj.idtipooperacao.id}">
	<input name="obj.iddefinicao.idaux" type="hidden" value="${obj.iddefinicao.id}">
	<input name="obj.custo.idformapagamento.idaux" type="hidden" value="${obj.custo.idformapagamento.id}">
	<div class="row" role="row">
		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" role="separator">
			<label><fmt:message key="label.operacao"/></label>
			<select class="form-data validate" data-class="slSysTipoOperacao" data-fields="idmodulo.id" data-parameters="1" id="slSystem_Tipo-de-operacao_json_1" name="obj.idtipooperacao.id" ${readOnly}></select>
			<netsis:validationMessage name="obj.operacao"/>
		</div>
	</div>
	<div class="row" role="row">
		<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4" role="separator">
			<label><fmt:message key="label.id"/></label>
			<input class="form-data validate" name="obj.id" readonly type="number" value="${obj.id}">
			<netsis:validationMessage name="obj.id"/>
		</div>
		<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4" role="separator">
			<label><fmt:message key="label.data.atualizacao"/></label>
			<input class="form-data validate" maxlength="10" name="obj.dataatualizacao" pattern="data" readonly type="text" value="<fmt:formatDate pattern="dd/MM/yyyy" value="${obj.dataatualizacao.time}" type="date"/>">
			<netsis:validationMessage name="obj.dataatualizacao"/>
		</div>
		<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4" role="separator">
			<label><fmt:message key="label.data.cancelamento"/></label>
			<input class="form-data validate" maxlength="10" name="obj.datacancelamento" pattern="data" readonly type="text" value="<fmt:formatDate pattern="dd/MM/yyyy" value="${obj.datacancelamento.time}" type="date"/>">
			<netsis:validationMessage name="obj.datacancelamento"/>
		</div>
	</div>
	<div class="row" role="row">
		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" role="separator">
			<label><fmt:message key="label.forma.pagamento"/></label>
			<select class="form-data validate" data-class="slFinFormaPagamento" id="slFinanceiro_Forma-de-pagamento_json_1" name="obj.custo.idformapagamento.id" ${readOnly}></select>
			<netsis:validationMessage name="obj.custo.idformapagamento.id"/>
		</div>
	</div>
	<div class="row" role="row">
		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" role="separator">
			<label><fmt:message key="label.pessoa"/></label>
			<select class="form-data ss validate" data-class="slPesDefinicao" data-fields="idtipo.descricao" data-parameters="CLIENTE" id="slPessoa_Definicao_Json_01" ${readOnly} required name="obj.iddefinicao.id"></select>
			<netsis:validationMessage name="obj.operacao"/>
		</div>
	</div>
</section>