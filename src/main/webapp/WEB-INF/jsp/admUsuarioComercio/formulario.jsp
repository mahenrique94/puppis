<%@include file="/config/taglibraries.jsp" %>
<%@include file="/config/libraries-style.jsp"%>
<form action="<c:url value="/administrador/usuario/comercio"/>" class="form-modern" data-controler="ModalController" id="formadmusuariocomercio" method="post" name="formadmusuariocomercio" onsubmit="return enviarPost(this);" role="form">
	<input name="obj.id" type="hidden" value="${obj.id}">
	<input name="obj.idcomercio.idaux" type="hidden" value="${obj.idcomercio.id}">
	<input name="obj.idusuario.id" type="hidden" value="${obj.idusuario.id}">
	<nav class="band-nav-lube" role="complementary">
		<div class="row" role="row">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" role="separator">
				<label><fmt:message key="nav.administrador.usuario.comercio"/></label>					
			</div>
		</div>
	</nav>
	<section aria-expanded="true" aria-hidden="false" class="form-body" role="form">
		<div class="row" role="row">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" role="separator">
				<label><fmt:message key="label.comercio"/></label>
				<select class="form-data validate" data-class="slAdmComercio" id="slAdministrador_Comercio_Json_01" name="obj.idcomercio.id" required></select>
				<netsis:validationMessage name="obj.idcomercio.id"/>
			</div>
		</div>
	</section>
	<nav class="nav-group-tie nav-fixed-bottom" role="complementary">
		<ul>
			<li><button title="<fmt:message key="button.salvar"/>" type="submit"><i class="icon-floppy"></i>&nbsp;<fmt:message key="button.salvar"/></button></li>
		</ul>
	</nav>
</form>
<%@include file="/config/libraries-js.jsp"%>