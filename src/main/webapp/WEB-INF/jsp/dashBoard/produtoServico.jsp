<%@include file="/config/header-dashboard.jsp"%>
	<main class="dashboard-cadastro" id="wrap" role="main">
		<header class="header-default" role="banner">
			<%@include file="/config/nav.jsp"%>	
		</header>
		<section id="content">
			<div class="current"><a href="<c:url value="/dashboard"/>"><fmt:message key="nav.dashboard"/></a>&nbsp;<i class="icon-right-open"></i>&nbsp;<a href="<c:url value="/dashboard/cadastro"/>"><fmt:message key="nav.cadastro"/></a>&nbsp;<i class="icon-right-open"></i>&nbsp;<fmt:message key="nav.cadastro.produto.servico"/></div>
			<div class="clearfix container-center">
				<nav class="nav-square" role="navigation">
					<ul class="nav-row" role="menubar">
						<li role="menuitem"><a href="<c:url value="/produto-servico/grupo"/>"><label><i class="font-5x icon-cubes"></i><fmt:message key="nav.cadastro.produto.servico.grupo"/></label></a></li>
						<li role="menuitem"><a href="<c:url value="/produto-servico/classe"/>"><label><i class="font-5x icon-cube"></i><fmt:message key="nav.cadastro.produto.servico.classe"/></label></a></li>
						<li role="menuitem"><a href="<c:url value="/produto-servico"/>"><label><i class="font-5x icon-box"></i><fmt:message key="nav.cadastro.produto.servico"/></label></a></li>
					</ul>
				</nav>
			</div>
		</section>
	</main>
<%@include file="/config/footer-dashboard.jsp"%>