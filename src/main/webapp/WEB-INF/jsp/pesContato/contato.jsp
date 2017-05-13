<%@include file="/config/taglibraries.jsp"%>
<nav class="o-band--gary">
	<a class="o-button--lube o-button--small" href="<c:url value="/pessoa/contato/formulario/${obj.id}"/>" onclick="ModalController.show(this, event);" role="link" title="<fmt:message key="button.novo"/>"><i class="icon-plus"></i>&nbsp;<fmt:message key="button.novo"/></a>
</nav>
<div class="js-loadgrid" data-load="<c:url value="/pessoa/contato/loadgrid/${obj.id}"/>" id="pescontato01"></div>