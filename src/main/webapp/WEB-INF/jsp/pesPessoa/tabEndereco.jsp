<%@include file="/config/taglibraries.jsp"%>
<input type="hidden" name="obj.endereco.id" value="${obj.endereco.id}">
<input type="hidden" name="obj.endereco.idpessoa.id" value="${obj.endereco.idpessoa.id}">
<input type="hidden" name="obj.endereco.idestado.idaux" value="${obj.endereco.idestado.id}">
<input type="hidden" name="obj.endereco.idcidade.idaux" value="${obj.endereco.idcidade.id}">
<input type="hidden" name="obj.endereco.idpais.idaux" value="${obj.endereco.idpais.id}">
<div class="row-input" role="row">
	<div class="w-20" role="separator">
		<label class="align-left"><fmt:message key="label.cep"/></label>
		<input class="input-form" maxlength="12" name="obj.endereco.cep" pattern="cep" required type="text" value="${obj.endereco.cep}">
		<netsis:validationMessage name="obj.endereco.cep"/>
	</div>
	<div class="w-60" role="separator">
		<label class="align-left"><fmt:message key="label.rua"/></label>
		<input class="input-form" maxlength="60" name="obj.endereco.rua" pattern="letraNumeroEspaco" required type="text" value="${obj.endereco.rua}">
		<netsis:validationMessage name="obj.endereco.rua"/>
	</div>
	<div class="w-20" role="separator">
		<label class="align-left"><fmt:message key="label.numero"/></label>
		<input class="input-form full" maxlength="12" name="obj.endereco.numero" pattern="numeroEndereco" required type="text" value="${obj.endereco.numero}">
		<netsis:validationMessage name="obj.endereco.numero"/>
	</div>
</div>
<div class="row-input" role="row">
	<div class="w-100" role="separator">
		<label class="align-left"><fmt:message key="label.bairro"/></label>
		<input class="input-form full" maxlength="60" name="obj.endereco.bairro" pattern="letraEspaco" required type="text" value="${obj.endereco.bairro}">
		<netsis:validationMessage name="obj.endereco.bairro"/>
	</div>
</div>
<div class="row-input" role="row">
	<div class="w-20" role="separator">
		<label class="align-left"><fmt:message key="label.uf"/></label>
		<select class="select-form" data-class="slCadEstado" id="slCadastro_Estado_json_01" name="obj.endereco.idestado.id" required></select>
		<netsis:validationMessage name="obj.endereco.idestado.id"/>
	</div>
	<div class="w-40" role="separator">
		<label class="align-left"><fmt:message key="label.cidade"/></label>
		<select class="select-form" data-class="slCadCidade" id="slCadastro_Cidade_json_01" name="obj.endereco.idcidade.id" required></select>
		<netsis:validationMessage name="obj.enderecoid.idcidade.id"/>
	</div>
	<div class="w-40" role="separator">
		<label class="align-left"><fmt:message key="label.complemento"/></label>
		<input class="input-form full" maxlength="30" name="obj.endereco.complemento" pattern="letraEspaco" type="text" value="${obj.endereco.complemento}">
		<netsis:validationMessage name="obj.endereco.complemento"/>
	</div>
</div>
<div class="row" role="row">
	<div class="w-100" role="separator">
		<label class="align-left"><fmt:message key="label.pais"/></label>
		<select class="select-form" data-class="slCadPais" id="slCadastro_Pais_json_01" name="obj.endereco.idpais.id" required></select>
		<netsis:validationMessage name="obj.endereco.idpais.id"/>
	</div>
</div>