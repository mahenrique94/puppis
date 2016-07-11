<%@include file="/config/taglibraries.jsp"%>
<display:table class="table-default" export="false" id="obj" name="${ComNotaItensList}" requestURI="/nota-itens">
	<display:column headerScope="id" property="id" style="width: 50px;" titleKey="displaytag.id"/>
	<display:column headerScope="idprodutoservico.descricao" property="idprodutoservico.descricao" titleKey="displaytag.descricao"/>
	<display:column headerScope="valorunitario" property="valorunitario" titleKey="displaytag.valor.unitario"/>
	<display:column headerScope="quantidade" property="quantidade" titleKey="displaytag.quantidade"/>
	<display:column headerScope="valortotal" class="valortotal" property="valortotal" titleKey="displaytag.valor.total"/>
	<display:column style="width: 150px;text-align: center;">
		<a class="btn-xs" data-toggle="ModalController" href="<c:url value="/comercio/nota-itens/${obj.id}"/>" onclick="ModalController.show(this, event);"><i class="icon-pencil"></i>&nbsp;<fmt:message key="button.editar"/></a>
		<a class="btn-xs" href="<c:url value="/comercio/nota-itens/${obj.id}"/>" onclick="deletar(this);"><i class="icon-trash"></i>&nbsp;<fmt:message key="button.deletar"/></a>
	</display:column>
</display:table>