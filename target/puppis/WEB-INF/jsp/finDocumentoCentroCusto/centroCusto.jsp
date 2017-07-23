<%@include file="/config/taglibraries.jsp"%>
<c:if test="${obj.datapagamento == null}">
	<nav class="o-band--gary">
		<a class="o-button--lube o-button--small" href="<c:url value="/financeiro/documento/centro-de-custo/formulario/${obj.id}"/>" onclick="ModalController.show(this, event);" role="link" title="<fmt:message key="button.novo"/>"><span class="icon-plus"></span>&nbsp;<fmt:message key="button.novo"/></a>
	</nav>
</c:if>
<div class="js-loadgrid" data-load="<c:url value="/financeiro/documento/centro-de-custo/loadgrid/${obj.id}"/>" id="findocumentocentrocusto01"></div>