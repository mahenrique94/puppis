<%@include file="/config/taglibraries.jsp"%>
<section aria-expanded="true" aria-hidden="false" class="form-body" role="form">
	<input name="obj.custo.id" type="hidden" value="${obj.custo.id}">
	<input name="obj.custo.idnota.id" type="hidden" value="${obj.id}">
	<input name="obj.custo.valoricms" type="hidden" value="${obj.custo.valoricms}">
	<input name="obj.custo.valoripi" type="hidden" value="${obj.custo.valoripi}">
	<div class="row" role="row">
		<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6" role="separator">
			<label><fmt:message key="label.porc.desconto"/></label>
			<input class="form-data validate" maxlength="13" name="obj.custo.valordesconto" pattern="numeric10_2" readonly type="text" value="${obj.custo.valordesconto}">
			<netsis:validationMessage name="obj.custo.valordesconto"/>
		</div>
		<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6" role="separator">
			<label><fmt:message key="label.valor.total"/></label>
			<input class="form-data validate" name="obj.custo.valortotal" readonly type="text" value="${obj.custo.valortotal}">
			<netsis:validationMessage name="obj.custo.valortotal"/>
		</div>
	</div>
</section>