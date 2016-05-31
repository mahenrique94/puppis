<%@include file="/config/taglibraries.jsp"%>
<input name="obj.documento.id" type="hidden" value="${obj.documento.id}">
<input name="obj.documento.idpessoa.id" type="hidden" value="${obj.documento.idpessoa.id}">
<fieldset class="block-lube m-bottom-15">
	<legend class="block-header"><label class="block-title"><i class="font-5x icon-vcard"></i>&nbsp;<fmt:message key="titulo.documento"/></label></legend>
	<section class="block-body block-body-padding">
		<div class="row" role="row">
			<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6" role="separator">
				<label><fmt:message key="label.cpf.cnpj"/></label>
				<input class="form-data validate" maxlength="18" name="obj.documento.cpfcnpj" pattern="cpfCnpj" required type="text" value="${obj.documento.cpfcnpj}">
				<netsis:validationMessage name="obj.documento.cpfcnpj"/>
			</div>
			<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6" role="separator">
				<label><fmt:message key="label.rg.inscricao.estadual"/></label>
				<input class="form-data validate" maxlength="15" name="obj.documento.rginscricaoestadual" pattern="rgInscricao" required type="text" value="${obj.documento.rginscricaoestadual}">
				<netsis:validationMessage name="obj.documento.rginscricaoestadual"/>
			</div>
		</div>
		<div class="row" role="row">
			<div class="col-xs-6 col-sm-6 col-md-6 col-6" role="separator">
				<label><fmt:message key="label.cnh"/></label>
				<input class="form-data validate" name="obj.documento.cnh" type="text" value="${obj.documento.cnh}">
				<netsis:validationMessage name="obj.documento.cnh"/>
			</div>
			<div class="col-xs-2 col-sm-2 col-md-2 col-2" role="separator">
				<label><fmt:message key="label.tipo"/></label>
				<input class="form-data validate" name="obj.documento.tipocnh" pattern="tipoCnh" type="text" value="${obj.documento.tipocnh}">
				<netsis:validationMessage name="obj.documento.tipocnh"/>
			</div>
			<div class="col-xs-2 col-sm-2 col-md-2 col-2" role="separator">
				<label><fmt:message key="label.data.expedicao"/></label>
				<input class="form-data validate" name="obj.documento.dataexpedicaocnh" pattern="data" type="text" value="<fmt:formatDate pattern="dd/MM/yyyy" type="date" value="${obj.documento.dataexpedicaocnh.time}"/>">
				<netsis:validationMessage name="obj.documento.dataexpedicaocnh"/>
			</div>
			<div class="col-xs-2 col-sm-2 col-md-2 col-2" role="separator">
				<label><fmt:message key="label.data.vencimento"/></label>
				<input class="form-data validate" name="obj.documento.datavencimentocnh" pattern="data" type="text" value="<fmt:formatDate pattern="dd/MM/yyyy" type="date" value="${obj.documento.datavencimentocnh.time}"/>">
				<netsis:validationMessage name="obj.documento.datavencimentocnh"/>
			</div>
		</div>
		<div class="row" role="row">
			<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4" role="separator">
				<label><fmt:message key="label.ctps"/></label>
				<input class="form-data validate" name="obj.documento.ctps" type="text" value="${obj.documento.ctps}">
				<netsis:validationMessage name="obj.documento.ctps"/>
			</div>
			<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4" role="separator">
				<label><fmt:message key="label.serie"/></label>
				<input class="form-data validate" name="obj.documento.seriectps" type="text" value="${obj.documento.seriectps}">
				<netsis:validationMessage name="obj.documento.seriectps"/>
			</div>
			<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4" role="separator">
				<label><fmt:message key="label.pis"/></label>
				<input class="form-data validate" name="obj.documento.pis" pattern="pis" type="text" value="${obj.documento.pis}">
				<netsis:validationMessage name="obj.documento.pis"/>
			</div>
		</div>
	</section>
</fieldset>