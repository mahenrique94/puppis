<%@include file="/config/taglibraries.jsp"%>
<div class="band-default">
	<a class="btn-default btn-xs" href="<c:url value="/administrador/usuario/tipo-de-acesso/modulo/formulario/${obj.id}"/>" onclick="ModalController.show(this, event);"><i class="icon-plus"></i>&nbsp;<fmt:message key="button.novo"/></a>
</div>
<div class="loadgrid" data-load="<c:url value="/administrador/usuario/tipo-de-acesso/modulo/loadgrid/${obj.id}"/>" id="admtipoacessomodulo01"></div>