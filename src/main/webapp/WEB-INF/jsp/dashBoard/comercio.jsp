<%@include file="/config/header-dashboard.jsp"%>
<%@include file="/config/modulos.jsp"%>
	<main class="dashboard-comercio" id="wrap" role="main">
		<header class="header-default" role="banner">
			<%@include file="/config/nav.jsp"%>	
		</header>
		<section id="content">
			<div class="current"><a href="<c:url value="/dashboard"/>"><fmt:message key="nav.dashboard"/></a>&nbsp;<i class="icon-right-open"></i>&nbsp;<fmt:message key="nav.comercio"/></div>
			<div class="clearfix container-center-sm">
				<nav class="nav-square-default nav-square-hover-lube" role="navigation">
					<ul role="menubar">
						<li class="${disabledComercio}" role="menuitem"><a href="<c:url value="/comercio/nota"/>"><label><i class="font-5x icon-doc-inv"></i><fmt:message key="nav.comercio.nota"/></label></a></li>
						<li class="${disabledComercio}" role="menuitem"><a href="<c:url value="/comercio/estoque/correcao"/>"><label><i class="font-5x icon-exchange"></i><fmt:message key="nav.comercio.correcao.estoque"/></label></a></li>
						<li class="${disabledCadastro}" role="menuitem"><a href="<c:url value="/dashboard/relatorios/comercio"/>"><label><i class="font-5x icon-chart-bar"></i><fmt:message key="nav.comercio.relatorios"/></label></a></li>
					</ul>
				</nav>
			</div>
		</section>
	</main>
<%@include file="/config/footer-dashboard.jsp"%>