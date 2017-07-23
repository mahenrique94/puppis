<%@include file="/config/header.jsp" %>
<form action="<c:url value="/pessoa"/>" class="o-form" id="formpespessoa" method="post" name="formpespessoa" role="form">
	<input aria-hidden="true" name="obj.idestadocivil.idaux" type="hidden" value="${obj.idestadocivil.id}">
	<input aria-hidden="true" name="obj.idsexo.idaux" type="hidden" value="${obj.idsexo.id}">
	<input aria-hidden="true" name="obj.endereco.idpessoa.id" type="hidden" value="${obj.endereco.idpessoa.id}">
	<input aria-hidden="true" name="obj.documento.id" type="hidden" value="${obj.documento.id}">
	<input aria-hidden="true" name="obj.documento.idpessoa.id" type="hidden" value="${obj.documento.idpessoa.id}">
	<nav class="o-navbar--gary" role="complementary">
		<div class="o-breadcrumb--arrow">
			<span class="o-breadcrumb__link"><a href="<c:url value="/dashboard"/>" role="link" title="<fmt:message key="nav.dashboard"/>"><fmt:message key="nav.dashboard"/></a></span>
			<span class="o-breadcrumb__link"><a href="<c:url value="/dashboard/cadastro"/>" role="link" title="<fmt:message key="nav.cadastro"/>"><fmt:message key="nav.cadastro"/></a></span>
			<span class="o-breadcrumb__link"><a href="<c:url value="/pessoa"/>" role="link" title="<fmt:message key="nav.cadastro.pessoa"/>"><fmt:message key="nav.cadastro.pessoa"/></a></span>
			<span class="o-breadcrumb__link"><a href="<c:url value="/pessoa"/>" role="link" title="<fmt:message key="nav.lista"/>"><fmt:message key="nav.lista"/></a></span>
			<span class="o-breadcrumb__link"><a class="is-inactive" href="<c:url value="/pessoa/formulario"/>" role="link" title="<fmt:message key="nav.formulario"/>"><fmt:message key="nav.formulario"/></a></span>
		</div>
	</nav>
	<c:import url="tabs.jsp"/>
	<menu class="o-toolbar--lube is-fixedBottomFull" role="menubar">
		<menuitem class="o-toolbar__item" role="menuitem"><a href="<c:url value="/pessoa/formulario"/>" role="link" title="<fmt:message key="button.novo"/>"><i class="icon-plus"></i>&nbsp;<fmt:message key="button.novo"/></a></menuitem>
		<menuitem class="o-toolbar__item" role="menuitem"><button role="button" title="<fmt:message key="button.salvar"/>" type="submit"><i class="icon-floppy"></i>&nbsp;<fmt:message key="button.salvar"/></button></menuitem>
		<menuitem class="o-toolbar__item" role="menuitem"><a href="<c:url value="/pessoa"/>" role="link" title="<fmt:message key="button.pesquisar"/>"><i class="icon-search"></i>&nbsp;<fmt:message key="button.pesquisar"/></a></menuitem>
	</menu> 
</form>
<%@include file="/config/footer.jsp"%>