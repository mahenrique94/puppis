<%@include file="/config/taglibraries.jsp"%>
<display:table class="table-default" export="false" id="obj" name="${AdmUsuarioComercioList}" requestURI="/administrador/usuario/comercio">
	<display:column headerScope="idcomercio.nomerazaosocial" property="idcomercio.nomerazaosocial" titleKey="displaytag.nome.razao.social"/>
	<display:column style="text-align: center;width: 100px;">
		<button class="btn-der btn-xs" formaction="<c:url value="/administrador/usuario/comercio?obj.id=${obj.id}"/>" onclick="deletar(this);" type="button"><span class="icon-trash"></span>&nbsp;<fmt:message key="button.deletar"/></button>
	</display:column>
</display:table>