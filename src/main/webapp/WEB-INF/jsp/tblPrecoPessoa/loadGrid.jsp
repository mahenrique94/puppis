<%@include file="/config/taglibraries.jsp"%>
<display:table class="table-default" export="false" id="obj" name="${TblPrecoPessoaList}" requestURI="/tabela-de-preco/pessoa">
	<display:column headerScope="id" property="id" style="width: 50px;" titleKey="displaytag.id"/>
	<display:column headerScope="iddefinicao.idpessoa.nomerazaosocial" property="iddefinicao.idpessoa.nomerazaosocial" titleKey="displaytag.nome.razao.social"/>
	<display:column headerScope="iddefinicao.idtipo.descricao" property="iddefinicao.idtipo.descricao" titleKey="displaytag.tipo"/>
	<display:column style="text-align: center;width: 165px;">
		<a class="btn-lower btn-xs" href="<c:url value="/tabela-de-preco/pessoa/${obj.id}"/>" onclick="ModalController.show(this, event);"><i class="icon-pencil"></i>&nbsp;<fmt:message key="button.editar"/></a>
		<button class="btn-der btn-xs" formaction="<c:url value="/tabela-de-preco/pessoa?obj.id=${obj.id}"/>" onclick="deletar(this);" type="button"><span class="icon-trash"></span>&nbsp;<fmt:message key="button.deletar"/></button>
	</display:column>
</display:table>