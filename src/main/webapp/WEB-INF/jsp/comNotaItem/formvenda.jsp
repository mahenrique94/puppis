<%@include file="/config/taglibraries.jsp" %>
<%@include file="/config/libraries-style.jsp"%>
<c:set var="readOnly" value="${obj.id != null ? 'readonly' : ''}"/>
<c:set var="disabled" value="${obj.id != null ? 'disabled' : ''}"/>
<form action="<c:url value="/comercio/nota-item"/>" class="form-modern" id="formcomnotaitem" method="post" name="formcomnotaitem" onsubmit="return enviarPost(this);" role="form">
	<input name="obj.id" type="hidden" value="${obj.id}">
	<input name="obj.idnota.id" type="hidden" value="${obj.idnota.id}">
	<input name="obj.idprodutoservico.idaux" type="hidden" value="${obj.idprodutoservico.id}">
	<nav class="band-nav-lube" role="complementary">
		<div class="row" role="row">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" role="separator">
				<label><fmt:message key="nav.comercio.nota.item"/></label>					
			</div>
		</div>
	</nav>
	<section aria-expanded="true" aria-hidden="false" class="form-body" role="form">
		<div class="row" role="row">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" role="separator">
				<label><fmt:message key="label.item"/></label>
				<select class="form-data ss validate" data-class="sl" id="slProduto-Servico_json_01" required name="obj.idprodutoservico.id"></select>
				<netsis:validationMessage name="obj.idprodutoservico.id"/>
			</div>
		</div>
		<div class="row" role="row">
			<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6" role="separator">
				<label><fmt:message key="label.quantidade"/></label>
				<input class="form-data validate" maxlength="10" name="obj.quantidade" pattern="numeric10_2" required type="text" value="<fmt:formatNumber pattern="0.00" type="currency" value="${obj.quantidade}"/>">
				<netsis:validationMessage name="obj.quantidade"/>
			</div>
			<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6" role="separator">
				<label><fmt:message key="label.valor.unitario"/></label>
				<input class="form-data validate" id="psprodutoservico_custo_valorvenda" maxlength="13" name="obj.valorunitario" pattern="numeric10_2" readonly required type="text" value="<fmt:formatNumber pattern="0.00" type="currency" value="${obj.valorunitario}"/>">
				<netsis:validationMessage name="obj.valorunitario"/>
			</div>
		</div>
		<div class="row" role="row">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" role="separator">
				<label><fmt:message key="label.porc.desconto"/></label>
				<input class="form-data validate" maxlength="13" name="obj.porcdesconto" pattern="numeric10_2" type="text" value="<fmt:formatNumber pattern="0.00" type="currency" value="${obj.porcdesconto}"/>">
				<netsis:validationMessage name="obj.porcdesconto"/>
			</div>
		</div>
		<div class="row" role="row">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" role="separator">
				<label><fmt:message key="label.valor.total"/></label>
				<input class="form-data validate" readonly type="text" value="<fmt:formatNumber pattern="0.00" type="currency" value="${obj.valortotal}"/>">
				<netsis:validationMessage name="obj.valortotal"/>
			</div>
		</div>
	</section>
	<nav class="nav-group-tie nav-fixed-bottom" role="complementary">
		<ul>
			<li><button title="<fmt:message key="button.salvar"/>" type="submit"><i class="icon-floppy"></i>&nbsp;<fmt:message key="button.salvar"/></button></li>
		</ul>
	</nav>
</form>
<%@include file="/config/libraries-js.jsp"%>