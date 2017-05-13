<%@include file="/config/header.jsp"%>
<nav class="o-navbar--gary" role="complementary">
	<div class="o-breadcrumb--arrow">
		<span class="o-breadcrumb__link"><a href="<c:url value="/dashboard"/>" role="link" title="<fmt:message key="nav.dashboard"/>"><fmt:message key="nav.dashboard"/></a></span>
		<span class="o-breadcrumb__link"><a href="<c:url value="/dashboard/cadastro"/>" role="link" title="<fmt:message key="nav.cadastro"/>"><fmt:message key="nav.cadastro"/></a></span>
		<span class="o-breadcrumb__link"><a class="is-inactive" href="<c:url value="/financeiro/banco"/>" role="link" title="<fmt:message key="nav.cadastro.banco"/>"><fmt:message key="nav.cadastro.banco"/></a></span>
		<span class="o-breadcrumb__link"><a class="is-inactive" href="<c:url value="/financeiro/banco"/>" role="link" title="<fmt:message key="nav.lista"/>"><fmt:message key="nav.lista"/></a></span>
	</div>
	<form action="<c:url value="/financeiro/banco"/>" class="o-form" id="formfinbancolistar" method="get" name="formfinbancolistar" role="search">
		<div class="l-row" role="row">
			<div class="u-grid--2" role="grid">
				<select class="o-form__data" data-select="slTable" name="parametrosWeb[0].campo"></select>
			</div>
			<div class="u-grid--10" role="grid">
				<div class="o-form__group">
					<input class="o-form__data" name="parametrosWeb[0].parametroInicial" placeholder="<fmt:message key="placeholder.pesquisar"/>" type="search">
					<span class="o-form__groupElement"><button class="o-button--lube" role="button" title="<fmt:message key="button.pesquisar"/>" type="submit"><i class="icon-search"></i></button></span>
				</div>
			</div>   		
		</div>
	</form>
</nav>
<display:table class="c-table--lube c-table--hovered c-table--zebrered c-table--bordered" export="false" id="obj" name="${FinBancoList}" requestURI="/financeiro/banco">
	<display:column headerScope="codigo" property="codigo" style="width: 50px;" titleKey="displaytag.codigo"/>
	<display:column headerScope="descricao" property="descricao" titleKey="displaytag.descricao"/>
</display:table>
<%@include file="/config/footer.jsp"%>