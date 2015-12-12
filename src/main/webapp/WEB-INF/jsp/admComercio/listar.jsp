<%@include file="/config/header.jsp"%>
<fieldset class="block-lube">
	<legend class="block-header">
		<h1 class="block-title"><label><fmt:message key="nav.sistema"/>&nbsp;<fmt:message key="label.barra"/>&nbsp;<fmt:message key="nav.sistema.comercio"/></label></h1>
	</legend>
	<form action="<c:url value="/comercio"/>" class="form-search" id="formlistaradmcomercio" method="get" name="formlistaradmcomercio" role="search">
		<nav class="clearfix nav-block" role="navigation">
			<div class="w-25"><a href="<c:url value="/comercio/formulario"/>" class="btn-md float-left m-right-5" title="<fmt:message key="button.novo"/>"><span class="icon-plus"></span>&nbsp;<fmt:message key="button.novo"/></a></div>
			<div class="w-15"><select class="select-search" data-class="displaytagSelect" name="parametrosWeb[0].campo"></select></div>
			<div class="w-60">
				<input autocomplete="off" class="input-search" name="parametrosWeb[0].parametro" pattern="letraNumeroEspacoPontoTracoBarra" type="search">
			</div>
		</nav>
	</form>
	<section class="block-body no-padding">
		<display:table class="table-default" export="false" id="obj" name="${AdmComercioList}" requestURI="/comercio">
			<display:column headerScope="id" property="id" style="width: 50px;" titleKey="displaytag.id"/>
			<display:column headerScope="razaosocial" property="razaosocial" titleKey="displaytag.razao.social"/>
			<display:column headerScope="nomefantasia" property="nomefantasia" titleKey="displaytag.nome.fantasia"/>
			<display:column headerScope="documento.cnpj" property="documento.cnpj" style="width: 110px;" titleKey="displaytag.cnpj"/>
			<display:column headerScope="documento.inscricaoestadual" property="documento.inscricaoestadual" style="width: 110px;" titleKey="displaytag.inscricao.estadual"/>
			<display:column style="width: 150px;text-align: center;">
				<a class="btn-xs" href="<c:url value="/comercio/${obj.id}"/>"><span class="icon-pencil"></span>&nbsp;<fmt:message key="button.editar"/></a>
				<a class="btn-xs" href="<c:url value="/comercio/${obj.id}"/>" onclick="deletar(this);"><span class="icon-trash"></span>&nbsp;<fmt:message key="button.deletar"/></a>
			</display:column>
		</display:table>
	</section>
</fieldset>
<%@include file="/config/footer.jsp"%>