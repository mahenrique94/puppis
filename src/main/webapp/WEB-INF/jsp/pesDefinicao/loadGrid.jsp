<%@include file="/config/taglibraries.jsp"%>
<display:table class="table-default" export="false" id="obj" name="${PesDefinicaoList}" requestURI="/pessoa/definicao">
	<display:column headerScope="id" property="id" style="width: 50px;" titleKey="displaytag.id"/>
	<display:column headerScope="idpessoa.nomerazaosocial" property="idpessoa.nomerazaosocial" titleKey="displaytag.nome.razao.social"/>
	<display:column headerScope="idtipo.descricao" property="idtipo.descricao" titleKey="displaytag.tipo"/>
	<display:column style="text-align: center;width: 50px;" titleKey="displaytag.inativo">
		<c:if test="${obj.inativo == true}"><i class="color-success icon-ok"></i></c:if>
		<c:if test="${obj.inativo == false}"><i class="color-error icon-cancel"></i></c:if>
	</display:column>
	<display:column style="width: 150px;text-align: center;">
		<a class="btn-lower btn-xs" data-toggle="modal" href="<c:url value="/pessoa/definicao/${obj.id}"/>"><i class="icon-pencil"></i>&nbsp;<fmt:message key="button.editar"/></a>
		<a class="btn-der btn-xs" href="<c:url value="/pessoa/definicao/${obj.id}"/>" onclick="deletar(this);"><i class="icon-trash"></i>&nbsp;<fmt:message key="button.deletar"/></a>
	</display:column>
</display:table>