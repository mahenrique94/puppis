<%@include file="/config/taglibraries.jsp"%>
<input aria-hidden="true" name="obj.endereco.id" type="hidden" value="${obj.endereco.id}">
<input aria-hidden="true" name="obj.endereco.idcidade.idaux" type="hidden" value="${obj.endereco.idcidade.id}">
<input aria-hidden="true" name="obj.endereco.idcidade.idestado.idaux" type="hidden" value="${obj.endereco.idcidade.idestado.id}">
<input aria-hidden="true" name="obj.endereco.idcidade.idestado.idpais.idaux" type="hidden" value="${obj.endereco.idcidade.idestado.idpais.id}">
<fieldset class="c-block--lube" style="margin-bottom: 1rem;">
	<legend class="c-block__header"><label class="c-block__title"><i class="icon-location"></i>&nbsp;<fmt:message key="titulo.endereco"/></label></legend>
	<section class="c-block__body c-block__body--padding">
		<div class="l-row" role="row">
			<div class="u-grid--2" role="grid">
				<label class="o-form__text" for="cep"><fmt:message key="label.cep"/><validate:validationMessage name="obj.endereco.cep"/></label>
				<div class="o-form__group">
					<input aria-required="true" class="o-form__data has-validation" data-cep="cep" id="cep" maxlength="9" name="obj.endereco.cep" onkeypress="checkMask(event);" onkeyup="mask(maskCep, this, event);" pattern="cep" required type="text" value="${obj.endereco.cep}">
					<span class="o-form__groupElement"><button class="o-button--lube" onclick="findCep(this);" role="button" title="<fmt:message key="button.pesquisar"/>" type="button"><i class="icon-globe"></i></button></span>
				</div>
			</div>
			<div class="u-grid--8" role="grid">
				<label class="o-form__text" for="logradouro"><fmt:message key="label.logradouro"/><validate:validationMessage name="obj.endereco.logradouro"/></label>
				<input aria-required="true" class="o-form__data has-validation" id="logradouro" data-cep="logradouro" maxlength="60" name="obj.endereco.logradouro" pattern="espacoLetraNumero" required type="text" value="${obj.endereco.logradouro}">
			</div>
			<div class="u-grid--2" role="grid">
				<label class="o-form__text" for="numero"><fmt:message key="label.numero"/><validate:validationMessage name="obj.endereco.numero"/></label>
				<input aria-required="true" class="o-form__data has-validation" data-cep="numero" id="numero" maxlength="12" name="obj.endereco.numero" pattern="numeroEndereco" required type="text" value="${obj.endereco.numero}">
			</div>
		</div>
		<div class="l-row" role="row">
			<div class="u-grid--8" role="grid">
				<label class="o-form__text" for="bairro"><fmt:message key="label.bairro"/><validate:validationMessage name="obj.endereco.bairro"/></label>
				<input aria-required="true" class="o-form__data has-validation" data-cep="bairro" id="bairro" maxlength="60" name="obj.endereco.bairro" pattern="espacoLetra" required type="text" value="${obj.endereco.bairro}">
			</div>
			<div class="u-grid--4" role="grid">
				<label class="o-form__text" for="complemento"><fmt:message key="label.complemento"/><validate:validationMessage name="obj.endereco.complemento"/></label>
				<input class="o-form__data has-validation" data-cep="complemento" id="complemento" maxlength="30" name="obj.endereco.complemento" pattern="espacoLetraNumeroBarraPontoTraco" type="text" value="${obj.endereco.complemento}">
			</div>
		</div>
		<div class="l-row" role="row">
			<div class="u-grid--2" role="grid">
				<label class="o-form__text" for="estado"><fmt:message key="label.uf"/><validate:validationMessage name="obj.endereco.idcidade.idestado.id"/></label>
				<select aria-required="true" class="o-form__data has-validation" data-cep="estado" data-change="slCadCidade" data-select="slCadEstado" data-url="slCadastro_Estado_Json" id="estado" name="obj.endereco.idcidade.idestado.id" required></select>
			</div>
			<div class="u-grid--10" role="grid">
				<label class="o-form__text" for="cidade"><fmt:message key="label.cidade"/><validate:validationMessage name="obj.endereco.idcidade.id"/></label>
				<select aria-required="true" class="o-form__data has-validation ss-search" data-cep="cidade" data-changed data-parameters-fields="[idestado.id]" data-parameters-values="[slCadEstado]" data-select="slCadCidade" data-url="slCadastro_Cidade_Json" id="cidade" name="obj.endereco.idcidade.id" required></select>
			</div>
		</div>
		<div class="l-row" role="row">
			<div class="u-grid--12" role="grid">
				<label class="o-form__text" for="pais"><fmt:message key="label.pais"/><validate:validationMessage name="obj.endereco.idcidade.idestado.idpais.id"/></label>
				<select class="o-form__data has-validation" data-cep="pais" data-select="slCadPais" data-url="slCadastro_Pais_Json" id="pais" name="obj.endereco.idcidade.idestado.idpais.id"></select>
			</div>
		</div>
	</section>
</fieldset>