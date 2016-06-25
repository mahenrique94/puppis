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
						<li role="menuitem"><a href="<c:url value="/financeiro/banco"/>"><label><i class="font-5x icon-bank"></i><fmt:message key="nav.cadastro.banco"/></label></a></li>
						<li role="menuitem"><a href="<c:url value="/cadastro/centro-de-custo"/>"><label><i class="font-5x icon-dollar"></i><fmt:message key="nav.cadastro.centro.custo"/></label></a></li>
						<li role="menuitem"><a href="<c:url value="/cadastro/cidade"/>"><label><i class="font-5x icon-location"></i><fmt:message key="nav.cadastro.cidade"/></label></a></li>
						<li role="menuitem"><a href="<c:url value="/financeiro/conta-bancaria"/>"><label><i class="font-5x icon-cube"></i><fmt:message key="nav.cadastro.conta.bancaria"/></label></a></li>
						<li role="menuitem"><a href="<c:url value="/cadastro/estado"/>"><label><i class="font-5x icon-road"></i><fmt:message key="nav.cadastro.estado"/></label></a></li>
						<li role="menuitem"><a href="<c:url value="/financeiro/forma-de-pagamento"/>"><label><i class="font-5x icon-money"></i><fmt:message key="nav.cadastro.forma.pagamento"/></label></a></li>
						<li role="menuitem"><a href="<c:url value="/financeiro/historico"/>"><label><i class="font-5x icon-comment-empty"></i><fmt:message key="nav.cadastro.historico"/></label></a></li>
					</ul>
					<ul class="nav-row" role="menubar">
						<li role="menuitem"><a href="<c:url value="/cadastro/pais"/>"><label><i class="font-5x icon-globe"></i><fmt:message key="nav.cadastro.pais"/></label></a></li>
						<li role="menuitem"><a href="<c:url value="/pessoa"/>"><label><i class="font-5x icon-male"></i><fmt:message key="nav.cadastro.pessoa"/></label></a></li>
						<li role="menuitem"><a href="<c:url value="/dashboard/produtoServico"/>"><label><i class="font-5x icon-box"></i><fmt:message key="nav.cadastro.produto.servico"/></label></a></li>
					</ul>
				</nav>
			</div>
		</section>
	</main>
<%@include file="/config/footer-dashboard.jsp"%>