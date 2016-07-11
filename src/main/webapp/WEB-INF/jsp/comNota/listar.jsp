<%@include file="/config/header.jsp"%>
<form action="<c:url value="/comercio/nota"/>" class="form-modern" id="formlistarcomnota" method="get" name="formlistarcomnota" role="search">
	<nav class="band-nav-lube" role="complementary">
		<div class="row" role="row">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" role="separator">
				<label><a href="<c:url value="/dashboard/comercio"/>"><fmt:message key="nav.comercio"/></a>&nbsp;<i class="icon-right-open"></i>&nbsp;<fmt:message key="nav.comercio.nota"/></label>					
			</div>
		</div>
		<div class="row" role="row">
			<div class="col-xs-3 col-sm-3 col-md-3 col-lg-3" role="separator">
				<select class="form-data" data-class="displaytagSelect" name="parametrosWeb[0].campo"></select>
			</div>
			<div class="col-xs-9 col-sm-9 col-md-9 col-lg-9" role="separator">
				<div class="form-data-group">
					<input autocomplete="off" class="form-data" name="parametrosWeb[0].parametroInicial" pattern="letraNumeroEspacoPontoTracoBarra" type="text">
					<span class="form-data-group-btn"><button class="btn-default"><i class="icon-search"></i></button></span>
				</div>
			</div>
		</div>
	</nav>
</form>
<display:table class="table-default" export="false" id="obj" name="${ComNotaList}" requestURI="/nota">
	<display:column headerScope="id" property="id" style="width: 50px;" titleKey="displaytag.id"/>
	<display:column headerScope="iddefinicao.idpessoa.nomerazaosocial" property="iddefinicao.idpessoa.nomerazaosocial" titleKey="displaytag.razao.social"/>
	<display:column headerScope="idusuario.usuario" property="idusuario.usuario" titleKey="displaytag.usuario"/>
	<display:column headerScope="idtipooperacao.descricao" property="idtipooperacao.descricao" style="width: 70px;" titleKey="displaytag.operacao"/>
	<display:column style="width: 150px;text-align: center;">
		<a class="btn-lower btn-xs" href="<c:url value="/comercio/nota/${obj.id}"/>"><span class="icon-pencil"></span>&nbsp;<fmt:message key="button.editar"/></a>
		<a class="btn-der btn-xs" href="<c:url value="/comercio/nota?obj.id=${obj.id}"/>" onclick="deletar(this);"><span class="icon-trash"></span>&nbsp;<fmt:message key="button.deletar"/></a>
	</display:column>
</display:table>
<nav class="nav-group-tie nav-fixed-bottom" role="complementary">
	<ul>
		<li><a href="<c:url value="/comercio/nota/formulario"/>"><i class="icon-plus"></i>&nbsp;<fmt:message key="button.novo"/></a></li>
	</ul>
</nav>
<%@include file="/config/footer.jsp"%>