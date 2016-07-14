<%@include file="/config/taglibraries.jsp"%>
<input type="hidden" name="obj.contato.id" value="${obj.contato.id}">
<input type="hidden" name="obj.contato.idcomercio.id" value="${obj.contato.idcomercio.id}">
<div class="row" role="row">
	<div class="col-xs-2 col-sm-2 col-md-2 col-lg-2" role="separator">
		<label class="align-left"><fmt:message key="label.ddd"/></label>
		<input class="form-data validate" maxlength="2" min="0" name="obj.contato.ddd" pattern="ddd" type="number" value="${obj.contato.ddd}">
		<netsis:validationMessage name="obj.contato.ddd"/>
	</div>
	<div class="col-xs-5 col-sm-5 col-md-5 col-lg-5" role="separator">
		<label class="align-left"><fmt:message key="label.telefone"/></label>
		<input class="form-data validate" maxlength="9" name="obj.contato.telefone" onkeypress="format(this, event, telefoneMask);" pattern="telefone" type="text" value="${obj.contato.telefone}">
		<netsis:validationMessage name="obj.contato.telefone"/>
	</div>
	<div class="col-xs-5 col-sm-5 col-md-5 col-lg-5" role="separator">
		<label class="align-left"><fmt:message key="label.celular"/></label>
		<input class="form-data validate" maxlength="11" name="obj.contato.celular" onkeypress="format(this, event, celularMask);" pattern="celular" type="text" value="${obj.contato.celular}">
		<netsis:validationMessage name="obj.contato.celular"/>
	</div>
</div>
<div class="row" role="row">	
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" role="separator">
		<label class="align-left"><fmt:message key="label.email"/></label>
		<input class="form-data validate" maxlength="255" name="obj.contato.email" type="email" value="${obj.contato.email}">
		<netsis:validationMessage name="obj.contato.email"/>
	</div>
</div>