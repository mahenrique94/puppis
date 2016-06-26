<%@include file="/config/taglibraries.jsp"%>
<input type="hidden" name="obj.endereco.id" value="${obj.endereco.id}">
<input type="hidden" name="obj.endereco.idcomercio.id" value="${obj.endereco.idcomercio.id}">
<input type="hidden" name="obj.endereco.idestado.idaux" value="${obj.endereco.idestado.id}">
<input type="hidden" name="obj.endereco.idcidade.idaux" value="${obj.endereco.idcidade.id}">
<input type="hidden" name="obj.endereco.idpais.idaux" value="${obj.endereco.idpais.id}">
<span class="band-lube" role="separator"><label><fmt:message key="titulo.endereco"/></label></span>
<div class="row" role="row">
	<div class="col-xs-2 col-sm-2 col-md-2 col-lg-2" role="separator">
		<label><fmt:message key="label.cep"/></label>
		<input class="form-data validate" maxlength="9" name="obj.endereco.cep" onkeypress="format(this, event, cep);" pattern="cep" required type="text" value="${obj.endereco.cep}">
		<netsis:validationMessage name="obj.endereco.cep"/>
	</div>
	<div class="col-xs-10 col-sm-10 col-md-10 col-lg-10" role="separator">
		<label><fmt:message key="label.rua"/></label>
		<input class="form-data validate" maxlength="60" name="obj.endereco.rua" pattern="letraNumeroEspaco" required type="text" value="${obj.endereco.rua}">
		<netsis:validationMessage name="obj.endereco.rua"/>
	</div>
</div>
<div class="row" role="row">
	<div class="col-xs-2 col-sm-2 col-md-2 col-lg-2" role="separator">
		<label><fmt:message key="label.numero"/></label>
		<input class="form-data validate" maxlength="12" name="obj.endereco.numero" pattern="numeroEndereco" required type="text" value="${obj.endereco.numero}">
		<netsis:validationMessage name="obj.endereco.numero"/>
	</div>
	<div class="col-xs-10 col-sm-10 col-md-10 col-lg-10" role="separator">
		<label><fmt:message key="label.bairro"/></label>
		<input class="form-data validate" maxlength="60" name="obj.endereco.bairro" pattern="letraEspaco" required type="text" value="${obj.endereco.bairro}">
		<netsis:validationMessage name="obj.endereco.bairro"/>
	</div>
</div>
<div class="row" role="row">
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" role="separator">
		<label><fmt:message key="label.complemento"/></label>
		<input class="form-data validate" maxlength="30" name="obj.endereco.complemento" pattern="letraEspaco" type="text" value="${obj.endereco.complemento}">
		<netsis:validationMessage name="obj.endereco.complemento"/>
	</div>
</div>
<div class="row" role="row">
	<div class="col-xs-2 col-sm-2 col-md-2 col-lg-2" role="separator">
		<label><fmt:message key="label.uf"/></label>
		<select class="form-data validate" data-class="slCadEstado" id="slCadastro_Estado_json_01" name="obj.endereco.idestado.id" required></select>
		<netsis:validationMessage name="obj.endereco.uf"/>
	</div>
	<div class="col-xs-10 col-sm-10 col-md-10 col-lg-10" role="separator">
		<label><fmt:message key="label.cidade"/></label>
		<select class="form-data ss validate" data-class="slCadCidade" id="slCadastro_Cidade_json_01" name="obj.endereco.idcidade.id" required></select>
		<netsis:validationMessage name="obj.endereco.cidade"/>
	</div>
</div>
<div class="row" role="row">
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" role="separator">
		<label><fmt:message key="label.pais"/></label>
		<select class="form-data validate" data-class="slCadPais" id="slCadastro_Pais_json_01" name="obj.endereco.idpais.id" required></select>
		<netsis:validationMessage name="obj.endereco.pais"/>
	</div>
</div>