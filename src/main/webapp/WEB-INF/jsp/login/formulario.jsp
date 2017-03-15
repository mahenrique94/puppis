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
		<div class="o-login__panel">
			<img alt="Hebi" class="o-login__logo" src="<c:url value="/assets/img/logo.png"/>">
			<fieldset class="o-login__form">
				<form action="<c:url value="/login"/>" class="o-form" id="formlogin" method="post" name="formlogin">
					<section class="o-form__body">
						<div class="l-row" role="row">
							<div class="u-grid--12" role="grid">
								<div class="o-form__group">
									<input aria-required="true" autofocus class="o-form__data o-login__data" maxlength="30" name="usuario" pattern="letraNumeroPonto" placeholder="<fmt:message key="label.usuario"/>" required type="text">
									<span class="o-form__groupElement"><label class="o-button--lube o-login__icon"><i class="icon-user"></i></label></span>
								</div>
							</div>
						</div>
						<div class="l-row" role="row">
							<div class="u-grid--12" role="grid">
								<div class="o-form__group">
									<input aria-required="true" class="o-form__data o-login__data" maxlength="8" name="senha" pattern="letraNumero" placeholder="<fmt:message key="label.senha"/>" required type="password">
									<span class="o-form__groupElement"><label class="o-button--lube o-login__icon"><i class="icon-lock"></i></label></span>
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
							<div class="u-grid--12" role="grid">
								<button class="o-button--ren o-button--large o-button--full"><fmt:message key="button.entrar"/></button>
							</div>
						</div>
						<div class="l-row" role="row">
							<p class="o-login__remember">Esqueceu sua senha ? <a class="o-login__rememberLink" href="#">clique aqui.</a></p>
						</div>
					</section>
				</form>
			</fieldset>	
		</div>
	</section>
<%@include file="/config/libraries-js.jsp"%>
</body>
</html>