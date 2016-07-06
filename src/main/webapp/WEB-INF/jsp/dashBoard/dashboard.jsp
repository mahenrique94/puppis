<%@include file="/config/header-dashboard.jsp"%>
	<main class="dashboard" id="wrap" role="main">
		<header class="header-default" role="banner">
			<%@include file="/config/nav.jsp"%>	
		</header>
		<section id="content">
			<div class="clearfix container-center">
				<div class="welcome">
					<h1><fmt:message key="titulo.bem.vindo"/></h1>
					<h2>Plataforma online para gestão comercial</h2>
				</div>
				<nav class="nav-square" role="navigation">
					<ul class="nav-row" role="menubar">
						<li role="menuitem"><a href="<c:url value="/dashboard/cadastro"/>"><label><i class="font-5x icon-vcard"></i><fmt:message key="nav.cadastro"/></label></a></li>
						<li role="menuitem"><a href="<c:url value="/dashboard/comercial"/>"><label><i class="font-5x icon-basket"></i><fmt:message key="nav.comercio"/></label></a></li>
						<li role="menuitem"><a href="<c:url value="/dashboard/financeiro"/>"><label><i class="font-5x icon-dollar"></i><fmt:message key="nav.financeiro"/></label></a></li>
						<li role="menuitem"><a href="<c:url value="/dashboard/administrador"/>"><label><i class="font-5x icon-cog-alt"></i><fmt:message key="nav.administrador"/></label></a></li>
					</ul>
				</nav>
			</div>
		</section>
	</main>
<%@include file="/config/footer-dashboard.jsp"%>