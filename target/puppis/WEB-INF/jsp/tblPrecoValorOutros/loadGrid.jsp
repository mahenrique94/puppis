<%@include file="/config/taglibraries.jsp"%>
<display:table class="c-table--lube c-table--hovered c-table--zebrered c-table--bordered" export="false" id="obj" name="${TblPrecoValorOutrosList}" requestURI="/tabela-de-preco/valor/outros">
	<display:column headerScope="id" property="id" style="width: 50px;" titleKey="displaytag.id"/>
	<display:column headerScope="descricao" property="descricao" titleKey="displaytag.descricao"/>
	<display:column headerScope="valor" property="valor" titleKey="displaytag.valor"/>
	<display:column style="text-align: center;width: 185px;">
		<a class="o-button--low o-button--small" href="<c:url value="/tabela-de-preco/valor/outros/${obj.id}"/>" onclick="ModalController.show(this, event);" role="link" title="<fmt:message key="button.editar"/>"><i class="icon-pencil"></i>&nbsp;<fmt:message key="button.editar"/></a>
		<button class="o-button--der o-button--small" formaction="<c:url value="/tabela-de-preco/valor/outros?obj.id=${obj.id}"/>" onclick="DialogController.build(event, this, requestDelete, 'Deseja confirmar a exclusao', 'icon-trash');" role="button" type="button" title="<fmt:message key="button.deletar"/>"><i class="icon-trash"></i>&nbsp;<fmt:message key="button.deletar"/></button>
	</display:column>
</display:table>