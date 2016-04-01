<%@include file="/config/header.jsp" %>
<form action="<c:url value="/administrador/usuario/tipo-de-acesso"/>" class="form-block" id="formadmusuariotipoacesso" method="post" name="formadmusuariotipoacesso" role="form">
	<input name="obj.id" type="hidden" value="${obj.id}">
	<%-- <input name="versao" type="hidden" value="${obj.versao}"> --%>
	<nav class="band-nav-kal" role="complementary">
		<div class="row" role="row">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" role="separator">
				<label><fmt:message key="nav.administrador"/>&nbsp;<fmt:message key="label.barra"/>&nbsp;<fmt:message key="nav.administrador.usuario.tipo.acesso"/></label>					
			</div>
		</div>
		<div class="row" role="row">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" role="separator">
				<button class="btn-lube btn-sm" title="<fmt:message key="button.salvar"/>" type="submit"><i class="icon-floppy"></i>&nbsp;<fmt:message key="button.salvar"/></button>
				<a class="btn-lube btn-sm" href="<c:url value="/administrador/usuario/tipo-de-acesso"/>" title="<fmt:message key="button.pesquisar"/>"><i class="icon-search"></i>&nbsp;<fmt:message key="button.pesquisar"/></a>
			</div>
		</div>
	</nav>
	<section aria-expanded="true" aria-hidden="false" class="form-body" role="form">
		<div class="row" role="row">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" role="separator">
				<label><fmt:message key="label.descricao"/></label>
				<input autofocus class="form-data validate" maxlength="60" name="obj.descricao" pattern="letraNumeroEspaco" required type="text" value="${obj.descricao}">
				<netsis:validationMessage name="obj.descricao"/>
			</div>
		</div>
		<div class="row" role="row">
			<div class="col-xs-3 col-sm-3 col-md-3 col-lg-3" role="separator">
				<label><fmt:message key="label.deletar"/></label>
				<input <c:if test="${obj.deletar == true}">checked</c:if> class="form-data" name="obj.deletar" type="checkbox" value="true">
			</div>
			<div class="col-xs-3 col-sm-3 col-md-3 col-lg-3" role="separator">
				<label><fmt:message key="label.editar"/></label>
				<input <c:if test="${obj.editar == true}">checked</c:if> class="form-data" name="obj.editar" type="checkbox" value="true">
			</div>
			<div class="col-xs-3 col-sm-3 col-md-3 col-lg-3" role="separator">
				<label><fmt:message key="label.listar"/></label>
				<input <c:if test="${obj.listar == true}">checked</c:if> class="form-data" name="obj.listar" type="checkbox" value="true">
			</div>
			<div class="col-xs-3 col-sm-3 col-md-3 col-lg-3" role="separator">
				<label><fmt:message key="label.salvar"/></label>
				<input <c:if test="${obj.salvar == true}">checked</c:if> class="form-data" name="obj.salvar" type="checkbox" value="true">
			</div>
		</div>
	</section>
</form>
<%@include file="/config/footer.jsp"%>