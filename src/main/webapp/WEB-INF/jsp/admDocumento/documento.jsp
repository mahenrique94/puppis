<%@include file="/config/taglibraries.jsp"%>
<input type="hidden" name="obj.documento.id" value="${obj.documento.id}">
<input type="hidden" name="obj.documento.idcomercio.id" value="${obj.documento.idcomercio.id}">
<div class="row" role="row">
	<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6" role="separator">
		<label><fmt:message key="label.cpf.cnpj"/></label>
		<input class="form-data validate" maxlength="18" name="obj.documento.cpfcnpj" pattern="cpfCnpj" required type="text" value="${obj.documento.cpfcnpj}">
		<netsis:validationMessage name="obj.documento.cnpj"/>
	</div>
	<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6" role="separator">
		<label><fmt:message key="label.inscricao.estadual"/></label>
		<input class="form-data validate" maxlength="15" name="obj.documento.rginscricaoestadual" pattern="rgInscricao" required type="text" value="${obj.documento.rginscricaoestadual}">
		<netsis:validationMessage name="obj.documento.inscricaoestadual"/>
	</div>
</div>