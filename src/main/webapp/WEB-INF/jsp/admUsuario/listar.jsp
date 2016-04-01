<%@include file="/config/header.jsp"%>
<form action="<c:url value="/administrador/usuario"/>" class="form-search" id="formlistaradmusuario" method="get" name="formlistaradmusuario" role="search">
	<nav class="band-nav-kal" role="complementary">
		<div class="row" role="row">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" role="separator">
				<label><fmt:message key="nav.administrador"/>&nbsp;<fmt:message key="label.barra"/>&nbsp;<fmt:message key="nav.administrador.usuario"/></label>					
			</div>
		</div>
		<div class="row" role="row">
			<div class="col-xs-3 col-sm-3 col-md-3 col-lg-3" role="separator">
				<a class="btn-lube btn-sm" href="<c:url value="/administrador/usuario/formulario"/>" title="<fmt:message key="button.novo"/>"><i class="icon-plus"></i>&nbsp;<fmt:message key="button.novo"/></a>
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
<display:table class="table-default" export="false" id="obj" name="${AdmUsuarioList}" requestURI="/administrador/usuario">
	<display:column headerScope="id" property="id" style="width: 50px;" titleKey="displaytag.id"/>
	<display:column headerScope="nome" property="nome" titleKey="displaytag.nome"/>
	<display:column headerScope="usuario" property="usuario" titleKey="displaytag.usuario"/>
	<display:column style="width: 50px;text-align: center;" titleKey="displaytag.inativo">
		<c:if test="${obj.inativo == true}"><i class="icon-ok color-green"></i></c:if>
		<c:if test="${obj.inativo == false}"><i class="icon-cancel color-red"></i></c:if>
	</display:column>
	<display:column style="width: 150px;text-align: center;">
		<a class="btn-lower btn-xs" href="<c:url value="/administrador/usuario/${obj.id}"/>"><i class="icon-pencil"></i>&nbsp;<fmt:message key="button.editar"/></a>
		<a class="btn-der btn-xs" href="<c:url value="/administrador/usuario/${obj.id}"/>" onclick="deletar(this);"><i class="icon-trash"></i>&nbsp;<fmt:message key="button.deletar"/></a>
	</display:column>
</display:table>
<%@include file="/config/footer.jsp"%>