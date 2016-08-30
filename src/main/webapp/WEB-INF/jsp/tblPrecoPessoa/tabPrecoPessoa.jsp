<%@include file="/config/taglibraries.jsp" %>
<section aria-expanded="true" aria-hidden="false" class="form-body" role="form">
	<input name="obj.id" type="hidden" value="${obj.id}">
	<input name="obj.idtabelapreco.id" type="hidden" value="${obj.idtabelapreco.id}">
	<input name="obj.iddefinicao.idaux" type="hidden" value="${obj.iddefinicao.id}">
	<div class="row" role="row">
		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" role="separator">
			<label><fmt:message key="label.pessoa"/></label>
			<select class="form-data ss validate" data-class="slPesDefinicao" id="slPessoa_Definicao_Json_01" name="obj.iddefinicao.id"></select>
			<netsis:validationMessage name="obj.iddefinicao.id"/>
		</div>
	</div>
</section>