<%@include file="/config/header-dashboard.jsp"%>
<%@include file="/config/modulos.jsp"%>
<section class="o-dashboard">
	<div class="o-dashboard__breadcrumb">
		<div class="o-breadcrumb--arrow">
			<span class="o-breadcrumb__link"><a href="<c:url value="/dashboard"/>" role="link" title="<fmt:message key="nav.dashboard"/>"><fmt:message key="nav.dashboard"/></a></span>
			<span class="o-breadcrumb__link"><a href="<c:url value="/dashboard/comercio"/>" role="link" title="<fmt:message key="nav.comercio"/>"><fmt:message key="nav.comercio"/></a></span>
			<span class="o-breadcrumb__link"><a class="is-inactive" href="#" role="link" title="<fmt:message key="nav.comercio.relatorios"/>"><fmt:message key="nav.comercio.relatorios"/></a></span>
			<c:import url="loginInfo.jsp"/>
		</div>
	</div>
	<div class="o-dashboard__content">
		<nav class="c-square--gary" role="navigation">
			<menu aria-haspopup="true" class="c-square__menu" role="menubar">
				<menuitem class="c-square__item" role="menuitem"><a class="${disabledComercio}" href="<c:url value="/relatorio/movimentacao/produto"/>" role="link" title="<fmt:message key="nav.comercio.relatorios.movimentacao.produto"/>"><i class="icon-exchange"></i><fmt:message key="nav.comercio.relatorios.movimentacao.produto"/></a></menuitem>
			</menu>
		</nav>
	</div>
</section>
<%@include file="/config/footer-dashboard.jsp"%>
<script>
	let main = document.body.children[0];
	let section = document.body.children[0].children[0];
	main.style.background = 'url(/puppis/assets/img/dashboard/dashboard-relatorio.jpeg) no-repeat center / cover';
	section.style.padding = '0';
</script>