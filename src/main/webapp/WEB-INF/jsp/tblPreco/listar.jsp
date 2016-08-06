<%@include file="/config/header.jsp"%>
<form action="<c:url value="/tabela-de-preco"/>" class="form-modern" id="formlistartblpreco" method="get" name="formlistartblpreco" role="search">
	<nav class="band-nav-lube" role="complementary">
		<div class="row" role="row">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" role="separator">
				<label><a href="<c:url value="/dashboard/cadastro"/>"><fmt:message key="nav.cadastro"/></a>&nbsp;<i class="icon-right-open"></i>&nbsp;<fmt:message key="nav.cadastro.tabela.preco"/></label>					
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
<display:table class="table-default" export="false" id="obj" name="${TblPrecoList}" requestURI="/tabela-de-preco">
	<display:column headerScope="id" property="id" style="width: 50px;" titleKey="displaytag.id"/>
	<display:column format="{0, date, dd/MM/yyyy HH:mm}" headerScope="datavigenciainicial" property="datavigenciainicial.time" titleKey="displaytag.data.vigencia.inicial"/>
	<display:column format="{0, date, dd/MM/yyyy HH:mm}" headerScope="datavigenciafinal" property="datavigenciafinal.time" titleKey="displaytag.data.vigencia.final"/>
	<display:column style="text-align: center;width: 50px;">
		<c:if test="${obj.inativo == false}"><i class="color-green icon-ok"></i></c:if>
		<c:if test="${obj.inativo == true}"><i class="color-red icon-cancel"></i></c:if>
	</display:column>
	<display:column style="text-align: center;width: 165px;">
		<a class="btn-lower btn-xs" href="<c:url value="/tabela-de-preco/${obj.id}"/>"><span class="icon-pencil"></span>&nbsp;<fmt:message key="button.editar"/></a>
		<button class="btn-der btn-xs" formaction="<c:url value="/tabela-de-preco?obj.id=${obj.id}"/>" onclick="deletar(this);" type="button"><span class="icon-trash"></span>&nbsp;<fmt:message key="button.deletar"/></button>
	</display:column>
</display:table>
<nav class="nav-group-tie nav-fixed-bottom" role="complementary">
	<ul>
		<li><a href="<c:url value="/tabela-de-preco/formulario"/>"><i class="icon-plus"></i>&nbsp;<fmt:message key="button.novo"/></a></li>
	</ul>
</nav>
<%@include file="/config/footer.jsp"%>