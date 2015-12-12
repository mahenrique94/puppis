<!DOCTYPE html>
<html>
<head>
	<%@include file="/config/taglibraries.jsp" %>
	<%@include file="/config/libraries-style.jsp" %>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1"/>
	<title><fmt:message key="titulo.pagina"/></title>
	<link rel="icon" href="<c:url value="/img/NetsisIcone.png"/>">
</head>
<body>
	<header class="header-default" role="banner">
		<div class="alert-message time-out" role="alert"><h2>${mensagem}</h2></div>
		<figure class="header-brand">
			<h1><a href="<c:url value="/"/>"><img alt="Netsis" src="<c:url value="/img/Netsis.png"/>"></a></h1>
		</figure>
		<div class="float-right m-top-30 m-right-5"><span class="icon-user"></span>&nbsp;${username.usuario.usuario}<t class="m-left-10"><span class="icon-lock"></span>&nbsp;<a class="no-decoration" href="<c:url value="#"/>"><fmt:message key="titulo.alterar.senha"/></a></t><t class="m-left-10"><span class="icon-off"></span>&nbsp;<a class="no-decoration" href="<c:url value="/login/logout"/>"><fmt:message key="titulo.sair"/></a></t></div>		
		<%@include file="/config/nav.jsp"%>	
	</header>
	<main id="wrap" role="main">
		<section class="container">