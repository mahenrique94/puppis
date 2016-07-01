<%@include file="/config/taglibraries.jsp"%>
<display:table class="table-default" export="false" id="obj" name="${PesContatoList}" requestURI="/pessoa/contato">
	<display:column headerScope="id" property="id" style="width: 50px;" titleKey="displaytag.id"/>
	<display:column headerScope="ddd" property="ddd" titleKey="displaytag.ddd"/>
	<display:column headerScope="celular" property="celular" titleKey="displaytag.celular"/>
	<display:column headerScope="telefone" property="telefone" titleKey="displaytag.telefone"/>
	<display:column headerScope="email" property="email" titleKey="displaytag.email"/>
	<display:column style="width: 150px;text-align: center;">
		<a class="btn-lower btn-xs" href="<c:url value="/pessoa/contato/${obj.id}"/>" onclick="ModalController.show(this, event);"><i class="icon-pencil"></i>&nbsp;<fmt:message key="button.editar"/></a>
		<button class="btn-der btn-xs" formaction="<c:url value="/pessoa/contato?obj.id=${obj.id}"/>" onclick="deletar(this);" type="button"><span class="icon-trash"></span>&nbsp;<fmt:message key="button.deletar"/></button>
	</display:column>
</display:table>