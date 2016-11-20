<%@include file="/config/taglibraries.jsp"%>
<nav class="band-default">
	<a class="btn-default btn-xs" href="<c:url value="/produto-servico/composicao/formulario/${obj.id}"/>" onclick="ModalController.show(this, event);"><i class="icon-plus"></i>&nbsp;<fmt:message key="button.novo"/></a>
</nav>
<div class="loadgrid" data-load="<c:url value="/produto-servico/composicao/loadgrid/${obj.id}"/>" id="pscomposicao01"></div>