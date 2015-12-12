<%@include file="/config/taglibraries.jsp"%>
<input type="hidden" name="obj.custo.idproduto.id" value="${obj.custo.idproduto.id}">
<input type="hidden" name="obj.custo.idgrupo.id" value="${obj.custo.idgrupo.id}">
<input type="hidden" name="obj.custo.idclasse.id" value="${obj.custo.idclasse.id}">
<input type="hidden" name="obj.custo.id" value="${obj.custo.id}">
<div class="row-input" role="row">
	<div class="w-50" role="separator">
		<label class="align-left"><fmt:message key="label.valor.min"/></label>
		<input class="input-form" maxlength="13" name="obj.custo.valormin" pattern="numeric10_2" type="text" value="${obj.custo.valormin}">
		<netsis:validationMessage name="obj.custo.valormin"/>
	</div>
	<div class="w-50" role="separator">
		<label class="align-left"><fmt:message key="label.valor.max"/></label>
		<input class="input-form full" maxlength="13" name="obj.custo.valormax" pattern="numeric10_2" type="text" value="${obj.custo.valormax}"/>
		<netsis:validationMessage name="obj.custo.valormax"/>
	</div>
</div>
<div class="row-input" role="row">
	<div class="w-50" role="separator">
		<label class="align-left"><fmt:message key="label.valor.anterior"/></label>
		<input class="input-form" maxlength="13" name="obj.custo.valoranterior" pattern="numeric10_2" readonly type="text" value="${obj.custo.valoranterior}"/>
		<netsis:validationMessage name="obj.custo.valoranterior"/>
	</div>
	<div class="w-50" role="separator">
		<label class="align-left"><fmt:message key="label.valor.pago"/></label>
		<input class="input-form full" maxlength="13" name="obj.custo.valorpago" pattern="numeric10_2" readonly required value="${obj.custo.valorpago}" type="text"/>
		<netsis:validationMessage name="obj.custo.valorpago"/>
	</div>
</div>
<div class="row-input" role="row">
	<div class="w-50" role="separator">
		<label class="align-left"><fmt:message key="label.porc.lucro"/></label>
		<input class="input-form" maxlength="13" name="obj.custo.porclucro" pattern="numeric10_2" readonly required type="text" value="${obj.custo.porclucro}"/>
		<netsis:validationMessage name="obj.custo.porclucro"/>
	</div>
	<div class="w-50" role="separator">
		<label class="align-left"><fmt:message key="label.valor.venda"/></label>
		<input class="input-form full" maxlength="13" name="obj.custo.valorvenda" pattern="numeric10_2" readonly required type="text" value="${obj.custo.valorvenda}"/>
		<netsis:validationMessage name="obj.custo.valorvenda"/>
	</div>
</div>
<div class="row-input" role="row">
	<div class="w-100" role="separator">
		<label class="align-left"><fmt:message key="label.valor.total"/></label>
		<input class="input-form full" maxlength="13" name="obj.custo.valortotal" pattern="numeric10_2" readonly required type="text" value="${obj.custo.valortotal}"/>
		<netsis:validationMessage name="obj.custo.valortotal"/>
	</div>
</div>