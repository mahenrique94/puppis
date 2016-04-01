<%@include file="/config/header.jsp" %>
<form action="<c:url value="/administrador/usuario/grupo"/>" class="form-block" id="formadmusuariogrupo" method="post" name="formadmusuariogrupo" role="form">
	<input name="obj.id" type="hidden" value="${obj.id}">
	<input name="obj.idtipoacesso.idaux" type="hidden" value="${obj.idtipoacesso.id}">
	<nav class="band-nav-kal">
		<div class="row" role="role">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" role="separator">
				<label><fmt:message key="nav.administrador"/>&nbsp;<fmt:message key="label.barra"/>&nbsp;<fmt:message key="nav.administrador.usuario.grupo"/></label>					
			</div>
		</div>
		<div class="row" role="role">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" role="separator">
				<button class="btn-lube btn-sm" title="<fmt:message key="button.salvar"/>" type="submit"><i class="icon-floppy"></i>&nbsp;<fmt:message key="button.salvar"/></button>
				<a class="btn-lube btn-sm" href="<c:url value="/administrador/usuario/grupo"/>" title="<fmt:message key="button.pesquisar"/>"><i class="icon-search"></i>&nbsp;<fmt:message key="button.pesquisar"/></a>
			</div>
		</div>
	</nav>
	<section aria-expanded="true" aria-hidden="false" class="form-body" role="form">
		<div class="row" role="row">
			<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6" role="separator">
				<label><fmt:message key="label.descricao"/></label>
				<input autofocus class="form-data validate" maxlength="60" name="obj.descricao" pattern="letraNumeroEspaco" required type="text" value="${obj.descricao}">
				<netsis:validationMessage name="obj.descricao"/>
			</div>
			<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6" role="separator">
				<label><fmt:message key="label.tipo.acesso"/></label>
				<select class="form-data validate" data-class="slAdmTipoAcesso" id="slAdministrador_Usuario_Tipo-de-acesso_Json_01" name="obj.idtipoacesso.id"></select>
				<netsis:validationMessage name="obj.idtipoacesso.id"/>
			</div>
		</div>
	</section>
</form>
<%@include file="/config/footer.jsp"%>