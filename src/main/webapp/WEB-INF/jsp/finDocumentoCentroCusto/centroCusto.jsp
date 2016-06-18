<%@include file="/config/taglibraries.jsp"%>
<nav class="band-default">
	<a class="btn-default btn-xs" href="<c:url value="/financeiro/documento/centro-de-custo/formulario/${obj.id}"/>" onclick="ModalController.show(this, event);" title="<fmt:message key="button.novo"/>"><span class="icon-plus"></span>&nbsp;<fmt:message key="button.novo"/></a>
</nav>
<div class="loadgrid" data-load="<c:url value="/financeiro/documento/centro-de-custo/loadgrid/${obj.id}"/>" id="findocumentocentrocusto01"></div>