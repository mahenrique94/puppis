<%@include file="/config/header-dashboard.jsp"%>
<%@include file="/config/modulos.jsp"%>
	<main class="dashboard-relatorio" id="wrap" role="main">
		<header class="header-default" role="banner">
			<%@include file="/config/nav.jsp"%>	
		</header>
		<section id="content">
			<div class="current"><a href="<c:url value="/dashboard"/>"><fmt:message key="nav.dashboard"/></a>&nbsp;<i class="icon-right-open"></i>&nbsp;<a href="<c:url value="/dashboard/comercio"/>"><fmt:message key="nav.comercio"/></a>&nbsp;<i class="icon-right-open"></i>&nbsp;<fmt:message key="nav.comercio.relatorios"/></div>
			<div class="clearfix container-center-sm">
				<nav class="nav-square-default nav-square-hover-lube" role="navigation">
					<ul role="menubar">
						<li class="${disabledCadastro}" role="menuitem"><a href="<c:url value="/relatorio/movimentacao/produto"/>"><label><i class="font-5x icon-exchange"></i><fmt:message key="nav.comercio.relatorios.movimentacao.produto"/></label></a></li>
					</ul>
				</nav>
			</div>
		</section>
	</main>
<%@include file="/config/footer-dashboard.jsp"%>