<%@include file="/config/taglibraries.jsp"%>
<display:table class="table-default" export="false" id="obj" name="${FinDocumentoCentroCustoList}" requestURI="/financeiro/documento/centro-de-custo">
	<display:column headerScope="idcentrocusto.descricao" property="idcentrocusto.descricao" titleKey="displaytag.descricao"/>
	<display:column style="width: 150px;text-align: center;">
		<a class="btn-lower btn-xs" data-toggle="modal" href="<c:url value="/financeiro/documento/centro-de-custo/${obj.id}"/>"><span class="icon-pencil"></span>&nbsp;<fmt:message key="button.editar"/></a>
		<a class="btn-der btn-xs" href="<c:url value="/financeiro/documento/centro-de-custo/${obj.id}"/>" onclick="deletar(this);"><span class="icon-trash"></span>&nbsp;<fmt:message key="button.deletar"/></a>
	</display:column>
</display:table>