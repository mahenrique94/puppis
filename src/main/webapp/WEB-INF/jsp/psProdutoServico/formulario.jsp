<%@include file="/config/header.jsp" %>
<form action="<c:url value="/produto-servico"/>" class="o-form" id="formpsprodutoservico" method="post" name="formpsprodutoservico" role="form">
	<input aria-hidden="true" name="obj.idtipo.idaux" type="hidden" value="${obj.idtipo.id}">
	<input aria-hidden="true" name="obj.idunidademedida.idaux" type="hidden" value="${obj.idunidademedida.id}">
	<input aria-hidden="true" name="obj.idclasse.idaux" type="hidden" value="${obj.idclasse.id}">
	<input aria-hidden="true" name="obj.custo.id" type="hidden" value="${obj.custo.id}">
	<input aria-hidden="true" name="obj.custo.idprodutoservico.id" type="hidden" value="${obj.custo.idprodutoservico.id}">
	<input aria-hidden="true" name="obj.estoque.id" type="hidden" value="${obj.estoque.id}">
	<input aria-hidden="true" name="obj.estoque.idprodutoservico.id" type="hidden" value="${obj.estoque.idprodutoservico.id}">
	<nav class="o-navbar--gary" role="complementary">
		<div class="o-breadcrumb--arrow">
			<span class="o-breadcrumb__link"><a href="<c:url value="/dashboard"/>" role="link" title="<fmt:message key="nav.dashboard"/>"><fmt:message key="nav.dashboard"/></a></span>
			<span class="o-breadcrumb__link"><a href="<c:url value="/dashboard/cadastro"/>" role="link" title="<fmt:message key="nav.cadastro"/>"><fmt:message key="nav.cadastro"/></a></span>
			<span class="o-breadcrumb__link"><a href="<c:url value="/dashboard/produto/servico"/>" role="link" title="<fmt:message key="nav.cadastro.produto.servico"/>"><fmt:message key="nav.cadastro.produto.servico"/></a></span>
			<span class="o-breadcrumb__link"><a href="<c:url value="/produto-servico"/>" role="link" title="<fmt:message key="nav.cadastro.produto.servico"/>"><fmt:message key="nav.cadastro.produto.servico"/></a></span>
			<span class="o-breadcrumb__link"><a href="<c:url value="/produto-servico"/>" role="link" title="<fmt:message key="nav.lista"/>"><fmt:message key="nav.lista"/></a></span>
			<span class="o-breadcrumb__link"><a class="is-inactive" href="<c:url value="/produto-servico/formulario"/>" role="link" title="<fmt:message key="nav.formulario"/>"><fmt:message key="nav.formulario"/></a></span>
		</div>
	</nav>
	<c:import url="tabs.jsp"/>
	<menu class="o-toolbar--lube is-fixedBottomFull" role="menubar">
		<menuitem class="o-toolbar__item" role="menuitem"><a href="<c:url value="/produto-servico/formulario"/>" role="link" title="<fmt:message key="button.novo"/>"><i class="icon-plus"></i>&nbsp;<fmt:message key="button.novo"/></a></menuitem>
		<menuitem class="o-toolbar__item" role="menuitem"><button role="button" title="<fmt:message key="button.salvar"/>" type="submit"><i class="icon-floppy"></i>&nbsp;<fmt:message key="button.salvar"/></button></menuitem>
		<menuitem class="o-toolbar__item" role="menuitem"><a href="<c:url value="/produto-servico"/>" role="link" title="<fmt:message key="button.pesquisar"/>"><i class="icon-search"></i>&nbsp;<fmt:message key="button.pesquisar"/></a></menuitem>
	</menu> 
</form>
<%@include file="/config/footer.jsp"%>