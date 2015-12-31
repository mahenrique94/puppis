<%@include file="/config/taglibraries.jsp"%>
<input type="hidden" name="obj.documento.id" value="${obj.documento.id}">
<input type="hidden" name="obj.documento.idpessoa.id" value="${obj.documento.idpessoa.id}">
<div class="row" role="row">
	<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6" role="separator">
		<label><fmt:message key="label.cpf.cnpj"/></label>
		<input class="input-form" maxlength="18" name="obj.documento.cpfcnpj" pattern="cpfCnpj" required type="text" value="${obj.documento.cpfcnpj}">
		<netsis:validationMessage name="obj.documento.cpfcnpj"/>
	</div>
	<div class="col-xs-6-last col-sm-6-last col-md-6-last col-lg-6-last" role="separator">
		<label><fmt:message key="label.rg.inscricao.estadual"/></label>
		<input class="input-form" maxlength="15" name="obj.documento.rginscricaoestadual" pattern="rgInscricao" required type="text" value="${obj.documento.rginscricaoestadual}">
		<netsis:validationMessage name="obj.documento.rginscricaoestadual"/>
	</div>
</div>
<div class="row" role="row">
	<div class="col-xs-6 col-sm-6 col-md-6 col-6" role="separator">
		<label><fmt:message key="label.cnh"/></label>
		<input class="input-form" name="obj.documento.cnh" type="text" value="${obj.documento.cnh}">
		<netsis:validationMessage name="obj.documento.cnh"/>
	</div>
	<div class="col-xs-2 col-sm-2 col-md-2 col-2" role="separator">
		<label><fmt:message key="label.tipo"/></label>
		<input class="input-form" name="obj.documento.tipocnh" pattern="tipoCnh" type="text" value="${obj.documento.tipocnh}">
		<netsis:validationMessage name="obj.documento.tipocnh"/>
	</div>
	<div class="col-xs-2 col-sm-2 col-md-2 col-2" role="separator">
		<label><fmt:message key="label.data.expedicao"/></label>
		<input class="input-form" name="obj.documento.dataexpedicaocnh" pattern="data" type="text" value="<fmt:formatDate pattern="dd/MM/yyyy" type="date" value="${obj.documento.dataexpedicaocnh.time}"/>">
		<netsis:validationMessage name="obj.documento.dataexpedicaocnh"/>
	</div>
	<div class="col-xs-2-last col-sm-2-last col-md-2-last col-2-last" role="separator">
		<label><fmt:message key="label.data.vencimento"/></label>
		<input class="input-form" name="obj.documento.datavencimentocnh" pattern="data" type="text" value="<fmt:formatDate pattern="dd/MM/yyyy" type="date" value="${obj.documento.datavencimentocnh.time}"/>">
		<netsis:validationMessage name="obj.documento.datavencimentocnh"/>
	</div>
</div>
<div class="row" role="row">
	<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4" role="separator">
		<label><fmt:message key="label.ctps"/></label>
		<input class="input-form" name="obj.documento.ctps" type="text" value="${obj.documento.ctps}">
		<netsis:validationMessage name="obj.documento.ctps"/>
	</div>
	<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4" role="separator">
		<label><fmt:message key="label.serie"/></label>
		<input class="input-form" name="obj.documento.seriectps" type="text" value="${obj.documento.seriectps}">
		<netsis:validationMessage name="obj.documento.seriectps"/>
	</div>
	<div class="col-xs-4-last col-sm-4-last col-md-4-last col-lg-4-last" role="separator">
		<label><fmt:message key="label.pis"/></label>
		<input class="input-form" name="obj.documento.pis" pattern="pis" type="text" value="${obj.documento.pis}">
		<netsis:validationMessage name="obj.documento.pis"/>
	</div>
</div>