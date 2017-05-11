<%@include file="/config/header.jsp" %>
<c:set var="autoFocus" value="${obj.id != null ? '' : 'autofocus'}"/>
<form action="<c:url value="/administrador/usuario"/>" class="o-form" id="formadmusuario" method="post" name="formadmusuario" role="form">
	<input aria-hidden="true" name="obj.id" type="hidden" value="${obj.id}">
	<input aria-hidden="true" name="obj.idgrupo.idaux" type="hidden" value="${obj.idgrupo.id}">
	<nav class="o-navbar--gary" role="complementary">
		<div class="o-breadcrumb--arrow">
			<span class="o-breadcrumb__link"><a href="<c:url value="/dashboard"/>" role="link" title="<fmt:message key="nav.dashboard"/>"><fmt:message key="nav.dashboard"/></a></span>
			<span class="o-breadcrumb__link"><a href="<c:url value="/dashboard/administrador"/>" role="link" title="<fmt:message key="nav.administrador"/>"><fmt:message key="nav.administrador"/></a></span>
			<span class="o-breadcrumb__link"><a href="<c:url value="/administrador/usuario"/>" role="link" title="<fmt:message key="nav.administrador.usuario"/>"><fmt:message key="nav.administrador.usuario"/></a></span>
			<span class="o-breadcrumb__link"><a href="<c:url value="/administrador/usuario"/>" role="link" title="<fmt:message key="nav.lista"/>"><fmt:message key="nav.lista"/></a></span>
			<span class="o-breadcrumb__link"><a class="is-inactive" href="<c:url value="/administrador/usuario//formulario"/>" role="link" title="<fmt:message key="nav.formulario"/>"><fmt:message key="nav.formulario"/></a></span>
		</div>
	</nav>
	<c:import url="tabs.jsp"/>	
	<menu class="o-toolbar--lube is-fixedBottomFull" role="menubar">
		<menuitem class="o-toolbar__item" role="menuitem"><a href="<c:url value="/administrador/usuario/formulario"/>" role="link" title="<fmt:message key="button.novo"/>"><i class="icon-plus"></i>&nbsp;<fmt:message key="button.novo"/></a></menuitem>
		<menuitem class="o-toolbar__item" role="menuitem"><button role="button" title="<fmt:message key="button.salvar"/>" type="submit"><i class="icon-floppy"></i>&nbsp;<fmt:message key="button.salvar"/></button></menuitem>
		<menuitem class="o-toolbar__item" role="menuitem"><a href="<c:url value="/administrador/usuario"/>" role="link" title="<fmt:message key="button.pesquisar"/>"><i class="icon-search"></i>&nbsp;<fmt:message key="button.pesquisar"/></a></menuitem>
	</menu> 
</form>
<%@include file="/config/footer.jsp"%>