<%@include file="/config/taglibraries.jsp"%>
<section aria-expanded="true" aria-hidden="false" class="form-body" role="form">
	<input name="obj.idcomercio.id" type="hidden" value="${username.idComercio}">
	<input name="obj.idusuario.id" type="hidden" value="${username.id}">
	<input name="obj.custo.id" type="hidden" value="${obj.custo.id}">
	<input name="obj.custo.idnota.id" type="hidden" value="${obj.id}">
	<div class="row" role="row">
		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" role="separator">
			<label><fmt:message key="label.operacao"/></label>
			<select class="form-data validate" data-class="slSysTipoOperacao" data-fields="idmodulo.id" data-parameters="1" id="slSystem_Tipo-de-operacao_json_1" name="obj.idtipooperacao.id" ${readOnly}></select>
			<netsis:validationMessage name="obj.operacao"/>
		</div>
	</div>
</section>