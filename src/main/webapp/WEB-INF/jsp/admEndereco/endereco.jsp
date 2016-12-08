<%@include file="/config/taglibraries.jsp"%>
<input name="obj.endereco.id" type="hidden" value="${obj.endereco.id}">
<input name="obj.endereco.idcomercio.id" type="hidden" value="${obj.endereco.idcomercio.id}">
<input name="obj.endereco.idcidade.idaux" type="hidden" value="${obj.endereco.idcidade.id}">
<input name="obj.endereco.idcidade.idestado.idaux" type="hidden" value="${obj.endereco.idcidade.idestado.id}">
<input name="obj.endereco.idcidade.idestado.idpais.idaux" type="hidden" value="${obj.endereco.idcidade.idestado.idpais.id}">
<span class="band-lube" role="separator"><label><fmt:message key="titulo.endereco"/></label></span>
<div class="row" role="row">
	<div class="col-xs-2 col-sm-2 col-md-2 col-lg-2" role="separator">
		<label><fmt:message key="label.cep"/></label>
		<div class="form-data-group">
			<input class="form-data validate" data-cep="cep" maxlength="9" name="obj.endereco.cep" onkeypress="format(this, event, maskCEP);" pattern="cep" required type="text" value="${obj.endereco.cep}">
			<span class="form-data-group-btn"><button class="btn-default" onclick="buscaCep(this);" type="button"><i class="icon-globe"></i></button></span>
		</div>
		<netsis:validationMessage name="obj.endereco.cep"/>
	</div>
	<div class="col-xs-8 col-sm-8 col-md-8 col-lg-8" role="separator">
		<label><fmt:message key="label.rua"/></label>
		<input class="form-data validate" data-cep="logradouro" maxlength="60" name="obj.endereco.rua" pattern="letraNumeroEspaco" required type="text" value="${obj.endereco.rua}">
		<netsis:validationMessage name="obj.endereco.rua"/>
	</div>
	<div class="col-xs-2 col-sm-2 col-md-2 col-lg-2" role="separator">
		<label><fmt:message key="label.numero"/></label>
		<input class="form-data validate" maxlength="12" name="obj.endereco.numero" pattern="numeroEndereco" required type="text" value="${obj.endereco.numero}">
		<netsis:validationMessage name="obj.endereco.numero"/>
	</div>
</div>
<div class="row" role="row">
	<div class="col-xs-8 col-sm-8 col-md-8 col-lg-8" role="separator">
		<label><fmt:message key="label.bairro"/></label>
		<input class="form-data validate" data-cep="bairro" maxlength="60" name="obj.endereco.bairro" pattern="letraEspaco" required type="text" value="${obj.endereco.bairro}">
		<netsis:validationMessage name="obj.endereco.bairro"/>
	</div>
	<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4" role="separator">
		<label><fmt:message key="label.complemento"/></label>
		<input class="form-data validate" data-cep="complemento" maxlength="30" name="obj.endereco.complemento" pattern="letraNumeroEspacoPontoTracoBarra" type="text" value="${obj.endereco.complemento}">
		<netsis:validationMessage name="obj.endereco.complemento"/>
	</div>
</div>
<div class="row" role="row">
	<div class="col-xs-2 col-sm-2 col-md-2 col-lg-2" role="separator">
		<label><fmt:message key="label.uf"/></label>
		<select class="form-data validate" data-cep="estado" data-class="slCadEstado" id="slCadastro_Estado_json_01" name="obj.endereco.idcidade.idestado.id" required></select>
		<netsis:validationMessage name="obj.endereco.idcidade.idestado.id"/>
	</div>
	<div class="col-xs-10 col-sm-10 col-md-10 col-lg-10" role="separator">
		<label class="align-left"><fmt:message key="label.cidade"/></label>
		<select class="form-data validate" data-cep="cidade" data-class="slCadCidade" id="slCadastro_Cidade_json_01" name="obj.endereco.idcidade.id" required></select>
		<netsis:validationMessage name="obj.endereco.idcidade.id"/>
	</div>
</div>
<div class="row" role="row">
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" role="separator">
		<label><fmt:message key="label.pais"/></label>
		<select class="form-data validate" data-class="slCadPais" id="slCadastro_Pais_json_01" name="obj.endereco.idcidade.idestado.idpais.id" required></select>
		<netsis:validationMessage name="obj.endereco.idcidade.idestado.idpais.id"/>
	</div>
</div>