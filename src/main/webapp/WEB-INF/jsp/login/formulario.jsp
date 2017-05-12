<!DOCTYPE html>
<html>
<head>
	<%@include file="/config/taglibraries.jsp" %>
	<%@include file="/config/libraries-style.jsp"%>
	<meta charset="UTF-8">
	<meta content="width=device-width, initial-scale=1.0, maximum-scale=1" name="viewport"/>
	<link href="<c:url value="/assets/img/favicon.ico"/>" rel="icon">
	<title><fmt:message key="titulo.pagina"/></title>
</head>
<body>
	<%@include file="/config/mensagens.jsp"%>
	<section class="o-login">
		<img alt="Puppis" class="o-login__logo" src="<c:url value="/assets/img/logo.png"/>" role="presentation">
		<div class="o-login__wrap">
			<div class="o-login__panel">
				<fieldset class="o-login__form">
					<legend class="o-login__title"><fmt:message key="titulo.controle.de.acesso"/></legend>
					<form action="<c:url value="/login"/>" class="o-form" id="formlogin" method="post" name="formlogin" role="form">
						<section class="o-form__body">
							<div class="l-row" role="row">
								<div class="u-grid--12" role="grid">
									<div class="o-login__group">
										<i class="o-login__icon icon-user"></i>
										<input aria-required="true" autofocus class="o-login__data" maxlength="30" name="usuario" pattern="letraNumeroPonto" placeholder="<fmt:message key="label.usuario"/>" required type="text">
									</div>
								</div>
							</div>
							<div class="l-row" role="row">
								<div class="u-grid--12" role="grid">
									<div class="o-login__group">
										<i class="o-login__icon icon-lock"></i>
										<input aria-required="true" class="o-login__data" maxlength="8" name="senha" pattern="letraNumeroMin8Max8" placeholder="<fmt:message key="label.senha"/>" required type="password">
									</div>
								</div>
							</div>
							<c:if test="${not empty AdmUsuarioComercioList}">
								<div class="l-row" role="row">
									<div class="u-grid--12" role="grid">
										<select aria-required="true" class="o-form__data" name="idComercio" required>
											<c:forEach items="${AdmUsuarioComercioList}" var="comercio">
												<option value="${comercio.idcomercio.id}">${comercio.idcomercio.id} - ${comercio.idcomercio.nomerazaosocial}</option>
											</c:forEach>
										</select>
									</div>
								</div>
							</c:if>
							<div class="l-row" role="row">
								<div class="u-grid--12" role="grid" style="margin: 0;">
									<button class="o-button--lube o-login__button" role="button" title="<fmt:message key="button.entrar"/>" type="submit"><i class="icon-lock-open"></i>&nbsp;<fmt:message key="button.entrar"/></button>
								</div>
							</div>
						</section>
					</form>
				</fieldset>	
			</div>
			<div class="o-login__panel" style="padding: .5rem;">
				<div class="l-row" role="row">
					<p class="o-login__remember"><fmt:message key="label.esqueceu.senha"/>&nbsp;<a class="o-login__rememberLink" href="#" role="link" title="clique aqui"><fmt:message key="label.clique.aqui"/><fmt:message key="label.ponto"/></a></p>
				</div>
			</div>
		</div>
	</section>
<%@include file="/config/libraries-js.jsp"%>
</body>
</html>