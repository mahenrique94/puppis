<%@include file="/config/header.jsp"%>
<form action="<c:url value="/administrador/permissao"/>" class="form-modern" id="formlistaradmpermissao" method="get" name="formlistaradmpermissao" role="search">
	<input name="parametrosWeb[0].campo" type="hidden" value="${parametrosWeb[0].campo}">
	<input name="parametrosWeb[0].parametroInicial" type="hidden" value="${parametrosWeb[0].parametroInicial}">
	<nav class="band-nav-lube" role="complementary">
		<div class="row" role="row">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" role="separator">
				<label><a href="<c:url value="/dashboard/administrador"/>"><fmt:message key="nav.administrador"/></a>&nbsp;<i class="icon-right-open"></i>&nbsp;<fmt:message key="nav.administrador.permissao"/></label>					
			</div>
		</div>
	</nav>
</form>
<display:table class="table-default" export="false" id="obj" name="${AdmPermissaoList}" requestURI="/administrador/permissao">
	<display:column headerScope="id" property="id" style="width: 50px;" titleKey="displaytag.id"/>
	<display:column headerScope="idusuario.usuario" property="idusuario.usuario" titleKey="displaytag.usuario"/>
	<display:column style="width: 50px;text-align: center;" titleKey="displaytag.deletar">
		<c:if test="${obj.deletar == true}"><i class="icon-ok color-green"></i></c:if>
		<c:if test="${obj.deletar == false}"><i class="icon-cancel color-red"></i></c:if>
	</display:column>
	<display:column style="width: 50px;text-align: center;" titleKey="displaytag.editar">
		<c:if test="${obj.editar == true}"><i class="icon-ok color-green"></i></c:if>
		<c:if test="${obj.editar == false}"><i class="icon-cancel color-red"></i></c:if>
	</display:column>
	<display:column style="width: 50px;text-align: center;" titleKey="displaytag.formulario">
		<c:if test="${obj.formulario == true}"><i class="icon-ok color-green"></i></c:if>
		<c:if test="${obj.formulario == false}"><i class="icon-cancel color-red"></i></c:if>
	</display:column>
	<display:column style="width: 50px;text-align: center;" titleKey="displaytag.listar">
		<c:if test="${obj.listar == true}"><i class="icon-ok color-green"></i></c:if>
		<c:if test="${obj.listar == false}"><i class="icon-cancel color-red"></i></c:if>
	</display:column>
	<display:column style="width: 50px;text-align: center;" titleKey="displaytag.salvar">
		<c:if test="${obj.salvar == true}"><i class="icon-ok color-green"></i></c:if>
		<c:if test="${obj.salvar == false}"><i class="icon-cancel color-red"></i></c:if>
	</display:column>
	<display:column style="text-align: center;width: 165px;">
		<a class="btn-lower btn-xs" href="<c:url value="/administrador/permissao/${obj.id}"/>"><i class="icon-pencil"></i>&nbsp;<fmt:message key="button.editar"/></a>
		<button class="btn-der btn-xs" formaction="<c:url value="/administrador/permissao?obj.id=${obj.id}"/>" onclick="deletar(this);" type="button"><span class="icon-trash"></span>&nbsp;<fmt:message key="button.deletar"/></button>
	</display:column>
</display:table>
<nav class="nav-group-tie nav-fixed-bottom" role="complementary">
	<ul>
		<li><a href="<c:url value="/administrador/permissao/formulario/${parametrosWeb[0].parametroInicial}"/>"><i class="icon-plus"></i>&nbsp;<fmt:message key="button.novo"/></a></li>
	</ul>
</nav>
<%@include file="/config/footer.jsp"%>