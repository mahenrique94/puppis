<%@include file="/config/taglibraries.jsp"%>
<c:if test="${obj.dataatualizacao == null}">
	<nav class="o-band--gary">
		<a class="o-button--lube o-button--small" data-controller='ModalController' href="<c:url value="/comercio/nota-item/formulario/${obj.id}?operacao=${obj.idtipooperacao.descricao}"/>" onclick="ModalController.show(this, event);" role="link" title="<fmt:message key="button.novo"/>"><span class="icon-plus"></span>&nbsp;<fmt:message key="button.novo"/></a>
	</nav>
</c:if>
<div class="js-loadgrid" data-load="<c:url value="/comercio/nota-item/loadgrid/${obj.id}"/>" id="comnotaitem01"></div>