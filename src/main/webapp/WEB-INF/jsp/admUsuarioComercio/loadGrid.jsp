<%@include file="/config/taglibraries.jsp"%>
<display:table class="c-table--lube c-table--hovered c-table--zebrered c-table--bordered" export="false" id="obj" name="${AdmUsuarioComercioList}" requestURI="/administrador/usuario/comercio">
	<display:column headerScope="idcomercio.nomerazaosocial" property="idcomercio.nomerazaosocial" titleKey="displaytag.nome.razao.social"/>
	<display:column style="text-align: center;width: 100px;">
		<button class="o-button--der o-button--small" formaction="<c:url value="/administrador/usuario/comercio?obj.id=${obj.id}"/>" onclick="DialogController.build(event, this, requestDelete, 'Deseja confirmar a exclusao', 'icon-trash');" role="button" type="button" title="<fmt:message key="button.deletar"/>"><i class="icon-trash"></i>&nbsp;<fmt:message key="button.deletar"/></button>
	</display:column>
</display:table>