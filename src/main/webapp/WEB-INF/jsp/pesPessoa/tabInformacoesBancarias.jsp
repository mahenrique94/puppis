<%@include file="/config/taglibraries.jsp"%>
<input type="hidden" name="obj.informacaoBancaria.id" value="${obj.informacaoBancaria.id}">
<input type="hidden" name="obj.informacaoBancaria.idpessoa.id" value="${obj.informacaoBancaria.idpessoa.id}">
<input type="hidden" name="obj.informacaoBancaria.nomebancoaux" value="${obj.informacaoBancaria.nomebanco}">
<input type="hidden" name="obj.informacaoBancaria.tipocontaaux" value="${obj.informacaoBancaria.tipoconta}">
<div class="row-input" role="row">
	<div class="w-50" role="separator">
		<label class="align-left"><fmt:message key="label.nome.titular"/></label>
		<input class="input-form" maxlength="60" name="obj.informacaoBancaria.nometitular" pattern="letraEspaco" type="text" value="${obj.informacaoBancaria.nometitular}">
		<netsis:validationMessage name="obj.informacaoBancaria.nometitular"/>
	</div>
	<div class="w-50" role="separator">
		<label class="align-left"><fmt:message key="label.nome.banco"/></label>
		<select class="select-form full-select" data-class="slCadBanco" id="slBanco_json_01" name="obj.informacaoBancaria.nomebanco"></select>
		<netsis:validationMessage name="obj.informacaoBancaria.nomebanco"/>
	</div>
</div>
<div class="row-input" role="row">
	<div class="w-34" role="separator">
		<label class="align-left"><fmt:message key="label.agencia"/></label>
		<input class="input-form" maxlength="10" name="obj.informacaoBancaria.agencia" pattern="letraNumeroEspacoPontoTraco" type="text" value="${obj.informacaoBancaria.agencia}">
		<netsis:validationMessage name="obj.informacaoBancaria.agencia"/>
	</div>
	<div class="w-33" role="separator">
		<label class="align-left"><fmt:message key="label.conta"/></label>
		<input class="input-form" maxlength="10" name="obj.informacaoBancaria.conta" pattern="letraNumeroEspacoPontoTraco" type="text" value="${obj.informacaoBancaria.conta}">
		<netsis:validationMessage name="obj.informacaoBancaria.conta"/>
	</div>
	<div class="w-33" role="separator">
		<label class="align-left"><fmt:message key="label.tipo.conta"/></label>
		<select class="select-form full-select" data-class="slSysTipoConta" id="slTipo-de-conta-bancaria_json_1" name="obj.informacaoBancaria.tipoconta"></select>
		<netsis:validationMessage name="obj.informacaoBancaria.tipoconta"/>
	</div>
</div>