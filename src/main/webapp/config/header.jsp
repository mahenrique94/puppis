<!DOCTYPE html>
<html>
<head>
	<%@include file="/config/taglibraries.jsp"%>
	<%@include file="/config/libraries-style.jsp"%>	
	<meta charset="UTF-8">
	<meta content="width=device-width, initial-scale=1.0, maximum-scale=1" name="viewport"/>
	<link href="<c:url value="/img/favicon.ico"/>" rel="icon">
	<title><fmt:message key="titulo.pagina"/></title>
</head>
<body>
	<main id="wrap" role="main">
		<header class="header-default" role="banner">
			<%@include file="/config/messages.jsp"%>	
			<%@include file="/config/nav.jsp"%>	
		</header>
		<section id="content" style="padding-bottom: 4rem;">