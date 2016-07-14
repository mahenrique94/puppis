<%@include file="/config/taglibraries.jsp"%>
<input name="obj.idusuario.id" type="hidden" value="${username.usuario.id}">
<input name="obj.idtipooperacao.idaux" type="hidden" value="${obj.idtipooperacao.id}">
<input name="obj.iddefinicao.idaux" type="hidden" value="${obj.iddefinicao.id}">
<section aria-expanded="true" aria-hidden="false" class="form-body" role="form">
	<div class="row" role="row">
		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" role="separator">
			<label><fmt:message key="label.operacao"/></label>
			<select class="form-data validate" data-class="slSysTipoOperacao" data-fields="idmodulo.id" data-parameters="1" id="slSystem_Tipo-de-operacao_json_1" name="obj.idtipooperacao.id" ${readOnly}></select>
			<netsis:validationMessage name="obj.operacao"/>
		</div>
	</div>
	<div class="row" role="row">
		<div class="col-xs-3 col-sm-3 col-md-3 col-lg-3" role="separator">
			<label><fmt:message key="label.id"/></label>
			<input class="form-data validate" name="obj.id" readonly type="number" value="${obj.id}">
			<netsis:validationMessage name="obj.id"/>
		</div>
		<div class="col-xs-3 col-sm-3 col-md-3 col-lg-3" role="separator">
			<label><fmt:message key="label.data.emissao"/></label>
			<input class="form-data validate" maxlength="10" name="obj.dataemissao" onkeypress="format(this, event, dataMask);" pattern="data" type="text" value="<fmt:formatDate pattern="dd/MM/yyyy" value="${obj.dataemissao.time}" type="date"/>">
			<netsis:validationMessage name="obj.dataemissao"/>
		</div>
		<div class="col-xs-3 col-sm-3 col-md-3 col-lg-3" role="separator">
			<label><fmt:message key="label.data.atualizacao"/></label>
			<input class="form-data validate" maxlength="10" name="obj.dataatualizacao" pattern="data" readonly type="text" value="<fmt:formatDate pattern="dd/MM/yyyy" value="${obj.dataatualizacao.time}" type="date"/>">
			<netsis:validationMessage name="obj.dataatualizacao"/>
		</div>
		<div class="col-xs-3 col-sm-3 col-md-3 col-lg-3" role="separator">
			<label><fmt:message key="label.data.cancelamento"/></label>
			<input class="form-data validate" maxlength="10" name="obj.datacancelamento" pattern="data" readonly type="text" value="<fmt:formatDate pattern="dd/MM/yyyy" value="${obj.datacancelamento.time}" type="date"/>">
			<netsis:validationMessage name="obj.datacancelamento"/>
		</div>
	</div>
	<div class="row" role="row">
		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" role="separator">
			<label><fmt:message key="label.pessoa"/></label>
			<select class="form-data ss validate" data-class="slPesDefinicao" id="slPessoa_Definicao_Json_01" required name="obj.iddefinicao.id"></select>
			<netsis:validationMessage name="obj.operacao"/>
		</div>
	</div>
	<div class="row" role="row">
		<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6" role="separator">
			<label><fmt:message key="label.numero.nota"/></label>
			<input class="form-data validate" name="obj.numero" type="number" value="${obj.numero}">
			<netsis:validationMessage name="obj.numero"/>
		</div>
		<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6" role="separator">
			<label><fmt:message key="label.serie.nota"/></label>
			<input class="form-data validate full" name="obj.serie" type="number" value="${obj.serie}">
			<netsis:validationMessage name="obj.serie"/>
		</div>
	</div>
</section>