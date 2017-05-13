<%@include file="/config/taglibraries.jsp"%>
<div class="o-band--gary">
	<a class="o-button--lube o-button--small" href="<c:url value="/administrador/comercio/modulo/formulario/${obj.id}"/>" onclick="ModalController.show(this, event);" role="link" title="<fmt:message key="button.novo"/>"><i class="icon-plus"></i>&nbsp;<fmt:message key="button.novo"/></a>
</div>
<div class="js-loadgrid" data-load="<c:url value="/administrador/comercio/modulo/loadgrid/${obj.id}"/>" id="admmodulo01"></div>