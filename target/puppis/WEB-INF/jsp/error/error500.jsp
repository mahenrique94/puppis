<!DOCTYPE html>
<html>
<head>
	<%@page isErrorPage="true"%>
	<%@include file="/config/taglibraries.jsp"%>
	<%@include file="/config/libraries-style.jsp"%>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1"/>
   	<title>PUPPIS - Erro</title>
   	<link rel="icon" href="<c:url value="/images/favicon.ico"/>">
</head>
<body class="o-pageError--robotBroken">
	<section class="o-pageError__body">
		<span class="o-pageError__picture"></span>
		<div class="o-pageError__info">
			<h2 class="o-pageError__title">500!</h2>
			<p class="o-pageError__describe">Houve um problema ao processar sua requisição.</p>
			<label class="o-pageError__feedback">Retornar para a <a class="o-pageError__link" href="<c:url value="/"/>">página principal.</a></label>
		</div>
	</section>
</body>
</html>