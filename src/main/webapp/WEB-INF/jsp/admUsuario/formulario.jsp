<%@include file="/config/header.jsp" %>
<fieldset class="block-lube">
	<legend class="block-header">
		<h1 class="block-title"><label><fmt:message key="nav.sistema"/>&nbsp;<fmt:message key="label.barra"/>&nbsp;<fmt:message key="nav.sistema.usuario"/></label></h1>
	</legend>
	<form action="<c:url value="/usuario"/>" class="form-inline" id="formlistaradmusuario" method="post" name="formlistaradmusuario" role="form">
		<input type="hidden" name="obj.id" value="${obj.id}">
		<input type="hidden" name="obj.idtipoacesso.idaux" value="${obj.idtipoacesso.id}">
		<nav class="clearfix nav-block" role="navigation">
			<div class="w-100">
				<button class="btn-md float-left m-right-5" title="<fmt:message key="button.salvar"/>" type="submit"><span class="icon-floppy-disk"></span>&nbsp;<fmt:message key="button.salvar"/></button>
				<a href="<c:url value="/usuario"/>" class="btn-md float-left m-right-5" title="<fmt:message key="button.pesquisar"/>"><span class="icon-search"></span>&nbsp;<fmt:message key="button.pesquisar"/></a>
			</div>
		</nav>
		<section aria-expanded="true" aria-hidden="false" class="block-body clearfix" role="form">
			<div class="row-input" role="row">
				<div class="w-100" role="separator">
					<label class="align-left"><fmt:message key="label.nome"/></label>
					<input autofocus class="input-form full" maxlength="60" name="obj.nome" pattern="letraNumeroEspaco" required type="text" value="${obj.nome}">
					<netsis:validationMessage name="obj.nome"/>
				</div>
			</div>
			<div class="row-input" role="row">
				<div class="w-50" role="separator">
					<label class="align-left"><fmt:message key="label.usuario"/></label>
					<input class="input-form" maxlength="20" name="obj.usuario" pattern="letraNumeroEspaco" required type="text" value="${obj.usuario}">
					<netsis:validationMessage name="obj.usuario"/>
				</div>
				<div class="w-50" role="separator">
					<label class="align-left"><fmt:message key="label.senha"/></label>
					<input class="input-form full" maxlength="8" name="obj.senha" pattern="letraNumeroMin8Max8" required type="password" value="${obj.senha}">
					<netsis:validationMessage name="obj.senha"/>
				</div>
			</div>
			<div class="row-input" role="row">
				<div class="w-100" role="separator">
					<label class="align-left"><fmt:message key="label.tipo.acesso"/></label>
					<select class="select-form full-select" data-class="slAdmTipoAcesso" id="slTipo-de-acesso_json_01" name="obj.idtipoacesso.id"></select>
					<netsis:validationMessage name="obj.idtipoacesso.id"/>
				</div>
			</div>
			<div class="row-input" role="row">
				<div class="w-100" role="separator">
					<label class="align-left"><fmt:message key="label.inativo"/></label>
					<input <c:if test="${obj.inativo.equals('T')}">checked="checked"</c:if> name="obj.inativo" type="checkbox" value="T">
				</div>
			</div>
		</section>
	</form>
</fieldset>
<%@include file="/config/footer.jsp"%>