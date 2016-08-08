<%@include file="/config/header-dashboard.jsp"%>
<%@include file="/config/modulos.jsp"%>
	<main class="dashboard-financeiro" id="wrap" role="main">
		<header class="header-default" role="banner">
			<%@include file="/config/nav.jsp"%>	
		</header>
		<section id="content">
			<div class="current"><a href="<c:url value="/dashboard"/>"><fmt:message key="nav.dashboard"/></a>&nbsp;<i class="icon-right-open"></i>&nbsp;<fmt:message key="nav.financeiro"/></div>
			<div class="clearfix container-center-sm">
				<nav class="nav-square-default nav-square-hover-lube" role="navigation">
					<ul role="menubar">
						<li class="${disabledFinanceiro}" role="menuitem"><a href="<c:url value="/financeiro/documento"/>"><label><i class="font-5x icon-doc-inv"></i><fmt:message key="nav.financeiro.documento"/></label></a></li>
						<li class="${disabledFinanceiro}" role="menuitem"><a href="<c:url value="/financeiro/documento/parcelamento"/>"><label><i class="font-5x icon-docs"></i><fmt:message key="nav.financeiro.parcelamento"/></label></a></li>
						<li class="${disabledFinanceiro}" role="menuitem"><a href="<c:url value="/financeiro/documento/baixa"/>"><label><i class="font-5x icon-money"></i><fmt:message key="nav.financeiro.baixa"/></label></a></li>
						<li class="${disabledFinanceiro}" role="menuitem"><a href="<c:url value="/financeiro/extrato"/>"><label><i class="font-5x icon-list-bullet"></i><fmt:message key="nav.financeiro.extrato"/></label></a></li>
						<li class="${disabledFinanceiro}" role="menuitem"><a href="<c:url value="/dashboard/relatorios/financeiro"/>"><label><i class="font-5x icon-chart-bar"></i><fmt:message key="nav.financeiro.relatorios"/></label></a></li>
					</ul>
				</nav>
			</div>
		</section>
	</main>
<%@include file="/config/footer-dashboard.jsp"%>