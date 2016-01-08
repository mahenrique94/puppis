<%@include file="/config/taglibraries.jsp"%>
<display:table class="table-default" export="false" id="obj" name="${FinDocumentoCustoList}" requestURI="/financeiro/documento/custo">
	<display:column titleKey="displaytag.numero.documento.serie">
		<c:if test="${obj.iddocumento.serie != null}">
			${obj.iddocumento.numero} / ${obj.iddocumento.serie}
		</c:if>
		${obj.iddocumento.numero}
	</display:column>
	<display:column headerScope="desdobramento" property="desdobramento" titleKey="displaytag.desdobramento"/>
	<display:column format="{0, date, dd/MM/yyyy}" headerScope="datavencimento" property="datavencimento.time" titleKey="displaytag.data.vencimento"/>
	<display:column headerScope="valordesconto" property="valordesconto" titleKey="displaytag.valor.desconto"/>
	<display:column headerScope="valorjuros" property="valorjuros" titleKey="displaytag.valor.juros"/>
	<display:column headerScope="valortotal" property="valortotal" titleKey="displaytag.valor.total"/>
	<display:column headerScope="saldo" property="saldo" titleKey="displaytag.saldo"/>
	<display:column style="width: 150px;text-align: center;">
		<a class="btn-xs" data-toggle="modal" href="<c:url value="/financeiro/documento/custo/${obj.id}"/>"><span class="icon-pencil"></span>&nbsp;<fmt:message key="button.editar"/></a>
		<a class="btn-xs" href="<c:url value="/financeiro/documento/custo/${obj.id}"/>" onclick="deletar(this);"><span class="icon-trash"></span>&nbsp;<fmt:message key="button.deletar"/></a>
	</display:column>
</display:table>