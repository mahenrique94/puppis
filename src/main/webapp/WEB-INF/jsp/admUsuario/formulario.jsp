<%@include file="/config/header.jsp" %>
<div class="container-tie">
	<form action="<c:url value="/administrador/usuario"/>" class="form-block" id="formadmusuario" method="post" name="formadmusuario" role="form">
		<input name="obj.id" type="hidden" value="${obj.id}">
		<input name="obj.idgrupo.idaux" type="hidden" value="${obj.idgrupo.id}">
		<div class="container-header">
			<div class="row">
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
					<h2><fmt:message key="nav.sistema"/>&nbsp;<fmt:message key="label.barra"/>&nbsp;<fmt:message key="nav.sistema.usuario"/></h2>
				</div>
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
					<button class="btn-md float-left m-right-5" title="<fmt:message key="button.salvar"/>" type="submit"><span class="icon-floppy-disk"></span>&nbsp;<fmt:message key="button.salvar"/></button>
					<a href="<c:url value="/administrador/usuario"/>" class="btn-md float-left m-right-5" title="<fmt:message key="button.pesquisar"/>"><span class="icon-search"></span>&nbsp;<fmt:message key="button.pesquisar"/></a>
				</div>
			</div>
		</div>
		<section aria-expanded="true" aria-hidden="false" class="clearfix" role="form">
			<div class="row" role="row">
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" role="separator">
					<label><fmt:message key="label.nome"/></label>
					<input autofocus class="input-form" maxlength="60" name="obj.nome" pattern="letraNumeroEspaco" required type="text" value="${obj.nome}">
					<netsis:validationMessage name="obj.nome"/>
				</div>
			</div>
			<div class="row" role="row">
				<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6" role="separator">
					<label><fmt:message key="label.usuario"/></label>
					<input class="input-form" maxlength="20" name="obj.usuario" pattern="letraNumeroEspaco" required type="text" value="${obj.usuario}">
					<netsis:validationMessage name="obj.usuario"/>
				</div>
				<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6" role="separator">
					<label><fmt:message key="label.senha"/></label>
					<input class="input-form" maxlength="8" name="obj.senha" pattern="letraNumeroMin8Max8" required type="password" value="${obj.senha}">
					<netsis:validationMessage name="obj.senha"/>
				</div>
			</div>
			<div class="row" role="row">
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" role="separator">
					<label><fmt:message key="label.grupo"/></label>
					<select class="select-form" data-class="slAdmGrupo" id="slAdministrador_Grupo_json_01" name="obj.idgrupo.id"></select>
					<netsis:validationMessage name="obj.idgrupo.id"/>
				</div>
			</div>
			<div class="row" role="row">
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" role="separator">
					<label><fmt:message key="label.inativo"/></label>
					<input <c:if test="${obj.inativo == true}">checked="checked"</c:if> name="obj.inativo" type="checkbox" value="true">
				</div>
			</div>
		</section>
	</form>
</div>
<%@include file="/config/footer.jsp"%>