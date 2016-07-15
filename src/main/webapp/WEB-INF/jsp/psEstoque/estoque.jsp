<%@include file="/config/taglibraries.jsp"%>
<input name="obj.estoque.id" type="hidden" value="${obj.estoque.id}">
<input name="obj.estoque.idprodutoservico.id" type="hidden" value="${obj.estoque.idprodutoservico.id}">
<section aria-expanded="true" aria-hidden="false" class="form-body" role="form">
	<div class="row" role="row">
		<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6" role="separator">
			<label><fmt:message key="label.quantidade.min"/></label>
			<input class="form-data validate" maxlength="13" name="obj.estoque.quantidademin" pattern="numeric10_2" type="text" value="<fmt:formatNumber pattern="0.00" type="currency" value="${obj.estoque.quantidademin}"/>"/>
			<netsis:validationMessage name="obj.estoque.quantidademin"/>
		</div>
		<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6" role="separator">
			<label><fmt:message key="label.quantidade.max"/></label>
			<input class="form-data validate" maxlength="13" name="obj.estoque.quantidademax" pattern="numeric10_2" type="text" value="<fmt:formatNumber pattern="0.00" type="currency" value="${obj.estoque.quantidademax}"/>"/>
			<netsis:validationMessage name="obj.estoque.quantidademax"/>
		</div>
	</div>
	<div class="row" role="row">
		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" role="separator">
			<label><fmt:message key="label.quantidade.estoque"/></label>
			<input class="form-data validate" maxlength="13" name="obj.estoque.quantidade" pattern="numeric10_2" readonly required type="text" value="<fmt:formatNumber pattern="0.00" type="currency" value="${obj.estoque.quantidade}"/>"/>
			<netsis:validationMessage name="obj.estoque.quantidade"/>
		</div>
	</div>
</section>