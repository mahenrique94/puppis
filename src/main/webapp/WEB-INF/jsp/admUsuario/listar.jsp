<%@include file="/config/header.jsp"%>
<fieldset class="block-lube">
	<legend class="block-header">
		<h1 class="block-title"><label><fmt:message key="nav.sistema"/>&nbsp;<fmt:message key="label.barra"/>&nbsp;<fmt:message key="nav.sistema.usuario"/></label></h1>
	</legend>
	<form action="<c:url value="/usuario"/>" class="form-search" id="formlistaradmusuario" method="get" name="formlistaradmusuario" role="search">
		<nav class="clearfix nav-block" role="navigation">
			<div class="w-25"><a href="<c:url value="/usuario/formulario"/>" class="btn-md float-left m-right-5" title="<fmt:message key="button.novo"/>"><span class="icon-plus"></span>&nbsp;<fmt:message key="button.novo"/></a></div>
			<div class="w-15"><select class="select-search" data-class="displaytagSelect" name="parametrosWeb[0].campo"></select></div>
			<div class="w-60">
				<input autocomplete="off" class="input-search" name="parametrosWeb[0].parametro" pattern="letraNumeroEspacoPontoTracoBarra" type="search">
			</div>
		</nav>
	</form>
	<section class="block-body no-padding">
		<display:table class="table-default" export="false" id="obj" name="${AdmUsuarioList}" requestURI="/usuario">
			<display:column headerScope="id" property="id" style="width: 50px;" titleKey="displaytag.id"/>
			<display:column headerScope="nome" property="nome" titleKey="displaytag.nome"/>
			<display:column headerScope="usuario" property="usuario" titleKey="displaytag.usuario"/>
			<display:column style="width: 50px;text-align: center;" titleKey="displaytag.inativo">
				<c:if test="${obj.inativo.equals('T')}"><span class="icon-ok green"></span></c:if>
				<c:if test="${obj.inativo.equals('F')}"><span class="icon-remove red"></span></c:if>
			</display:column>
			<display:column style="width: 150px;text-align: center;">
				<a class="btn-xs" href="<c:url value="/usuario/${obj.id}"/>"><span class="icon-pencil"></span>&nbsp;<fmt:message key="button.editar"/></a>
				<a class="btn-xs" href="<c:url value="/usuario/${obj.id}"/>" onclick="deletar(this);"><span class="icon-trash"></span>&nbsp;<fmt:message key="button.deletar"/></a>
			</display:column>
		</display:table>
	</section>
</fieldset>
<%@include file="/config/footer.jsp"%>