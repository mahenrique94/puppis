<%@include file="/config/header-dashboard.jsp"%>
	<main class="dashboard-administrador" id="wrap" role="main">
		<header class="header-default" role="banner">
			<%@include file="/config/nav.jsp"%>	
		</header>
		<section id="content">
			<div class="current"><a href="<c:url value="/dashboard"/>"><fmt:message key="nav.dashboard"/></a>&nbsp;<i class="icon-right-open"></i>&nbsp;<fmt:message key="nav.administrador"/></div>
			<div class="clearfix container-center">
				<nav class="nav-square" role="navigation">
					<ul class="nav-row" role="menubar">
						<li role="menuitem"><a href="<c:url value="/administrador/comercio"/>"><label><i class="font-5x icon-vcard"></i><fmt:message key="nav.administrador.comercio"/></label></a></li>
						<li role="menuitem"><a href="<c:url value="/administrador/usuario/tipo-de-acesso"/>"><label><i class="font-5x icon-lock"></i><fmt:message key="nav.administrador.usuario.tipo.acesso"/></label></a></li>
						<li role="menuitem"><a href="<c:url value="/administrador/usuario/grupo"/>"><label><i class="font-5x icon-users"></i><fmt:message key="nav.administrador.usuario.grupo"/></label></a></li>
						<li role="menuitem"><a href="<c:url value="/administrador/usuario"/>"><label><i class="font-5x icon-user"></i><fmt:message key="nav.administrador.usuario"/></label></a></li>
					</ul>
				</nav>
			</div>
		</section>
	</main>
<%@include file="/config/footer-dashboard.jsp"%>