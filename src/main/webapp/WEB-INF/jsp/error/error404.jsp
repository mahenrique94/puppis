<!DOCTYPE html>
<html>
<head>
	<%@page isErrorPage="true"%>
	<%@include file="/config/taglibraries.jsp"%>
	<%@include file="/config/libraries-style.jsp"%>
	<%@ page contentType="text/html; charset=ISO-8859-1" language="java" pageEncoding="ISO-8859-1"%>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1"/>
   	<title>PUPPIS - Página não encontrada</title>
   	<link rel="icon" href="<c:url value="/images/favicon.ico"/>">
</head>
<body>
	<main id="wrap" role="main">
		<section id="content" style="padding-bottom: 4rem;">
			<section class="container-center-sm">
				<img class="error-logo" src="<c:url value="/img/robo.jpeg"/>">
				<div class="error-info">
					<h1>404!</h1>
					<h3>Página não encontrada</h3>
					<p>Você tentou acessar uma página que não existe no sistema, por favor verifique o endereço.</p>
				</div>
			</section>
			<div class="error-band">
				<section class="container-center-sm">
					<ul class="error-list">
						<li>Seu problema pode ter ocorrido por algum dos motivos abaixo:</li>
						<li>Você tentou acessar um endereço ou página que não existe</li>
						<li>Você tentou acessar uma tela que não existe</li>
						<li>Você digitou um endereço errado no navegador</li>
					</ul>
					<a class="btn-default btn-full btn-lg" href="<c:url value="/dashboard"/>"><i class="icon-left"></i>&nbsp;Página Inicial</a>
				</section>
			</div>
		</section>
	</main>
</body>
</html>