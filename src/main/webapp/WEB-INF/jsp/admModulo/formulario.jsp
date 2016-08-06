<%@include file="/config/taglibraries.jsp" %>
<%@include file="/config/libraries-style.jsp"%>
<form action="<c:url value="/administrador/comercio/modulo"/>" class="form-modern" data-controler="ModalController" id="formadmmodulo" method="post" name="formadmmodulo" onsubmit="return enviarPost(this);" role="form">
	<input name="obj.id" type="hidden" value="${obj.id}">
	<input name="obj.idmodulo.idaux" type="hidden" value="${obj.idmodulo.id}">
	<input name="obj.idcomercio.id" type="hidden" value="${obj.idcomercio.id}">
	<nav class="band-nav-lube" role="complementary">
		<div class="row" role="row">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" role="separator">
				<label><fmt:message key="nav.administrador.comercio.modulo"/></label>					
			</div>
		</div>
	</nav>
	<section aria-expanded="true" aria-hidden="false" class="form-body" role="form">
		<div class="row" role="row">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" role="separator">
				<label><fmt:message key="label.modulo"/></label>
				<select class="form-data validate" data-class="sl" id="slSystem_Modulo_Json_01" name="obj.idmodulo.id" required></select>
				<netsis:validationMessage name="obj.idmodulo.id"/>
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