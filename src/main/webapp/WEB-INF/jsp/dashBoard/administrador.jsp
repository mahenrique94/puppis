<!DOCTYPE html>
<html>
<head>
	<%@include file="/config/taglibraries.jsp" %>
	<%@include file="/config/libraries-style.jsp" %>
	<meta charset="UTF-8">
	<meta content="width=device-width, initial-scale=1.0, maximum-scale=1" name="viewport"/>
	<link href="<c:url value="/img/favicon.ico"/>" rel="icon">
	<title><fmt:message key="titulo.pagina"/></title>
</head>
<body>
	<main class="bg-dashboard-sistema" id="wrap" role="main">
		<header class="header-default" role="banner">
			<div class="alert-message time-out" role="alert"><h2>${mensagem}</h2></div>
			<%@include file="/config/nav.jsp"%>	
		</header>
		<section id="content">
			<div class="current"><fmt:message key="nav.dashboard"/>&nbsp;<i class="icon-right-open"></i>&nbsp;<fmt:message key="nav.administrador"/></div>
			<div class="clearfix container-center">
				<nav class="nav-square" role="navigation">
					<ul class="nav-row" role="menubar">
						<li role="menuitem"><a href="<c:url value="/administrador/comercio"/>"><i class="font-5x icon-vcard"></i><fmt:message key="nav.administrador.comercio"/></a></li>
						<li role="menuitem"><a href="<c:url value="/administrador/usuario/tipo-de-acesso"/>"><i class="font-5x icon-lock"></i><fmt:message key="nav.administrador.usuario.tipo.acesso"/></a></li>
						<li role="menuitem"><a href="<c:url value="/administrador/usuario/grupo"/>"><i class="font-5x icon-users"></i><fmt:message key="nav.administrador.usuario.grupo"/></a></li>
						<li role="menuitem"><a href="<c:url value="/administrador/usuario"/>"><i class="font-5x icon-user"></i><fmt:message key="nav.administrador.usuario"/></a></li>
					</ul>
				</nav>
			</div>
<%@include file="/config/footer.jsp"%>