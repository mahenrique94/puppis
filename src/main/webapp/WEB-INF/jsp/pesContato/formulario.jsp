<%@include file="/config/taglibraries.jsp"%>
<%@include file="/config/libraries-style.jsp"%>
<fieldset class="block-lube no-border w-100">
	<legend class="block-header">
		<h1 class="block-title"><label><fmt:message key="nav.cadastro"/>&nbsp;<fmt:message key="label.barra"/>&nbsp;<fmt:message key="nav.cadastro.pessoa"/>&nbsp;<fmt:message key="label.barra"/>&nbsp;<fmt:message key="nav.cadastro.pessoa.contato"/></label></h1>
	</legend>
	<form action="<c:url value="/pessoa/contato"/>" class="form-inline" id="formlistarpescontato" method="post" name="formlistarpescontato" onsubmit="return enviarPost(this);" role="form">
		<input type="hidden" name="obj.id" value="${obj.id}">
		<input type="hidden" name="obj.idpessoa.id" value="${obj.idpessoa.id}">
		<nav class="clearfix nav-block" role="navigation">
			<div class="w-100">
				<button class="btn-md float-left m-right-5" title="<fmt:message key="button.salvar"/>" type="submit"><span class="icon-floppy-disk"></span>&nbsp;<fmt:message key="button.salvar"/></button>
			</div>
		</nav>
		<section aria-expanded="true" aria-hidden="false" class="block-body clearfix" role="form">
			<div class="row-input" role="row">
				<div class="w-34" role="separator">
					<label class="align-left"><fmt:message key="label.ddd"/></label>
					<input class="input-form" maxlength="2" name="obj.ddd" type="number" value="${obj.ddd}">
					<netsis:validationMessage name="obj.ddd"/>
				</div>
				<div class="w-33" role="separator">
					<label class="align-left"><fmt:message key="label.celular"/></label>
					<input class="input-form" maxlength="11" name="obj.celular" pattern="celular" type="text" value="${obj.celular}">
					<netsis:validationMessage name="obj.celular"/>
				</div>
				<div class="w-33" role="separator">
					<label class="align-left"><fmt:message key="label.telefone"/></label>
					<input class="input-form full-block-no-border" maxlength="9" name="obj.telefone" pattern="telefone" type="text" value="${obj.telefone}">
					<netsis:validationMessage name="obj.telefone"/>
				</div>
			</div>
			<div class="row-input" role="row">
				<div class="w-100" role="separator">
					<label class="align-left"><fmt:message key="label.email"/></label>
					<input class="input-form full-block-no-border" maxlength="255" name="obj.email" type="email" value="${obj.email}">
					<netsis:validationMessage name="obj.email"/>
				</div>
			</div>
		</section>
	</form>
</fieldset>
<%@include file="/config/libraries-js.jsp"%>