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
		<%@include file="/config/nav.jsp"%>	
	</header>
	<main class="bg-fafafa" id="wrap" role="main">
		<section class="bg-ffffff container">