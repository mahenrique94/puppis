<%@include file="/config/taglibraries.jsp"%>
<display:table class="table-default" export="false" id="obj" name="${TblPrecoItemList}" requestURI="/tabela-de-preco/item">
	<display:column headerScope="id" property="id" style="width: 50px;" titleKey="displaytag.id"/>
	<display:column headerScope="idprodutoservico.descricao" property="idprodutoservico.descricao" titleKey="displaytag.descricao"/>
	<display:column headerScope="valor" property="valor" titleKey="displaytag.valor"/>
	<display:column headerScope="valorpromocao" property="valorpromocao" titleKey="displaytag.valor.promocao"/>
	<display:column headerScope="valordesconto" property="valordesconto" titleKey="displaytag.valor.desconto"/>
	<display:column headerScope="valorparcelamento" property="valorparcelamento" titleKey="displaytag.valor.parcelamento"/>
	<display:column headerScope="valorfaturado" property="valorfaturado" titleKey="displaytag.valor.faturado"/>
	<display:column style="text-align: center;width: 165px;">
		<a class="btn-lower btn-xs" href="<c:url value="/tabela-de-preco/item/${obj.id}"/>" onclick="ModalController.show(this, event);"><i class="icon-pencil"></i>&nbsp;<fmt:message key="button.editar"/></a>
		<button class="btn-der btn-xs" formaction="<c:url value="/tabela-de-preco/item?obj.id=${obj.id}"/>" onclick="deletar(this);" type="button"><span class="icon-trash"></span>&nbsp;<fmt:message key="button.deletar"/></button>
	</display:column>
</display:table>