<%@include file="/config/header.jsp" %>
<form action="<c:url value="/comercio/nota"/>" class="o-form" id="formcomnota" method="post" name="formcomnota" role="form">
	<nav class="o-navbar--gary" role="complementary">
		<div class="o-breadcrumb--arrow">
			<span class="o-breadcrumb__link"><a href="<c:url value="/dashboard"/>" role="link" title="<fmt:message key="nav.dashboard"/>"><fmt:message key="nav.dashboard"/></a></span>
			<span class="o-breadcrumb__link"><a href="<c:url value="/dashboard/comercio"/>" role="link" title="<fmt:message key="nav.comercio"/>"><fmt:message key="nav.comercio"/></a></span>
			<span class="o-breadcrumb__link"><a href="<c:url value="/comercio/nota"/>" role="link" title="<fmt:message key="nav.comercio.nota"/>"><fmt:message key="nav.comercio.nota"/></a></span>
			<span class="o-breadcrumb__link"><a href="<c:url value="/comercio/nota"/>" role="link" title="<fmt:message key="nav.lista"/>"><fmt:message key="nav.lista"/></a></span>
			<span class="o-breadcrumb__link"><a class="is-inactive" href="<c:url value="/comercio/nota/formulario"/>" role="link" title="<fmt:message key="nav.formulario"/>"><fmt:message key="nav.formulario"/></a></span>
		</div>
	</nav>
	<c:import url="tabs${obj.idtipooperacao.descricao.toLowerCase()}.jsp"/>
	<menu class="o-toolbar--lube is-fixedBottomFull" role="menubar">
		<menuitem class="o-toolbar__item" role="menuitem"><a href="<c:url value="/comercio/nota/formulario"/>" role="link" title="<fmt:message key="button.novo"/>"><i class="icon-plus"></i>&nbsp;<fmt:message key="button.novo"/></a></menuitem>
		<menuitem class="o-toolbar__item" role="menuitem"><button role="button" title="<fmt:message key="button.salvar"/>" type="submit"><i class="icon-floppy"></i>&nbsp;<fmt:message key="button.salvar"/></button></menuitem>
		<menuitem class="o-toolbar__item" role="menuitem"><a href="<c:url value="/comercio/nota"/>" role="link" title="<fmt:message key="button.pesquisar"/>"><i class="icon-search"></i>&nbsp;<fmt:message key="button.pesquisar"/></a></menuitem>
		<c:if test="${obj.dataatualizacao != null}">
			<menuitem class="o-toolbar__item" role="menuitem"><button formaction="<c:url value="/comercio/nota/estornar/${obj.id}"/>" role="button" title="<fmt:message key="button.estornar"/>" type="submit"><i class="icon-exchange"></i>&nbsp;<fmt:message key="button.estornar"/></button></menuitem>
		</c:if>
		<c:if test="${obj.dataatualizacao == null}">
			<menuitem class="o-toolbar__item" role="menuitem"><button formaction="<c:url value="/comercio/nota/calcular"/>" role="button" title="<fmt:message key="button.calcular"/>" type="submit"><i class="icon-calc"></i>&nbsp;<fmt:message key="button.calcular"/></button></menuitem>
			<c:if test="${obj.custo.valortotal > 0}">
				<menuitem class="o-toolbar__item" role="menuitem"><button formaction="<c:url value="/comercio/nota/atualizar"/>" role="button" title="<fmt:message key="button.processar"/>" type="submit"><i class="icon-arrows-cw"></i>&nbsp;<fmt:message key="button.atualizar"/></button></menuitem>
			</c:if>
		</c:if>
	</menu> 
</form>
<%@include file="/config/footer.jsp"%>
