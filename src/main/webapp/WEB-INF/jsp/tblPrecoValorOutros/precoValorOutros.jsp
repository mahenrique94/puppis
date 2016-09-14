<%@include file="/config/taglibraries.jsp" %>
<div class="band-default">
	<a class="btn-default btn-xs" href="<c:url value="/tabela-de-preco/valor/outros/formulario/${obj.id}"/>" onclick="ModalController.show(this, event);"><i class="icon-plus"></i>&nbsp;<fmt:message key="button.novo"/></a>
</div>
<div class="loadgrid" data-load="<c:url value="/tabela-de-preco/valor/outros/loadgrid/${obj.id}"/>" id="tblprecooutros01"></div>