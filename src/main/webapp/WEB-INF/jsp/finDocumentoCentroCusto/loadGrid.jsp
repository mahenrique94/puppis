<%@include file="/config/taglibraries.jsp"%>
<display:table class="table-default" export="false" id="obj" name="${FinDocumentoCentroCustoList}" requestURI="/financeiro/documento/centro-de-custo">
	<display:column headerScope="idcentrocusto.descricao" property="idcentrocusto.descricao" titleKey="displaytag.descricao"/>
	<display:column style="text-align: center;width: 165px;">
		<a class="btn-lower btn-xs" href="<c:url value="/financeiro/documento/centro-de-custo/${obj.id}"/>" onclick="ModalController.show(this, event);"><span class="icon-pencil"></span>&nbsp;<fmt:message key="button.editar"/></a>
		<button class="btn-der btn-xs" formaction="<c:url value="/financeiro/documento/centro-de-custo?obj.id=${obj.id}"/>" onclick="deletar(this);" type="button"><span class="icon-trash"></span>&nbsp;<fmt:message key="button.deletar"/></button>
	</display:column>
</display:table>