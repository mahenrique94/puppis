<%@include file="/config/taglibraries.jsp"%>
<input type="hidden" name="obj.documento.id" value="${obj.documento.id}">
<input type="hidden" name="obj.documento.idpessoa.id" value="${obj.documento.idpessoa.id}">
<input type="hidden" name="obj.endereco.ufaux" value="${obj.endereco.uf}">
<div class="row-input" role="row">
	<div class="w-50" role="separator">
		<label class="align-left"><fmt:message key="label.cpf.cnpj"/></label>
		<input class="input-form" maxlength="18" name="obj.documento.cpfcnpj" pattern="cpfCnpj" required type="text" value="${obj.documento.cpfcnpj}">
		<netsis:validationMessage name="obj.documento.cpfcnpj"/>
	</div>
	<div class="w-50" role="separator">
		<label class="align-left"><fmt:message key="label.rg.inscricao.estadual"/></label>
		<input class="input-form full" maxlength="15" name="obj.documento.rginscricaoestadual" pattern="rgInscricao" required type="text" value="${obj.documento.rginscricaoestadual}">
		<netsis:validationMessage name="obj.documento.rginscricaoestadual"/>
	</div>
</div>
<div class="row-input" role="row">
	<div class="w-100" role="separator">
		<label class="align-left"><fmt:message key="label.cnh"/></label>
		<input class="input-form full" name="obj.documento.cnh" type="text" value="${obj.documento.cnh}">
		<netsis:validationMessage name="obj.documento.cnh"/>
	</div>
</div>
<div class="row-input" role="row">
	<div class="w-34" role="separator">
		<label class="align-left"><fmt:message key="label.ctps"/></label>
		<input class="input-form" name="obj.documento.ctps" type="text" value="${obj.documento.ctps}">
		<netsis:validationMessage name="obj.documento.ctps"/>
	</div>
	<div class="w-33" role="separator">
		<label class="align-left"><fmt:message key="label.serie"/></label>
		<input class="input-form" name="obj.documento.serie" type="text" value="${obj.documento.serie}">
		<netsis:validationMessage name="obj.documento.serie"/>
	</div>
	<div class="w-33" role="separator">
		<label class="align-left"><fmt:message key="label.pis"/></label>
		<input class="input-form full" name="obj.documento.pis" pattern="pis" type="text" value="${obj.documento.pis}">
		<netsis:validationMessage name="obj.documento.pis"/>
	</div>
</div>