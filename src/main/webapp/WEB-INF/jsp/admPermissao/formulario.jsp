<%@include file="/config/header.jsp" %>
<c:set var="autoFocus" value="${obj.id != null ? '' : 'autofocus'}"/>
<form action="<c:url value="/administrador/permissao"/>" class="o-form" id="formadmpermissao" method="post" name="formadmpermissao" role="form">
	<input aria-hidden="true" name="obj.id" type="hidden" value="${obj.id}">
	<input aria-hidden="true" name="obj.idusuario.idaux" type="hidden" value="${obj.idusuario.id}">
	<nav class="o-navbar--gary" role="complementary">
		<div class="o-breadcrumb--arrow">
			<span class="o-breadcrumb__link"><a class="is-inactive" href="<c:url value="/administrador/permissao"/>" role="link" title="<fmt:message key="nav.administrador.permissao"/>"><fmt:message key="nav.administrador.permissao"/></a></span>
			<span class="o-breadcrumb__link"><a class="is-inactive" href="<c:url value="/administrador/permissao"/>" role="link" title="<fmt:message key="nav.formulario"/>"><fmt:message key="nav.formulario"/></a></span>
		</div>
	</nav>
	<section class="o-form__body o-form__body--padding">
		<div class="l-row" role="row">
			<div class="u-grid--6" role="grid">
				<label class="o-form__text" for=""><fmt:message key="label.tabela"/></label>
				<input aria-readonly="true" aria-required="true" class="o-form__data has-validation" name="obj.tabela" readonly required type="text" value="${obj.tabela}">
			</div>
			<div class="u-grid--6" role="grid">
				<label class="o-form__text" for="usuario"><fmt:message key="label.usuario"/></label>
				<select aria-required="true" class="o-form__data has-validation" data-select="sl" data-url="sl" name="obj.idusuario.id" required>
					<c:forEach items="${AdmUsuarioList}" var="usuario">
						<option value="${usuario.id}">${usuario.usuario}</option>
					</c:forEach>
				</select>
			</div>
		</div>
		<div class="l-row" role="row">
			<div class="u-grid--2" role="grid">
				<label class="o-form__text" for="deletar"><fmt:message key="label.deletar"/></label>
				<input <c:if test="${obj.deletar == true}">checked</c:if> class="o-mark__data--checkbox" id="deletar" name="obj.deletar" type="hidden" value="${obj.deletar}">
				<label class="o-mark__text"><span class="o-mark__element" data-marked="true" data-unmarked="false" onclick="MarkController.mark(this);"></span></label>
			</div>
			<div class="u-grid--2" role="grid">
				<label class="o-form__text" for="editar"><fmt:message key="label.editar"/></label>
				<input <c:if test="${obj.editar == true}">checked</c:if> class="o-mark__data--checkbox" id="editar" name="obj.editar" type="hidden" value="${obj.editar}">
				<label class="o-mark__text"><span class="o-mark__element" data-marked="true" data-unmarked="false" onclick="MarkController.mark(this);"></span></label>
			</div>
			<div class="u-grid--2" role="grid">
				<label class="o-form__text" for="formulario"><fmt:message key="label.formulario"/></label>
				<input <c:if test="${obj.formulario == true}">checked</c:if> class="o-mark__data--checkbox" id="formulario" name="obj.formulario" type="hidden" value="${obj.formulario}">
				<label class="o-mark__text"><span class="o-mark__element" data-marked="true" data-unmarked="false" onclick="MarkController.mark(this);"></span></label>
			</div>
			<div class="u-grid--2" role="grid">
				<label class="o-form__text" for="listar"><fmt:message key="label.listar"/></label>
				<input <c:if test="${obj.deletar == true}">checked</c:if> class="o-mark__data--checkbox" id="listar" name="obj.listar" type="hidden" value="${obj.listar}">
				<label class="o-mark__text"><span class="o-mark__element" data-marked="true" data-unmarked="false" onclick="MarkController.mark(this);"></span></label>
			</div>
			<div class="u-grid--2" role="grid">
				<label class="o-form__text" for="salvar"><fmt:message key="label.salvar"/></label>
				<input <c:if test="${obj.salvar == true}">checked</c:if> class="o-mark__data--checkbox" id="inativo" name="obj.salvar" type="hidden" value="${obj.salvar}">
				<label class="o-mark__text"><span class="o-mark__element" data-marked="true" data-unmarked="false" onclick="MarkController.mark(this);"></span></label>
			</div>
		</div>
	</section>
	<menu class="o-toolbar--lube is-fixedBottomFull" role="menubar">
		<menuitem class="o-toolbar__item" role="menuitem"><button role="button" title="<fmt:message key="button.salvar"/>" type="submit"><i class="icon-floppy"></i>&nbsp;<fmt:message key="button.salvar"/></button></menuitem>
		<menuitem class="o-toolbar__item" role="menuitem"><a href="<c:url value="/administrador/usuario/tipo-de-acesso"/>" role="link" title="<fmt:message key="button.pesquisar"/>"><i class="icon-search"></i>&nbsp;<fmt:message key="button.pesquisar"/></a></menuitem>
	</menu> 
</form>
<%@include file="/config/footer.jsp"%>