<!DOCTYPE html>
<html>
<head>
	<%@page isErrorPage="true"%>
	<%@include file="/config/taglibraries.jsp"%>
	<%@include file="/config/libraries-style.jsp"%>
	<%@ page contentType="text/html; charset=ISO-8859-1" language="java" pageEncoding="ISO-8859-1"%>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1"/>
   	<title>PUPPIS - Erro</title>
   	<link rel="icon" href="<c:url value="/images/favicon.ico"/>">
</head>
<body>
	<main id="wrap" role="main">
		<section id="content" style="padding-bottom: 4rem;">
			<section class="container-center-sm">
				<img class="error-logo" src="<c:url value="/img/robo.jpeg"/>">
				<div class="error-info">
					<h1>500!</h1>
					<h3>Operação não foi realizada com sucesso</h3>
					<p>Ocorreu um erro durante sua operação, por favor contate o suporte.</p>
				</div>
			</section>
			<div class="error-band">
				<section class="container-center-sm">
					<ul class="error-list">
						<li>Seu problema pode ter ocorrido por algum dos motivos abaixo:</li>
						<li>Você tentou abrir um registro que não existe no banco de dados</li>
						<li>Verifique se todos os campos obrigatórios foram preenchidos</li>
						<li>Ocorreu um erro na aplicação durante sua operação</li>
						<li>Não foi possível salvar o registro no banco de dados</li>
					</ul>
					<a class="btn-default btn-full btn-lg" href="<c:url value="/dashboard"/>"><i class="icon-left"></i>&nbsp;Página Inicial</a>
				</section>
			</div>
		</section>
	</main>
</body>
</html>