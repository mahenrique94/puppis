<%@include file="/config/header-dashboard.jsp"%>
	<main class="bg-dashboard-cadastro" id="wrap" role="main">
		<header class="header-default" role="banner">
			<%@include file="/config/nav.jsp"%>	
		</header>
		<section id="content">
			<div class="current"><a href="<c:url value="/dashboard"/>"><fmt:message key="nav.dashboard"/></a>&nbsp;<i class="icon-right-open"></i>&nbsp;<fmt:message key="nav.cadastro"/></div>
			<div class="clearfix container-center">
				<nav class="nav-square" role="navigation">
					<ul class="nav-row" role="menubar">
						<li role="menuitem"><a href="<c:url value="/financeiro/banco"/>"><i class="font-5x icon-bank"></i><fmt:message key="nav.cadastro.banco"/></a></li>
						<li role="menuitem"><a href="<c:url value="/cadastro/centro-de-custo"/>"><i class="font-5x icon-dollar"></i><fmt:message key="nav.cadastro.centro.custo"/></a></li>
						<li role="menuitem"><a href="<c:url value="/cadastro/cidade"/>"><i class="font-5x icon-location"></i><fmt:message key="nav.cadastro.cidade"/></a></li>
						<li role="menuitem"><a href="<c:url value="/financeiro/conta-bancaria"/>"><i class="font-5x icon-cube"></i><fmt:message key="nav.cadastro.conta.bancaria"/></a></li>
						<li role="menuitem"><a href="<c:url value="/cadastro/estado"/>"><i class="font-5x icon-road"></i><fmt:message key="nav.cadastro.estado"/></a></li>
						<li role="menuitem"><a href="<c:url value="/financeiro/forma-de-pagamento"/>"><i class="font-5x icon-money"></i><fmt:message key="nav.cadastro.forma.pagamento"/></a></li>
						<li role="menuitem"><a href="<c:url value="/financeiro/historico"/>"><i class="font-5x icon-comment-empty"></i><fmt:message key="nav.cadastro.historico"/></a></li>
					</ul>
					<ul class="nav-row" role="menubar">
						<li role="menuitem"><a href="<c:url value="/cadastro/pais"/>"><i class="font-5x icon-globe"></i><fmt:message key="nav.cadastro.pais"/></a></li>
						<li role="menuitem"><a href="<c:url value="/pessoa"/>"><i class="font-5x icon-male"></i><fmt:message key="nav.cadastro.pessoa"/></a></li>
						<li role="menuitem"><a href="<c:url value="/dashboard/produtoServico"/>"><i class="font-5x icon-box"></i><fmt:message key="nav.cadastro.produto.servico"/></a></li>
					</ul>
				</nav>
			</div>
		</section>
	</main>
<%@include file="/config/footer-dashboard.jsp"%>