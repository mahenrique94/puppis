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
	<main class="bg-dashboard" id="wrap" role="main">
		<header class="header-default" role="banner">
			<div class="alert-message time-out" role="alert"><h2>${mensagem}</h2></div>
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
						<li role="menuitem"><a href="<c:url value="/dashboard/cadastro"/>"><i class="font-5x icon-vcard"></i><fmt:message key="nav.cadastro"/></a></li>
						<li role="menuitem"><a href="<c:url value="/dashboard/comercial"/>"><i class="font-5x icon-basket"></i><fmt:message key="nav.comercio"/></a></li>
						<li role="menuitem"><a href="<c:url value="/dashboard/financeiro"/>"><i class="font-5x icon-dollar"></i><fmt:message key="nav.financeiro"/></a></li>
						<li role="menuitem"><a href="<c:url value="/dashboard/administrador"/>"><i class="font-5x icon-cog-alt"></i><fmt:message key="nav.administrador"/></a></li>
					</ul>
				</nav>
			</div>
<%@include file="/config/footer.jsp"%>