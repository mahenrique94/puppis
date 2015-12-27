<%@include file="/config/header.jsp" %>
<div class="container-tie">
	<form action="<c:url value="/administrador/grupo"/>" class="form-block" id="formadmgrupo" method="post" name="formadmgrupo" role="form">
		<input type="hidden" name="obj.id" value="${obj.id}">
		<input type="hidden" name="obj.idtipoacesso.idaux" value="${obj.idtipoacesso.id}">
		<div class="container-header">
			<div class="row">
				<div class="col-xs-12-last col-sm-12-last col-md-12-last col-lg-12-last">
					<h2><fmt:message key="nav.sistema"/>&nbsp;<fmt:message key="label.barra"/>&nbsp;<fmt:message key="nav.sistema.grupo"/></h2>
				</div>
				<div class="col-xs-12-last col-sm-12-last col-md-3 col-lg-2">
					<button class="btn-md float-left m-right-5" title="<fmt:message key="button.salvar"/>" type="submit"><span class="icon-floppy-disk"></span>&nbsp;<fmt:message key="button.salvar"/></button>
					<a href="<c:url value="/administrador/grupo"/>" class="btn-md float-left m-right-5" title="<fmt:message key="button.pesquisar"/>"><span class="icon-search"></span>&nbsp;<fmt:message key="button.pesquisar"/></a>
				</div>
			</div>
		</div>
		<section aria-expanded="true" aria-hidden="false" class="clearfix" role="form">
			<div class="row" role="row">
				<div class="col-xs-12-last col-sm-12-last col-md-12-last col-lg-12-last" role="separator">
					<label><fmt:message key="label.descricao"/></label>
					<input autofocus class="input-form" maxlength="60" name="obj.descricao" pattern="letraNumeroEspaco" required type="text" value="${obj.descricao}">
					<netsis:validationMessage name="obj.descricao"/>
				</div>
			</div>
			<div class="row" role="row">
				<div class="col-xs-12-last col-sm-12-last col-md-12-last col-lg-12-last" role="separator">
					<label><fmt:message key="label.grupo"/></label>
					<select class="select-form" data-class="slAdmTipoAcesso" id="slAdministrador_Tipo-de-acesso_json_01" name="obj.idtipoacesso.id"></select>
					<netsis:validationMessage name="obj.idtipoacesso.id"/>
				</div>
			</div>
		</section>
	</form>
</div>
<%@include file="/config/footer.jsp"%>