<%@include file="/config/header.jsp"%>
<form action="<c:url value="/administrador/usuario/grupo"/>" class="form-search" id="formlistaradmusuariogrupo" method="get" name="formlistaradmusuariogrupo" role="search">
	<nav class="band-nav-kal" role="complementary">
		<div class="row" role="row">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" role="separator">
				<label><fmt:message key="nav.administrador"/>&nbsp;<fmt:message key="label.barra"/>&nbsp;<fmt:message key="nav.administrador.usuario.grupo"/></label>					
			</div>
		</div>
		<div class="row" role="row">
			<div class="col-xs-3 col-sm-3 col-md-3 col-lg-3" role="separator">
				<a class="btn-lube btn-sm" href="<c:url value="/administrador/usuario/grupo/formulario"/>" title="<fmt:message key="button.novo"/>"><i class="icon-plus"></i>&nbsp;<fmt:message key="button.novo"/></a>
			</div>
			<div class="col-xs-3 col-sm-3 col-md-3 col-lg-3" role="separator">
				<select class="form-data" data-class="displaytagSelect" name="parametrosWeb[0].campo"></select>
			</div>
			<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6" role="separator">
				<input autocomplete="off" class="form-data" name="parametrosWeb[0].parametro" pattern="letraNumeroEspacoPontoTracoBarra" type="search">
			</div>
		</div>
	</nav>
</form>
<display:table class="table-default" export="false" id="obj" name="${AdmUsuarioGrupoList}" requestURI="/administrador/usuario/grupo">
	<display:column headerScope="id" property="id" style="width: 50px;" titleKey="displaytag.id"/>
	<display:column headerScope="descricao" property="descricao" titleKey="displaytag.descricao"/>
	<display:column headerScope="idtipoacesso.descricao" property="idtipoacesso.descricao" titleKey="displaytag.tipo.acesso"/>
	<display:column style="width: 150px;text-align: center;">
		<a class="btn-lower btn-xs" href="<c:url value="/administrador/usuario/grupo/${obj.id}"/>"><i class="icon-pencil"></i>&nbsp;<fmt:message key="button.editar"/></a>
		<a class="btn-der btn-xs" href="<c:url value="/administrador/usuario/grupo/${obj.id}"/>" onclick="deletar(this);"><i class="icon-trash"></i>&nbsp;<fmt:message key="button.deletar"/></a>
	</display:column>
</display:table>
<%@include file="/config/footer.jsp"%>