<%@include file="/config/taglibraries.jsp"%>
<input type="hidden" name="obj.pagamento.id" value="${obj.pagamento.id}">
<input type="hidden" name="obj.pagamento.idcomercio.id" value="${obj.pagamento.idcomercio.id}">
<input type="hidden" name="obj.pagamento.idcontabancaria.idaux" value="${obj.pagamento.idcontabancaria.id}">
<span class="band-lube" role="separator"><label><fmt:message key="titulo.pagamento"/></label></span>
<div class="row" role="row">
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" role="separator">
		<label><fmt:message key="label.conta"/></label>
		<select class="form-data validate" data-class="slFinContaBancaria" id="slFinanceiro_Conta-Bancaria_Json_01" name="obj.pagamento.idcontabancaria.id" required></select>
		<netsis:validationMessage name="obj.endereco.uf"/>
	</div>
</div>