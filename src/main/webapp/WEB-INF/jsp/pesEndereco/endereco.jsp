<%@include file="/config/taglibraries.jsp"%>
<input name="obj.endereco.id" type="hidden" value="${obj.endereco.id}">
<input name="obj.endereco.idpessoa.id" type="hidden" value="${obj.endereco.idpessoa.id}">
<input name="obj.endereco.idestado.idaux" type="hidden" value="${obj.endereco.idestado.id}">
<input name="obj.endereco.idcidade.idaux" type="hidden" value="${obj.endereco.idcidade.id}">
<input name="obj.endereco.idpais.idaux" type="hidden" value="${obj.endereco.idpais.id}">
<fieldset class="block-lube m-bottom-15">
	<legend class="block-header"><label class="block-title"><i class="font-5x icon-location"></i>&nbsp;<fmt:message key="titulo.endereco"/></label></legend>
	<section class="block-body block-body-padding">
		<div class="row" role="row">
			<div class="col-xs-2 col-sm-2 col-md-2 col-lg-2" role="separator">
				<label><fmt:message key="label.cep"/></label>
				<input class="form-data validate" maxlength="9" name="obj.endereco.cep" onkeypress="format(this, event, cepMask);" pattern="cep" required type="text" value="${obj.endereco.cep}">
				<netsis:validationMessage name="obj.endereco.cep"/>
			</div>
			<div class="col-xs-8 col-sm-8 col-md-8 col-lg-8" role="separator">
				<label><fmt:message key="label.rua"/></label>
				<input class="form-data validate" maxlength="60" name="obj.endereco.rua" pattern="letraNumeroEspaco" required type="text" value="${obj.endereco.rua}">
				<netsis:validationMessage name="obj.endereco.rua"/>
			</div>
			<div class="col-xs-2 col-sm-2 col-md-2 col-lg-2" role="separator">
				<label><fmt:message key="label.numero"/></label>
				<input class="form-data validate" maxlength="12" name="obj.endereco.numero" pattern="numeroEndereco" required type="text" value="${obj.endereco.numero}">
				<netsis:validationMessage name="obj.endereco.numero"/>
			</div>
		</div>
		<div class="row" role="row">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" role="separator">
				<label><fmt:message key="label.bairro"/></label>
				<input class="form-data validate" maxlength="60" name="obj.endereco.bairro" pattern="letraEspaco" required type="text" value="${obj.endereco.bairro}">
				<netsis:validationMessage name="obj.endereco.bairro"/>
			</div>
		</div>
		<div class="row" role="row">
			<div class="col-xs-2 col-sm-2 col-md-2 col-lg-2" role="separator">
				<label><fmt:message key="label.uf"/></label>
				<select class="form-data validate" data-class="slCadEstado" id="slCadastro_Estado_json_01" name="obj.endereco.idestado.id" required></select>
				<netsis:validationMessage name="obj.endereco.idestado.id"/>
			</div>
			<div class="col-xs-5 col-sm-5 col-md-5 col-lg-5" role="separator">
				<label class="align-left"><fmt:message key="label.cidade"/></label>
				<select class="form-data ss validate" data-class="slCadCidade" id="slCadastro_Cidade_json_01" name="obj.endereco.idcidade.id" required></select>
				<netsis:validationMessage name="obj.enderecoid.idcidade.id"/>
			</div>
			<div class="col-xs-5 col-sm-5 col-md-5 col-lg-5" role="separator">
				<label><fmt:message key="label.complemento"/></label>
				<input class="form-data validate" maxlength="30" name="obj.endereco.complemento" pattern="letraEspaco" type="text" value="${obj.endereco.complemento}">
				<netsis:validationMessage name="obj.endereco.complemento"/>
			</div>
		</div>
		<div class="row" role="row">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" role="separator">
				<label><fmt:message key="label.pais"/></label>
				<select class="form-data validate" data-class="slCadPais" id="slCadastro_Pais_json_01" name="obj.endereco.idpais.id" required></select>
				<netsis:validationMessage name="obj.endereco.idpais.id"/>
			</div>
		</div>
	</section>
</fieldset>