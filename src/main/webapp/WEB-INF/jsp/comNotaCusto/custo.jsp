<%@include file="/config/taglibraries.jsp"%>
<input type="hidden" name="obj.custo.id" value="${obj.custo.id}">
<input type="hidden" name="obj.custo.idformapagamento.idaux" value="${obj.custo.idformapagamento.id}">
<input type="hidden" name="obj.custo.idnota.id" value="${obj.id}">
<section aria-expanded="true" aria-hidden="false" class="form-body" role="form">
	<div class="row" role="row">
		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" role="separator">
			<label><fmt:message key="label.forma.pagamento"/></label>
			<select class="form-data validate" data-class="slFinFormaPagamento" id="slFinanceiro_Forma-de-pagamento_json_1" name="obj.custo.idformapagamento.id"></select>
			<netsis:validationMessage name="obj.custo.idformapagamento.id"/>
		</div>
	</div>
	<div class="row" role="row">
		<div class="col-xs-3 col-sm-3 col-md-3 col-lg-3" role="separator">
			<label><fmt:message key="label.porc.icms"/></label>
			<input class="form-data validate" maxlength="13" name="obj.custo.porcicms" pattern="numeric10_2" readonly type="text" value="${obj.custo.porcicms}">
			<netsis:validationMessage name="obj.custo.porcicms"/>
		</div>
		<div class="col-xs-3 col-sm-3 col-md-3 col-lg-3" role="separator">
			<label><fmt:message key="label.porc.ipi"/></label>
			<input class="form-data validate" maxlength="13" name="obj.custo.porcipi" pattern="numeric10_2" readonly type="text" value="${obj.custo.porcipi}">
			<netsis:validationMessage name="obj.custo.porcipi"/>
		</div>
		<div class="col-xs-3 col-sm-3 col-md-3 col-lg-3" role="separator">
			<label><fmt:message key="label.porc.desconto"/></label>
			<input class="form-data validate" maxlength="13" name="obj.custo.porcdesconto" pattern="numeric10_2" readonly type="text" value="${obj.custo.porcdesconto}">
			<netsis:validationMessage name="obj.custo.porcdesconto"/>
		</div>
		<div class="col-xs-3 col-sm-3 col-md-3 col-lg-3" role="separator">
			<label><fmt:message key="label.valor.total"/></label>
			<input class="form-data validate" name="obj.custo.valortotal" readonly type="text" value="${obj.custo.valortotal}">
			<netsis:validationMessage name="obj.custo.valortotal"/>
		</div>
	</div>
</section>