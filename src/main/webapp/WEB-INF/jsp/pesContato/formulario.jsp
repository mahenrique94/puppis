<%@include file="/config/taglibraries.jsp" %>
<%@include file="/config/libraries-style.jsp"%>
<div class="container-tie">
	<form action="<c:url value="/pessoa/contato"/>" class="form-block" id="formpescontato" method="post" name="formpescontat" onsubmit="return enviarPost(this);" role="form">
		<input name="obj.id" type="hidden" value="${obj.id}">
		<input name="obj.idpessoa.id" type="hidden" value="${obj.idpessoa.id}">
		<div class="container-header">
			<div class="row">
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
					<h2><fmt:message key="nav.cadastro"/>&nbsp;<fmt:message key="label.barra"/>&nbsp;<fmt:message key="nav.cadastro.pessoa"/>&nbsp;<fmt:message key="label.barra"/>&nbsp;<fmt:message key="nav.cadastro.pessoa.contato"/></h2>
				</div>
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
					<button class="btn-md float-left m-right-5" title="<fmt:message key="button.salvar"/>" type="submit"><span class="icon-floppy-disk"></span>&nbsp;<fmt:message key="button.salvar"/></button>
				</div>
			</div>
		</div>
		<section aria-expanded="true" aria-hidden="false" class="clearfix" role="form">
			<div class="row" role="row">
				<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4" role="separator">
					<label><fmt:message key="label.ddd"/></label>
					<input class="input-form" maxlength="2" name="obj.ddd" type="number" value="${obj.ddd}">
					<netsis:validationMessage name="obj.ddd"/>
				</div>
				<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4" role="separator">
					<label><fmt:message key="label.celular"/></label>
					<input class="input-form" maxlength="11" name="obj.celular" pattern="celular" type="text" value="${obj.celular}">
					<netsis:validationMessage name="obj.celular"/>
				</div>
				<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4" role="separator">
					<label><fmt:message key="label.telefone"/></label>
					<input class="input-form" maxlength="9" name="obj.telefone" pattern="telefone" type="text" value="${obj.telefone}">
					<netsis:validationMessage name="obj.telefone"/>
				</div>
			</div>
			<div class="row" role="row">
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" role="separator">
					<label><fmt:message key="label.email"/></label>
					<input class="input-form" maxlength="255" name="obj.email" type="email" value="${obj.email}">
					<netsis:validationMessage name="obj.email"/>
				</div>
			</div>
		</section>
	</form>
</div>
<%@include file="/config/libraries-js.jsp"%>