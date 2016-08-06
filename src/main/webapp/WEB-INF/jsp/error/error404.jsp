<!DOCTYPE html>
<html>
<head>
	<%@page isErrorPage="true"%>
	<%@include file="/config/taglibraries.jsp"%>
	<%@include file="/config/libraries-style.jsp"%>
	<%@ page contentType="text/html; charset=ISO-8859-1" language="java" pageEncoding="ISO-8859-1"%>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1"/>
   	<title>PUPPIS - P�gina n�o encontrada</title>
   	<link rel="icon" href="<c:url value="/images/favicon.ico"/>">
</head>
<body>
	<main id="wrap" role="main">
		<section id="content" style="padding-bottom: 4rem;">
			<section class="container-center-sm">
				<img class="error-logo" src="<c:url value="/img/robo.jpeg"/>">
				<div class="error-info">
					<h1>404!</h1>
					<h3>P�gina n�o encontrada</h3>
					<p>Voc� tentou acessar uma p�gina que n�o existe no sistema, por favor verifique o endere�o.</p>
				</div>
			</section>
			<div class="error-band">
				<section class="container-center-sm">
					<ul class="error-list">
						<li>Seu problema pode ter ocorrido por algum dos motivos abaixo:</li>
						<li>Voc� tentou acessar um endere�o ou p�gina que n�o existe</li>
						<li>Voc� tentou acessar uma tela que n�o existe</li>
						<li>Voc� digitou um endere�o errado no navegador</li>
					</ul>
					<a class="btn-default btn-full btn-lg" href="<c:url value="/dashboard"/>"><i class="icon-left"></i>&nbsp;P�gina Inicial</a>
				</section>
			</div>
		</section>
	</main>
</body>
</html>