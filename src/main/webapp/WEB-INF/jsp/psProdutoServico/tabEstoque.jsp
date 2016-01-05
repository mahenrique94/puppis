<%@include file="/config/taglibraries.jsp"%>
<input name="obj.estoque.idproduto.id" type="hidden" value="${obj.estoque.idproduto.id}">
<input name="obj.estoque.idgrupo.id" type="hidden" value="${obj.estoque.idgrupo.id}">
<input name="obj.estoque.idclasse.id" type="hidden" value="${obj.estoque.idclasse.id}">
<input name="obj.estoque.id" type="hidden" value="${obj.estoque.id}">
<div class="row" role="row">
	<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6" role="separator">
		<label><fmt:message key="label.quantidade.min"/></label>
		<input class="input-form" maxlength="13" name="obj.estoque.quantidademin" pattern="numeric10_2" type="text" value="${obj.estoque.quantidademin}"/>
		<netsis:validationMessage name="obj.estoque.quantidademin"/>
	</div>
	<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6" role="separator">
		<label><fmt:message key="label.quantidade.max"/></label>
		<input class="input-form" maxlength="13" name="obj.estoque.quantidademax" pattern="numeric10_2" type="text" value="${obj.estoque.quantidademax}"/>
		<netsis:validationMessage name="obj.estoque.quantidademax"/>
	</div>
</div>
<div class="row" role="row">
	<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6" role="separator">
		<label><fmt:message key="label.quantidade.estoque"/></label>
		<input class="input-form" maxlength="13" name="obj.estoque.quantidade" pattern="numeric10_2" readonly required type="text" value="${obj.estoque.quantidade}"/>
		<netsis:validationMessage name="obj.estoque.quantidade"/>
	</div>
	<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6" role="separator">
		<label><fmt:message key="label.quantidade.vendida"/></label>
		<input class="input-form" maxlength="13" name="obj.estoque.quantidadeven" pattern="numeric10_2" readonly type="text" value="${obj.estoque.quantidadeven}"/>
		<netsis:validationMessage name="obj.estoque.quantidadeven"/>
	</div>
</div>