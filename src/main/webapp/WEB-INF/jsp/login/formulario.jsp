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
			</figure>
			<fieldset class="login-form">
				<legend><fmt:message key="titulo.controle.de.acesso"/></legend>
				<form action="<c:url value="/login"/>" class="form-modern" id="formlogin" method="post" name="formlogin">
					<section class="form-body">
						<div class="row" role="row">
							<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
								<div class="form-data-group">
									<input autocomplete="off" autofocus class="form-data" maxlength="20" name="usuario" pattern="letraNumero" placeholder="<fmt:message key="label.usuario"/>" required type="text" value="${usuario}">
									<span class="form-data-group-text"><i class="icon-user"></i></span>
								</div>
							</div>
						</div>
						<div class="row" role="row">
							<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
								<div class="form-data-group">
									<input autocomplete="off" class="form-data" maxlength="8" name="senha" pattern="letraNumero" placeholder="<fmt:message key="label.senha"/>" required type="password" value="${senha}">
									<div class="form-data-group-text"><i class="icon-lock"></i></div>
								</div>
							</div>
						</div>
						<c:if test="${not empty AdmUsuarioComercioList}">
							<div class="row" role="row">
								<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" role="separator">
									<select class="form-data validate" required name="idComercio" style="margin-top: 0;">
										<c:forEach items="${AdmUsuarioComercioList}" var="comercio">
											<option value="${comercio.idcomercio.id}">${comercio.idcomercio.id} - ${comercio.idcomercio.nomerazaosocial}</option>
										</c:forEach>
									</select>
								</div>
							</div>
						</c:if>
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