<%@include file="/config/taglibraries.jsp"%>
<display:table class="table-default w-100-3" export="false" id="obj" name="${PesContatoList}" requestURI="/contato">
	<display:column headerScope="id" property="id" style="width: 50px;" titleKey="displaytag.id"/>
	<display:column headerScope="ddd" property="ddd" titleKey="displaytag.ddd"/>
	<display:column headerScope="celular" property="celular" titleKey="displaytag.celular"/>
	<display:column headerScope="telefone" property="telefone" titleKey="displaytag.telefone"/>
	<display:column headerScope="email" property="email" titleKey="displaytag.email"/>
	<display:column style="width: 150px;text-align: center;">
		<a class="btn-xs" data-toggle="modal" href="<c:url value="/contato/${obj.id}"/>"><span class="icon-pencil"></span>&nbsp;<fmt:message key="button.editar"/></a>
		<a class="btn-xs" href="<c:url value="/contato/${obj.id}"/>" onclick="deletar(this);"><span class="icon-trash"></span>&nbsp;<fmt:message key="button.deletar"/></a>
	</display:column>
</display:table>