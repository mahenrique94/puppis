<!DOCTYPE html>
<html>
<head>
	<%@include file="/config/taglibraries.jsp" %>
	<%@include file="/config/libraries-style.jsp"%>
	<meta charset="UTF-8">
	<meta content="width=device-width, initial-scale=1.0, maximum-scale=1" name="viewport"/>
	<title><fmt:message key="titulo.pagina"/></title>
	<link href="<c:url value="/img/NetsisIcone.png"/>" rel="icon">
</head>
<body class="bg-lube">
	<figure class="brand-default">
		<h1><img alt="Netsis" src="<c:url value="/img/NetsisLogin.png"/>"></h1>
	</figure>
	<section aria-expanded="true" aria-hidden="false" class="band-middle">
		<fieldset class="panel-center">
			<legend class="center p-top-5"><h1><fmt:message key="titulo.controle.de.acesso"/></h1></legend>
			<form action="<c:url value="/login"/>" class="form-inline m-top-10" id="formlogin" method="post" name="formlogin">
				<div class="row" role="row">
					<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" role="separator">
						<label class="align-left"><fmt:message key="label.login"/></label>
						<input autofocus class="input-form full" maxlength="20" name="usuario" pattern="letraNumeroEspaco" required type="text">
					</div>
				</div>
				<div class="row" role="row">
					<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" role="separator">
						<label class="align-left"><fmt:message key="label.senha"/></label>
						<input class="input-form full" maxlength="8" name="senha" pattern="letraNumeroMin8Max8" required type="password">
					</div>
				</div>
				<button class="btn-default btn-full float-right m-top-10" type="submit"><fmt:message key="button.acessar"/></button>
			</form>
		</fieldset>
		<c:forEach var="error" items="${errors}">
			<div role="alert" class="alert alert-warning m-top-30 time-out">${error.message}</div>
		</c:forEach>
	</section>
<%@include file="/config/libraries-js.jsp"%>
</body>
</html>