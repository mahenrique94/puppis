<%@include file="/config/taglibraries.jsp"%>
<display:table class="table-default" export="false" id="obj" name="${PsComposicaoList}" requestURI="/produto-servico/composicao">
	<display:column headerScope="idcomposicao.descricao" property="idcomposicao.descricao" titleKey="displaytag.descricao"/>
	<display:column headerScope="quantidade" property="quantidade" titleKey="displaytag.quantidade"/>
	<display:column style="text-align: center;width: 165px;">
		<a class="btn-lower btn-xs" href="<c:url value="/produto-servico/composicao/${obj.id}"/>" onclick="ModalController.show(this, event);"><i class="icon-pencil"></i>&nbsp;<fmt:message key="button.editar"/></a>
		<button class="btn-der btn-xs" formaction="<c:url value="/produto-servico/composicao?obj.id=${obj.id}"/>" onclick="deletar(this);" type="button"><span class="icon-trash"></span>&nbsp;<fmt:message key="button.deletar"/></button>
	</display:column>
</display:table>