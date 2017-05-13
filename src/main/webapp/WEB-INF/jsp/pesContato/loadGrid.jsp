<%@include file="/config/taglibraries.jsp"%>
<display:table class="c-table--lube c-table--hovered c-table--zebrered c-table--bordered" export="false" id="obj" name="${PesContatoList}" requestURI="/pessoa/contato">
	<display:column headerScope="id" property="id" style="width: 50px;" titleKey="displaytag.id"/>
	<display:column headerScope="nome" property="nome" titleKey="displaytag.nome"/>
	<display:column headerScope="ddd" property="ddd" titleKey="displaytag.ddd"/>
	<display:column headerScope="celular" property="celular" titleKey="displaytag.celular"/>
	<display:column headerScope="telefone" property="telefone" titleKey="displaytag.telefone"/>
	<display:column headerScope="email" property="email" titleKey="displaytag.email"/>
	<display:column style="text-align: center;width: 185px;">
		<a class="o-button--low o-button--small" href="<c:url value="/pessoa/contato/${obj.id}"/>" onclick="ModalController.show(this, event);"><i class="icon-pencil"></i>&nbsp;<fmt:message key="button.editar"/></a>
		<button class="o-button--der o-button--small" formaction="<c:url value="/pessoa/contato?obj.id=${obj.id}"/>" onclick="DialogController.build(event, this, requestDelete, 'Deseja confirmar a exclusao', 'icon-trash');" role="button" type="button" title="<fmt:message key="button.deletar"/>"><i class="icon-trash"></i>&nbsp;<fmt:message key="button.deletar"/></button>
	</display:column>
</display:table>