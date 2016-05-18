<%@include file="/config/header.jsp"%>
<form action="<c:url value="/administrador/usuario/tipo-de-acesso"/>" class="form-modern" id="formlistaradmusuariotipoacesso" method="get" name="formlistaradmusuariotipoacesso" role="search">
	<nav class="band-nav-lube" role="complementary">
		<div class="row" role="row">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" role="separator">
				<label><fmt:message key="nav.administrador"/>&nbsp;<fmt:message key="label.barra"/>&nbsp;<fmt:message key="nav.administrador.usuario.tipo.acesso"/></label>					
			</div>
		</div>
		<div class="row" role="row">
			<div class="col-xs-3 col-sm-3 col-md-3 col-lg-3" role="separator">
				<select class="form-data" data-class="displaytagSelect" name="parametrosWeb[0].campo"></select>
			</div>
			<div class="col-xs-9 col-sm-9 col-md-9 col-lg-9" role="separator">
				<div class="form-data-group">
					<input autocomplete="off" class="form-data" name="parametrosWeb[0].parametro" pattern="letraNumeroEspacoPontoTracoBarra" type="text">
					<span class="form-data-group-btn"><button class="btn-default"><i class="icon-search"></i></button></span>
				</div>
			</div>
		</div>
	</nav>	
</form>
<display:table class="table-default" export="false" id="obj" name="${AdmUsuarioTipoAcessoList}" requestURI="/administrador/usuario/tipo-de-acesso">
	<display:column headerScope="id" property="id" style="width: 50px;" titleKey="displaytag.id"/>
	<display:column headerScope="descricao" property="descricao" titleKey="displaytag.descricao"/>
	<display:column style="text-align: center;width: 50px;" titleKey="displaytag.deletar">
		<c:if test="${obj.deletar == true}"><i class="color-success icon-ok"></i></c:if>
		<c:if test="${obj.deletar == false}"><i class="color-error icon-cancel"></i></c:if>
	</display:column>
	<display:column style="text-align: center;width: 50px;" titleKey="displaytag.editar">
		<c:if test="${obj.editar == true}"><i class="color-success icon-ok"></i></c:if>
		<c:if test="${obj.editar == false}"><i class="color-error icon-cancel"></i></c:if>
	</display:column>
	<display:column style="text-align: center;width: 50px;" titleKey="displaytag.listar">
		<c:if test="${obj.listar == true}"><i class="color-success icon-ok"></i></c:if>
		<c:if test="${obj.listar == false}"><i class="color-error icon-cancel"></i></c:if>
	</display:column>
	<display:column style="text-align: center;width: 50px;" titleKey="displaytag.salvar">
		<c:if test="${obj.salvar == true}"><i class="color-success icon-ok"></i></c:if>
		<c:if test="${obj.salvar == false}"><i class="color-error icon-cancel"></i></c:if>
	</display:column>
	<display:column style="text-align: center;width: 150px;">
		<a class="btn-lower btn-xs" href="<c:url value="/administrador/usuario/tipo-de-acesso/${obj.id}"/>"><i class="icon-pencil"></i>&nbsp;<fmt:message key="button.editar"/></a>
		<a class="btn-der btn-xs" href="<c:url value="/administrador/usuario/tipo-de-acesso/${obj.id}"/>" onclick="deletar(this);"><i class="icon-trash"></i>&nbsp;<fmt:message key="button.deletar"/></a>
	</display:column>
</display:table>
<nav class="nav-group-lube nav-fixed-bottom" role="complementary">
	<ul>
		<li><a href="<c:url value="/administrador/usuario/tipo-de-acesso/formulario"/>"><i class="icon-plus"></i>&nbsp;<fmt:message key="button.novo"/></a></li>
	</ul>
</nav>
<%@include file="/config/footer.jsp"%>