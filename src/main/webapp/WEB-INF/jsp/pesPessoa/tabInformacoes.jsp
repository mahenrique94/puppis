<%@include file="/config/taglibraries.jsp"%>
<input type="hidden" name="obj.informacao.id" value="${obj.informacao.id}">
<input type="hidden" name="obj.informacao.idpessoa.id" value="${obj.informacao.idpessoa.id}">
<input type="hidden" name="obj.informacao.tipocontratacaoaux" value="${obj.informacao.tipocontratacao}">
<input type="hidden" name="obj.informacao.nacionalidadeaux" value="${obj.informacao.nacionalidade}">
<input type="hidden" name="obj.informacao.nivelformacaoaux" value="${obj.informacao.nivelformacao}">
<input type="hidden" name="obj.informacao.especializacaoaux" value="${obj.informacao.especializacao}">
<input type="hidden" name="obj.informacao.setoraux" value="${obj.informacao.setor}">
<input type="hidden" name="obj.informacao.cargoaux" value="${obj.informacao.cargo}">
<input type="hidden" name="obj.informacao.tipofornecedoraux" value="${obj.informacao.tipofornecedor}">
<input type="hidden" name="obj.informacao.ramofornecedoraux" value="${obj.informacao.ramofornecedor}">
<input type="hidden" name="obj.informacao.nucleofornecedoraux" value="${obj.informacao.nucleofornecedor}">
<c:if test="${obj.tipo.id == 2}">
	<div class="row-input" role="row">
		<div class="w-34" role="separator">
			<label class="align-left"><fmt:message key="label.tipo.fornecedor"/></label>
			<select class="select-form" data-class="slSysTipoFornecedor" id="slTipo-de-fornecedor_json_1" name="obj.informacao.tipofornecedor"></select>
			<netsis:validationMessage name="obj.informacao.tipofornecedor"/>
		</div>
		<div class="w-33" role="separator">
			<label class="align-left"><fmt:message key="label.ramo"/></label>
			<select class="select-form" data-class="slCadRamo" id="slRamo_json_1" name="obj.informacao.ramofornecedor"></select>
			<netsis:validationMessage name="obj.informacao.ramofornecedor"/>
		</div>
		<div class="w-33" role="separator">
			<label class="align-left"><fmt:message key="label.nucleo"/></label>
			<select class="select-form full-select" data-class="slCadNucleo" id="slNucleo_json_1" name="obj.informacao.nucleofornecedor"></select>
			<netsis:validationMessage name="obj.informacao.nucleofornecedor"/>
		</div>
	</div>
	<div class="row-input" role="row">
		<div class="w-50" role="separator">
			<label class="align-left"><fmt:message key="label.site"/></label>
			<input class="input-form" maxlength="255" name="obj.informacao.sitefornecedor" pattern="letraNumeroPonto" type="text" value="${obj.informacao.sitefornecedor}">
			<netsis:validationMessage name="obj.informacao.sitefornecedor"/>
		</div>
		<div class="w-50" role="separator">
			<label class="align-left"><fmt:message key="label.nome.vendedor"/></label>
			<input class="input-form full" maxlength="60" name="obj.informacao.nomevendedor" pattern="letraEspaco" type="text" value="${obj.informacao.nomevendedor}">
			<netsis:validationMessage name="obj.informacao.nomevendedor"/>
		</div>
	</div>
</c:if>
<c:if test="${obj.tipo.id == 3}">
	<div class="row-input" role="row">
		<div class="w-50" role="separator">
			<label class="align-left"><fmt:message key="label.tipo.contratacao"/></label>
			<select class="select-form" data-class="slSysTipoContratacao" id="slTipo-de-contratacao_json_1" name="obj.informacao.tipocontratacao"></select>
			<netsis:validationMessage name="obj.informacao.tipocontratacao"/>
		</div>
		<div class="w-50" role="separator">
			<label class="align-left"><fmt:message key="label.nacionalidade"/></label>
			<select class="select-form full-select" data-class="slSysNacionalidade" id="slNacionalidade_json_1" name="obj.informacao.nacionalidade"></select>
			<netsis:validationMessage name="obj.informacao.nacionalidade"/>
		</div>
	</div>
	<div class="row-input" role="row">
		<div class="w-50" role="separator">
			<label class="align-left"><fmt:message key="label.nivel.formacao"/></label>
			<select class="select-form" data-class="slSysNivelFormacao" id="slNivel-de-formacao_json_1" name="obj.informacao.nivelformacao"></select>
			<netsis:validationMessage name="obj.informacao.nivelformacao"/>
		</div>
		<div class="w-50" role="separator">
			<label class="align-left"><fmt:message key="label.especializacao"/></label>
			<select class="select-form full-select" data-class="slSysEspecializacao" id="slEspecializacao_json_1" name="obj.informacao.especializacao"></select>
			<netsis:validationMessage name="obj.informacao.especializacao"/>
		</div>
	</div>
	<div class="row-input" role="row">
		<div class="w-50" role="separator">
			<label class="align-left"><fmt:message key="label.setor"/></label>
			<select class="select-form" data-class="slCadSetor" id="slSetor_json_1" name="obj.informacao.setor"></select>
			<netsis:validationMessage name="obj.informacao.setor"/>
		</div>
		<div class="w-50" role="separator">
			<label class="align-left"><fmt:message key="label.cargo"/></label>
			<select class="select-form full-select" data-class="slCadCargo" id="slCargo_json_1" name="obj.informacao.cargo"></select>
			<netsis:validationMessage name="obj.informacao.especializacao"/>
		</div>
	</div>
	<div class="row-input" role="row">
		<div class="w-34" role="separator">
			<label class="align-left"><fmt:message key="label.data.nascimento"/></label>
			<input class="input-form" maxlength="10" name="obj.informacao.datanascimento" type="text" value="<fmt:formatDate pattern="dd/MM/yyyy" value="${obj.informacao.datanascimento.time}" type="date"/>">
			<netsis:validationMessage name="obj.informacao.datanascimento"/>
		</div>
		<div class="w-33" role="separator">
			<label class="align-left"><fmt:message key="label.data.admissao"/></label>
			<input class="input-form" maxlength="10" name="obj.informacao.dataadmissao" type="text" value="<fmt:formatDate pattern="dd/MM/yyyy" value="${obj.informacao.dataadmissao.time}" type="date"/>">
			<netsis:validationMessage name="obj.informacao.dataadmissao"/>
		</div>
		<div class="w-33" role="separator">
			<label class="align-left"><fmt:message key="label.data.demissao"/></label>
			<input class="input-form full" maxlength="10" name="obj.informacao.datademissao" type="text" value="<fmt:formatDate pattern="dd/MM/yyyy" value="${obj.informacao.datademissao.time}" type="date"/>">
			<netsis:validationMessage name="obj.informacao.datademissao"/>
		</div>
	</div>
</c:if>