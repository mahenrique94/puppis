<!DOCTYPE html>
<html>
<head>
	<%@include file="/config/taglibraries.jsp"%>
	<%@include file="/config/libraries-style.jsp"%>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1"/>
   	<title>PUPPIS - Acessado negado</title>
   	<link rel="icon" href="<c:url value="/images/favicon.ico"/>">
</head>
<body class="o-pageError--holeMan">
	<header class="o-pageError__header">
		<h1><a class="o-pageError__brand" href="<c:url value="/"/>"><fmt:message key="titulo.pagina"/></a></h1>
	</header>
	<section class="o-pageError__body">
		<span class="o-pageError__picture"></span>
		<div class="o-pageError__info">
			<h2 class="o-pageError__title">403!</h2>
			<p class="o-pageError__describe">Você esta tentando acessar um recurso que não possuí permissão.</p>
			<label class="o-pageError__feedback">Retornar para a <a class="o-pageError__link" href="<c:url value="/"/>">página principal.</a></label>
		</div>
	</section>
</body>
</html>