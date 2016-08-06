<%@include file="/config/taglibraries.jsp"%>
<input name="obj.custo.id" type="hidden" value="${obj.custo.id}">
<input name="obj.custo.idprodutoservico.id" type="hidden" value="${obj.custo.idprodutoservico.id}">
<section aria-expanded="true" aria-hidden="false" class="form-body" role="form">
	<div class="row" role="row">
		<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6" role="separator">
			<label><fmt:message key="label.valor.min"/></label>
			<input class="form-data validate" maxlength="13" name="obj.custo.valormin" pattern="numeric10_2" type="text" value="<fmt:formatNumber pattern="0.00" type="currency" value="${obj.custo.valormin}"/>">
			<netsis:validationMessage name="obj.custo.valormin"/>
		</div>
		<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6" role="separator">
			<label><fmt:message key="label.valor.max"/></label>
			<input class="form-data validate" maxlength="13" name="obj.custo.valormax" pattern="numeric10_2" type="text" value="<fmt:formatNumber pattern="0.00" type="currency" value="${obj.custo.valormax}"/>"/>
			<netsis:validationMessage name="obj.custo.valormax"/>
		</div>
	</div>
	<div class="row" role="row">
		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" role="separator">
			<label><fmt:message key="label.valor.pago"/></label>
			<input class="form-data validate" maxlength="13" name="obj.custo.valor" pattern="numeric10_2" readonly required type="text" value="<fmt:formatNumber pattern="0.00" type="currency" value="${obj.custo.valor}"/>"/>
			<netsis:validationMessage name="obj.custo.valor"/>
		</div>
	</div>
</section>