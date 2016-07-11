<%@include file="/config/taglibraries.jsp"%>
<nav class="band-default">
	<a class="btn-default btn-xs" data-controller='ModalController' href="<c:url value="/comercio/nota-itens/formulario/${obj.id}"/>" onclick="ModalController.show(this, event);"><span class="icon-plus"></span>&nbsp;<fmt:message key="button.novo"/></a>
</nav>
<div class="loadgrid" data-load="<c:url value="/comercio/nota-itens/loadgrid/${obj.id}"/>" id="notaitens1"></div>