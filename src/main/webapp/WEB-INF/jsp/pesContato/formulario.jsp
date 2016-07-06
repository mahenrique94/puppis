<%@include file="/config/taglibraries.jsp" %>
<%@include file="/config/libraries-style.jsp"%>
<form action="<c:url value="/pessoa/contato"/>" class="form-modern" id="formpescontato" method="post" name="formpescontato" onsubmit="return enviarPost(this);" role="form">
	<input name="obj.id" type="hidden" value="${obj.id}">
	<input name="obj.idpessoa.id" type="hidden" value="${obj.idpessoa.id}">
	<nav class="band-nav-lube" role="complementary">
		<div class="row" role="row">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" role="separator">
				<label><fmt:message key="nav.cadastro.pessoa.contato"/></label>					
			</div>
		</div>
	</nav>
	<section aria-expanded="true" aria-hidden="false" class="form-body" role="form">
		<div class="row" role="row">
			<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4" role="separator">
				<label><fmt:message key="label.ddd"/></label>
				<input class="form-data validate" maxlength="2" name="obj.ddd" type="number" value="${obj.ddd}">
				<netsis:validationMessage name="obj.ddd"/>
			</div>
			<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4" role="separator">
				<label><fmt:message key="label.celular"/></label>
				<input class="form-data validate" maxlength="11" name="obj.celular" onkeypress="format(this, event, celular);" pattern="celular" type="text" value="${obj.celular}">
				<netsis:validationMessage name="obj.celular"/>
			</div>
			<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4" role="separator">
				<label><fmt:message key="label.telefone"/></label>
				<input class="form-data validate" maxlength="9" name="obj.telefone" onkeypress="format(this, event, telefone);" pattern="telefone" type="text" value="${obj.telefone}">
				<netsis:validationMessage name="obj.telefone"/>
			</div>
		</div>
		<div class="row" role="row">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" role="separator">
				<label><fmt:message key="label.email"/></label>
				<input class="form-data validate" maxlength="255" name="obj.email" type="email" value="${obj.email}">
				<netsis:validationMessage name="obj.email"/>
			</div>
		</div>
	</section>
	<nav class="nav-group-tie nav-fixed-bottom" role="complementary">
		<ul>
			<li><button title="<fmt:message key="button.salvar"/>" type="submit"><i class="icon-floppy"></i>&nbsp;<fmt:message key="button.salvar"/></button></li>
		</ul>
	</nav>
</form>
<%@include file="/config/libraries-js.jsp"%>