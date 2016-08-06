<%@include file="/config/taglibraries.jsp"%>
<display:table class="table-default" export="false" id="obj" name="${AdmModuloList}" requestURI="/administrador/comercio/modulo">
	<display:column headerScope="idmodulo.descricao" property="idmodulo.descricao" titleKey="displaytag.descricao"/>
	<display:column style="text-align: center;width: 100px;">
		<button class="btn-der btn-xs" formaction="<c:url value="/administrador/comercio/modulo?obj.id=${obj.id}"/>" onclick="deletar(this);" type="button"><span class="icon-trash"></span>&nbsp;<fmt:message key="button.deletar"/></button>
	</display:column>
</display:table>