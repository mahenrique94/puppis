<%@include file="/config/header.jsp" %>
<c:set var="autoFocus" value="${obj.id != null ? '' : 'autofocus'}"/>
<form action="<c:url value="/administrador/comercio"/>" class="o-form" id="formadmcomercio" method="post" name="formadmcomercio" role="form">
	<input aria-hidden="true" name="obj.id" type="hidden" value="${obj.id}">
	<input aria-hidden="true" name="obj.documento.id" type="hidden" value="${obj.documento.id}">
	<input aria-hidden="true" name="obj.documento.idcomercio.id" type="hidden" value="${obj.documento.idcomercio.id}">
	<input aria-hidden="true" name="obj.contato.id" type="hidden" value="${obj.contato.id}">
	<input aria-hidden="true" name="obj.contato.idcomercio.id" type="hidden" value="${obj.contato.idcomercio.id}">
	<input aria-hidden="true" name="obj.endereco.idcomercio.id" type="hidden" value="${obj.endereco.idcomercio.id}">
	<input aria-hidden="true" name="obj.pagamento.id" type="hidden" value="${obj.pagamento.id}">
	<input aria-hidden="true" name="obj.pagamento.idcomercio.id" type="hidden" value="${obj.pagamento.idcomercio.id}">
	<input aria-hidden="true" name="obj.pagamento.idcontabancaria.idaux" type="hidden" value="${obj.pagamento.idcontabancaria.id}">
	<nav class="o-navbar--gary" role="complementary">
		<div class="o-breadcrumb--arrow">
			<span class="o-breadcrumb__link"><a href="<c:url value="/dashboard"/>" role="link" title="<fmt:message key="nav.dashboard"/>"><fmt:message key="nav.dashboard"/></a></span>
			<span class="o-breadcrumb__link"><a href="<c:url value="/dashboard/administrador"/>" role="link" title="<fmt:message key="nav.administrador"/>"><fmt:message key="nav.administrador"/></a></span>
			<span class="o-breadcrumb__link"><a href="<c:url value="/administrador/comercio"/>" role="link" title="<fmt:message key="nav.administrador.comercio"/>"><fmt:message key="nav.administrador.comercio"/></a></span>
			<span class="o-breadcrumb__link"><a href="<c:url value="/administrador/comercio"/>" role="link" title="<fmt:message key="nav.lista"/>"><fmt:message key="nav.lista"/></a></span>
			<span class="o-breadcrumb__link"><a class="is-inactive" href="<c:url value="/administrador/comercio/formulario"/>" role="link" title="<fmt:message key="nav.formulario"/>"><fmt:message key="nav.formulario"/></a></span>
		</div>
	</nav>
	<c:import url="tabs.jsp"/>	
	<menu class="o-toolbar--lube is-fixedBottomFull" role="menubar">
		<menuitem class="o-toolbar__item" role="menuitem"><a href="<c:url value="/administrador/comercio/formulario"/>" role="link" title="<fmt:message key="button.novo"/>"><i class="icon-plus"></i>&nbsp;<fmt:message key="button.novo"/></a></menuitem>
		<menuitem class="o-toolbar__item" role="menuitem"><button role="button" title="<fmt:message key="button.salvar"/>" type="submit"><i class="icon-floppy"></i>&nbsp;<fmt:message key="button.salvar"/></button></menuitem>
		<menuitem class="o-toolbar__item" role="menuitem"><a href="<c:url value="/administrador/comercio"/>" role="link" title="<fmt:message key="button.pesquisar"/>"><i class="icon-search"></i>&nbsp;<fmt:message key="button.pesquisar"/></a></menuitem>
	</menu> 
</form>
<%@include file="/config/footer.jsp"%>