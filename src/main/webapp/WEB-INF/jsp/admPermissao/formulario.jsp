<%@include file="/config/header.jsp" %>
<form action="<c:url value="/administrador/permissao"/>" class="form-modern" id="formadmpermissao" method="post" name="formadmpermissao" role="form">
	<input name="obj.id" type="hidden" value="${obj.id}">
	<input name="obj.idusuario.idaux" type="hidden" value="${obj.idusuario.id}">
	<nav class="band-nav-lube" role="complementary">
		<div class="row" role="row">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" role="separator">
				<label><a href="<c:url value="/dashboard/administrador"/>"><fmt:message key="nav.administrador"/></a>&nbsp;<i class="icon-right-open"></i>&nbsp;<fmt:message key="nav.administrador.permissao"/></label>					
			</div>
		</div>
	</nav>
	<section aria-expanded="true" aria-hidden="false" class="form-body" role="form">
		<div class="row" role="row">
			<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6" role="separator">
				<label><fmt:message key="label.tabela"/></label>
				<input class="form-data" name="obj.tabela" readonly required type="text" value="${obj.tabela}">
			</div>
			<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6" role="separator">
				<label><fmt:message key="label.usuario"/></label>
				<select class="form-data validate" data-class="slCad" name="obj.idusuario.id" required>
					<c:forEach items="${AdmUsuarioList}" var="usuario">
						<option value="${usuario.id}">${usuario.usuario}</option>
					</c:forEach>
				</select>
			</div>
		</div>
		<div class="row" role="row">
			<div class="col-xs-2 col-sm-2 col-md-2 col-lg-2" role="separator">
				<label><fmt:message key="label.deletar"/></label>
				<input <c:if test="${obj.deletar == true}">checked</c:if> class="form-data" name="obj.deletar" type="checkbox" value="true">
			</div>
			<div class="col-xs-2 col-sm-2 col-md-2 col-lg-2" role="separator">
				<label><fmt:message key="label.editar"/></label>
				<input <c:if test="${obj.editar == true}">checked</c:if> class="form-data" name="obj.editar" type="checkbox" value="true">
			</div>
			<div class="col-xs-2 col-sm-2 col-md-2 col-lg-2" role="separator">
				<label><fmt:message key="label.formulario"/></label>
				<input <c:if test="${obj.formulario == true}">checked</c:if> class="form-data" name="obj.formulario" type="checkbox" value="true">
			</div>
			<div class="col-xs-2 col-sm-2 col-md-2 col-lg-2" role="separator">
				<label><fmt:message key="label.listar"/></label>
				<input <c:if test="${obj.listar == true}">checked</c:if> class="form-data" name="obj.listar" type="checkbox" value="true">
			</div>
			<div class="col-xs-2 col-sm-2 col-md-2 col-lg-2" role="separator">
				<label><fmt:message key="label.salvar"/></label>
				<input <c:if test="${obj.salvar == true}">checked</c:if> class="form-data" name="obj.salvar" type="checkbox" value="true">
			</div>
		</div>
	</section>
	<nav class="nav-group-tie nav-fixed-bottom" role="complementary">
		<ul>
			<li><button title="<fmt:message key="button.salvar"/>" type="submit"><i class="icon-floppy"></i>&nbsp;<fmt:message key="button.salvar"/></button></li>
		</ul>
	</nav>
</form>
<%@include file="/config/footer.jsp"%>