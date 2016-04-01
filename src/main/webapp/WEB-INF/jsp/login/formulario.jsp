<!DOCTYPE html>
<html>
<head>
	<%@include file="/config/taglibraries.jsp" %>
	<%@include file="/config/libraries-style.jsp"%>
	<meta charset="UTF-8">
	<meta content="width=device-width, initial-scale=1.0, maximum-scale=1" name="viewport"/>
	<link href="<c:url value="/img/favicon.ico"/>" rel="icon">
	<title><fmt:message key="titulo.pagina"/></title>
</head>
<body>
	<section class="login">
		<div class="login-panel">
			<figure class="login-logo">
				<img alt="Hebi" src="<c:url value="/img/logo.png"/>">
				<figcaption class="login-logo-legend"><fmt:message key="titulo.nome.sistema"/></figcaption>
			</figure>
			<fieldset class="login-form">
				<legend><fmt:message key="titulo.controle.de.acesso"/></legend>
				<form action="<c:url value="/login"/>" class="form-modern" id="formlogin" method="post" name="formlogin">
					<section class="form-body">
						<div class="row" role="row">
							<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
								<input autocomplete="off" autofocus class="form-data" maxlength="20" name="usuario" pattern="letraNumero" placeholder="<fmt:message key="label.usuario"/>" required type="text">
							</div>
						</div>
						<div class="row" role="row">
							<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
								<input autocomplete="off" class="form-data" maxlength="8" name="senha" pattern="letraNumero" placeholder="<fmt:message key="label.senha"/>" required type="password">
							</div>
						</div>
						<div class="row" role="row">
							<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
								<button class="btn-lube-modern btn-lg btn-full"><fmt:message key="button.entrar"/></button>
							</div>
						</div>
						<div class="row">
							<p class="login-remember">Esqueceu sua senha ? <a href="#">clique aqui</a></p>
						</div>
					</section>
				</form>
			</fieldset>	
		</div>
	</section>
<%@include file="/config/libraries-js.jsp"%>
</body>
</html>