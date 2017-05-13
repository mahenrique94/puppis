<%@include file="/config/header.jsp" %>
<form action="<c:url value="/financeiro/documento"/>" class="o-form" id="formfindocumento" method="post" name="formfindocumento" role="form">
	<input aria-hidden="true" name="obj.id" type="hidden" value="${obj.id}">
	<input aria-hidden="true" name="obj.iddefinicao.idaux" type="hidden" value="${obj.iddefinicao.id}">
	<input aria-hidden="true" name="obj.idtipooperacao.idaux" type="hidden" value="${obj.idtipooperacao.id}">
	<input aria-hidden="true" name="obj.idcontabancaria.idaux" type="hidden" value="${obj.idcontabancaria.id}">
	<input aria-hidden="true" name="obj.idtipodocumento.idaux" type="hidden" value="${obj.idtipodocumento.id}">
	<input aria-hidden="true" name="obj.idformapagamento.idaux" type="hidden" value="${obj.idformapagamento.id}">
	<input aria-hidden="true" name="obj.idhistorico.idaux" type="hidden" value="${obj.idhistorico.id}">
	<input aria-hidden="true" name="obj.valordesconto" type="hidden" value="${obj.valordesconto}">
	<input aria-hidden="true" name="obj.valorjuros" type="hidden" value="${obj.valorjuros}">
	<nav class="o-navbar--gary" role="complementary">
		<div class="o-breadcrumb--arrow">
			<span class="o-breadcrumb__link"><a href="<c:url value="/dashboard"/>" role="link" title="<fmt:message key="nav.dashboard"/>"><fmt:message key="nav.dashboard"/></a></span>
			<span class="o-breadcrumb__link"><a href="<c:url value="/dashboard/financeiro"/>" role="link" title="<fmt:message key="nav.cadastro"/>"><fmt:message key="nav.financeiro"/></a></span>
			<span class="o-breadcrumb__link"><a href="<c:url value="/financeiro/documento"/>" role="link" title="<fmt:message key="nav.financeiro.documento"/>"><fmt:message key="nav.financeiro.documento"/></a></span>
			<span class="o-breadcrumb__link"><a href="<c:url value="/financeiro/documento"/>" role="link" title="<fmt:message key="nav.lista"/>"><fmt:message key="nav.lista"/></a></span>
			<span class="o-breadcrumb__link"><a class="is-inactive" href="<c:url value="/financeiro/documento/formulario"/>" role="link" title="<fmt:message key="nav.formulario"/>"><fmt:message key="nav.formulario"/></a></span>
		</div>
	</nav>
	<c:import url="tabs.jsp"/>
	<menu class="o-toolbar--lube is-fixedBottomFull" role="menubar">
		<menuitem class="o-toolbar__item" role="menuitem"><a href="<c:url value="/financeiro/documento/formulario"/>" role="link" title="<fmt:message key="button.novo"/>"><i class="icon-plus"></i>&nbsp;<fmt:message key="button.novo"/></a></menuitem>
		<menuitem class="o-toolbar__item" role="menuitem"><button role="button" title="<fmt:message key="button.salvar"/>" type="submit"><i class="icon-floppy"></i>&nbsp;<fmt:message key="button.salvar"/></button></menuitem>
		<menuitem class="o-toolbar__item" role="menuitem"><a href="<c:url value="/financeiro/documento"/>" role="link" title="<fmt:message key="button.pesquisar"/>"><i class="icon-search"></i>&nbsp;<fmt:message key="button.pesquisar"/></a></menuitem>
	</menu> 
</form>
<%@include file="/config/footer.jsp"%>