<%@include file="/config/taglibraries.jsp"%>
<c:if test="${obj.dataatualizacao == null}">
	<nav class="band-default">
		<a class="btn-default btn-xs" data-controller='ModalController' href="<c:url value="/comercio/nota-item/formulario/${obj.id}?operacao=${obj.idtipooperacao.descricao}"/>" onclick="ModalController.show(this, event);"><span class="icon-plus"></span>&nbsp;<fmt:message key="button.novo"/></a>
	</nav>
</c:if>
<div class="loadgrid" data-load="<c:url value="/comercio/nota-item/loadgrid/${obj.id}"/>" id="comnotaitem01"></div>