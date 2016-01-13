<%@include file="/config/header.jsp"%>
<div class="container-tie">
	<div class="container-header">
		<form action="<c:url value="/administrador/comercio"/>" class="form-search" id="formlistaradmcomercio" method="get" name="formlistaradmcomercio" role="search">
			<div class="row">
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
					<h2><fmt:message key="nav.sistema"/>&nbsp;<fmt:message key="label.barra"/>&nbsp;<fmt:message key="nav.sistema.comercio"/></h2>					
				</div>
				<div class="col-xs-12 col-sm-12 col-md-2 col-lg-1">
					<a class="btn-md float-left" href="<c:url value="/administrador/comercio/formulario"/>" title="<fmt:message key="button.novo"/>"><span class="icon-plus"></span>&nbsp;<fmt:message key="button.novo"/></a>
				</div>
				<div class="col-xs-4 col-sm-4 col-md-3 col-lg-2">
					<select class="select-search" data-class="displaytagSelect" name="parametrosWeb[0].campo"></select>
				</div>
				<div class="col-xs-8 col-sm-8 col-md-7 col-lg-9">
					<input autocomplete="off" class="input-search" name="parametrosWeb[0].parametro" pattern="letraNumeroEspacoPontoTracoBarra" type="search">
				</div>
			</div>
		</form>
	</div>
	<display:table class="table-default" export="false" id="obj" name="${AdmComercioList}" requestURI="/administrador/comercio">
		<display:column headerScope="id" property="id" style="width: 50px;" titleKey="displaytag.id"/>
		<display:column headerScope="nomerazaosocial" property="nomerazaosocial" titleKey="displaytag.razao.social"/>
		<display:column headerScope="nomefantasia" property="nomefantasia" titleKey="displaytag.nome.fantasia"/>
		<display:column headerScope="documento.cpfcnpj" property="documento.cpfcnpj" style="width: 110px;" titleKey="displaytag.cpf.cnpj"/>
		<display:column headerScope="documento.rginscricaoestadual" property="documento.rginscricaoestadual" style="width: 130px;" titleKey="displaytag.rg.inscricao.estadual"/>
		<display:column style="width: 150px;text-align: center;">
			<a class="btn-xs" href="<c:url value="/administrador/comercio/${obj.id}"/>"><span class="icon-pencil"></span>&nbsp;<fmt:message key="button.editar"/></a>
			<a class="btn-xs" href="<c:url value="/administrador/comercio/${obj.id}"/>" onclick="deletar(this);"><span class="icon-trash"></span>&nbsp;<fmt:message key="button.deletar"/></a>
		</display:column>
	</display:table>
</div>
<%@include file="/config/footer.jsp"%>