<%@include file="/config/taglibraries.jsp"%>
<input type="hidden" name="obj.estoque.idproduto.id" value="${obj.estoque.idproduto.id}">
<input type="hidden" name="obj.estoque.idgrupo.id" value="${obj.estoque.idgrupo.id}">
<input type="hidden" name="obj.estoque.idclasse.id" value="${obj.estoque.idclasse.id}">
<input type="hidden" name="obj.estoque.id" value="${obj.estoque.id}">
<div class="row-input" role="row">
	<div class="w-50" role="separator">
		<label class="align-left"><fmt:message key="label.quantidade.min"/></label>
		<input class="input-form" maxlength="13" name="obj.estoque.quantidademin" pattern="numeric10_2" type="text" value="${obj.estoque.quantidademin}"/>
		<netsis:validationMessage name="obj.estoque.quantidademin"/>
	</div>
	<div class="w-50" role="separator">
		<label class="align-left"><fmt:message key="label.quantidade.max"/></label>
		<input class="input-form full" maxlength="13" name="obj.estoque.quantidademax" pattern="numeric10_2" type="text" value="${obj.estoque.quantidademax}"/>
		<netsis:validationMessage name="obj.estoque.quantidademax"/>
	</div>
</div>
<div class="row-input" role="row">
	<div class="w-50" role="separator">
		<label class="align-left"><fmt:message key="label.quantidade.estoque"/></label>
		<input class="input-form" maxlength="13" name="obj.estoque.quantidade" pattern="numeric10_2" readonly required type="text" value="${obj.estoque.quantidade}"/>
		<netsis:validationMessage name="obj.estoque.quantidade"/>
	</div>
	<div class="w-50" role="separator">
		<label class="align-left"><fmt:message key="label.quantidade.vendida"/></label>
		<input class="input-form full" maxlength="13" name="obj.estoque.quantidadeven" pattern="numeric10_2" readonly type="text" value="${obj.estoque.quantidadeven}"/>
		<netsis:validationMessage name="obj.estoque.quantidadeven"/>
	</div>
</div>