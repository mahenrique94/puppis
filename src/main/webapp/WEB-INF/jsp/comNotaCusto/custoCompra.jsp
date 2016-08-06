<%@include file="/config/taglibraries.jsp"%>
<input name="obj.custo.id" type="hidden" value="${obj.custo.id}">
<input name="obj.custo.idnota.id" type="hidden" value="${obj.id}">
<section aria-expanded="true" aria-hidden="false" class="form-body" role="form">
	<div class="row" role="row">
		<div class="col-xs-3 col-sm-3 col-md-3 col-lg-3" role="separator">
			<label><fmt:message key="label.valor.icms"/></label>
			<input class="form-data validate" maxlength="13" name="obj.custo.valoricms" pattern="numeric10_2" readonly type="text" value="<fmt:formatNumber pattern="0.00" type="currency" value="${obj.custo.valoricms}"/>">
			<netsis:validationMessage name="obj.custo.valoricms"/>
		</div>
		<div class="col-xs-3 col-sm-3 col-md-3 col-lg-3" role="separator">
			<label><fmt:message key="label.valor.ipi"/></label>
			<input class="form-data validate" maxlength="13" name="obj.custo.valoripi" pattern="numeric10_2" readonly type="text" value="<fmt:formatNumber pattern="0.00" type="currency" value="${obj.custo.valoripi}"/>">
			<netsis:validationMessage name="obj.custo.valoripi"/>
		</div>
		<div class="col-xs-3 col-sm-3 col-md-3 col-lg-3" role="separator">
			<label><fmt:message key="label.valor.desconto"/></label>
			<input class="form-data validate" maxlength="13" name="obj.custo.valordesconto" pattern="numeric10_2" readonly type="text" value="<fmt:formatNumber pattern="0.00" type="currency" value="${obj.custo.valordesconto}"/>">
			<netsis:validationMessage name="obj.custo.valordesconto"/>
		</div>
		<div class="col-xs-3 col-sm-3 col-md-3 col-lg-3" role="separator">
			<label><fmt:message key="label.valor.juros"/></label>
			<input class="form-data validate" name="obj.custo.valorjuros" readonly type="text" value="<fmt:formatNumber pattern="0.00" type="currency" value="${obj.custo.valorjuros}"/>">
			<netsis:validationMessage name="obj.custo.valorjuros"/>
		</div>
	</div>
	<div class="row" role="row">
		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" role="separator">
			<label><fmt:message key="label.valor.total"/></label>
			<input class="form-data validate" name="obj.custo.valortotal" readonly type="text" value="<fmt:formatNumber pattern="0.00" type="currency" value="${obj.custo.valortotal}"/>">
			<netsis:validationMessage name="obj.custo.valortotal"/>
		</div>
	</div>
</section>