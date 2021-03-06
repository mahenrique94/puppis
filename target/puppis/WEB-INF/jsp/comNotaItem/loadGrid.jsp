<%@include file="/config/taglibraries.jsp"%>
<display:table class="c-table--lube c-table--hovered c-table--zebrered c-table--bordered" export="false" id="obj" name="${ComNotaItemList}" requestURI="/nota-itens">
	<display:column headerScope="id" property="id" style="width: 50px;" titleKey="displaytag.id"/>
	<display:column headerScope="idprodutoservico.descricao" property="idprodutoservico.descricao" titleKey="displaytag.descricao"/>
	<display:column headerScope="valorunitario" property="valorunitario" titleKey="displaytag.valor.unitario"/>
	<display:column headerScope="quantidade" property="quantidade" titleKey="displaytag.quantidade"/>
	<display:column headerScope="valortotal" class="valortotal" property="valortotal" titleKey="displaytag.valor.total"/>
	<display:column style="text-align: center;width: 185px;">
		<a class="o-button--low o-button--small" href="<c:url value="/comercio/nota-item/${obj.id}"/>" onclick="ModalController.show(this, event);" role="link" title="<fmt:message key="button.editar"/>"><i class="icon-pencil"></i>&nbsp;<fmt:message key="button.editar"/></a>
		<button class="o-button--der o-button--small" formaction="<c:url value="/comercio/nota-item?obj.id=${obj.id}"/>" onclick="DialogController.build(event, this, requestDelete, 'Deseja confirmar a exclusao', 'icon-trash');" role="button" type="button" title="<fmt:message key="button.deletar"/>"><i class="icon-trash"></i>&nbsp;<fmt:message key="button.deletar"/></button>
	</display:column>
</display:table>