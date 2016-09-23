<%@include file="/config/header-dashboard.jsp"%>
<%@include file="/config/modulos.jsp"%>
	<main class="dashboard-relatorio" id="wrap" role="main">
		<header class="header-default" role="banner">
			<%@include file="/config/nav.jsp"%>	
		</header>
		<section id="content">
			<div class="current"><a href="<c:url value="/dashboard"/>"><fmt:message key="nav.dashboard"/></a>&nbsp;<i class="icon-right-open"></i>&nbsp;<a href="<c:url value="/dashboard/cadastro"/>"><fmt:message key="nav.cadastro"/></a>&nbsp;<i class="icon-right-open"></i>&nbsp;<fmt:message key="nav.cadastro.relatorios"/></div>
			<div class="clearfix container-center-sm">
				<nav class="nav-square-default nav-square-hover-lube" role="navigation">
					<ul role="menubar">
						<li class="${disabledCadastro}" role="menuitem"><a href="<c:url value="/relatorio/centro/custo"/>"><label><i class="font-5x icon-dollar"></i><fmt:message key="nav.cadastro.relatorios.centro.custo"/></label></a></li>
						<li class="${disabledCadastro}" role="menuitem"><a href="<c:url value="/relatorio/pessoa"/>"><label><i class="font-5x icon-male"></i><fmt:message key="nav.cadastro.relatorios.pessoa"/></label></a></li>
						<li class="${disabledCadastro}" role="menuitem"><a href="<c:url value="/relatorio/produto/grupo"/>"><label><i class="font-5x icon-cubes"></i><fmt:message key="nav.cadastro.relatorios.produto.grupo"/></label></a></li>
						<li class="${disabledCadastro}" role="menuitem"><a href="<c:url value="/relatorio/produto/classe"/>"><label><i class="font-5x icon-cube"></i><fmt:message key="nav.cadastro.relatorios.produto.classe"/></label></a></li>
						<li class="${disabledCadastro}" role="menuitem"><a href="<c:url value="/relatorio/produto/servico"/>"><label><i class="font-5x icon-box"></i><fmt:message key="nav.cadastro.relatorios.produto.servico"/></label></a></li>
						<li class="${disabledCadastro}" role="menuitem"><a href="<c:url value="/relatorio/tabela/preco"/>"><label><i class="font-5x icon-money"></i><fmt:message key="nav.cadastro.relatorios.tabela.preco"/></label></a></li>
					</ul>
				</nav>
			</div>
		</section>
	</main>
<%@include file="/config/footer-dashboard.jsp"%>