<%@include file="/config/header.jsp" %>
<div class="container-tie">
	<form action="<c:url value="/administrador/tipo-de-acesso"/>" class="form-block" id="formadmtipoacesso" method="post" name="formadmtipoacesso" role="form">
		<input type="hidden" name="obj.id" value="${obj.id}">
		<div class="container-header">
			<div class="row">
				<div class="col-xs-12-last col-sm-12-last col-md-12-last col-lg-12-last">
					<h2><fmt:message key="nav.sistema"/>&nbsp;<fmt:message key="label.barra"/>&nbsp;<fmt:message key="nav.sistema.grupo"/></h2>
				</div>
				<div class="col-xs-12-last col-sm-12-last col-md-3 col-lg-2">
					<button class="btn-md float-left m-right-5" title="<fmt:message key="button.salvar"/>" type="submit"><span class="icon-floppy-disk"></span>&nbsp;<fmt:message key="button.salvar"/></button>
					<a href="<c:url value="/administrador/tipo-de-acesso"/>" class="btn-md float-left m-right-5" title="<fmt:message key="button.pesquisar"/>"><span class="icon-search"></span>&nbsp;<fmt:message key="button.pesquisar"/></a>
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
				<div class="col-xs-3 col-sm-3 col-md-3 col-lg-3" role="separator">
					<label><fmt:message key="label.deletar"/></label>
					<input <c:if test="${obj.deletar == true}">checked="checked"</c:if> name="obj.deletar" type="checkbox" value="true">
				</div>
				<div class="col-xs-3 col-sm-3 col-md-3 col-lg-3" role="separator">
					<label><fmt:message key="label.editar"/></label>
					<input <c:if test="${obj.editar == true}">checked="checked"</c:if> name="obj.editar" type="checkbox" value="true">
				</div>
				<div class="col-xs-3 col-sm-3 col-md-3 col-lg-3" role="separator">
					<label><fmt:message key="label.listar"/></label>
					<input <c:if test="${obj.listar == true}">checked="checked"</c:if> name="obj.listar" type="checkbox" value="true">
				</div>
				<div class="col-xs-3-last col-sm-3-last col-md-3-last col-lg-3-last" role="separator">
					<label><fmt:message key="label.salvar"/></label>
					<input <c:if test="${obj.salvar == true}">checked="checked"</c:if> name="obj.salvar" type="checkbox" value="true">
				</div>
			</div>
		</section>
	</form>
</div>
<%@include file="/config/footer.jsp"%>