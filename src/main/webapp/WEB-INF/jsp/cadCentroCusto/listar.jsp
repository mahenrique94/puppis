<%@include file="/config/header.jsp"%>
<form action="<c:url value="/cadastro/centro-de-custo"/>" class="form-modern" id="formlistarcadcentrocusto" method="get" name="formlistarcadcentrocusto" role="search">
	<nav class="band-nav-lube" role="complementary">
		<div class="row" role="row">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" role="separator">
				<label><a href="<c:url value="/dashboard/cadastro"/>"><fmt:message key="nav.cadastro"/></a>&nbsp;<i class="icon-right-open"></i>&nbsp;<fmt:message key="nav.cadastro.centro.custo"/></label>					
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
<display:table class="table-default" export="false" id="obj" name="${CadCentroCustoList}" requestURI="/cadastro/centro-de-custo">
	<display:column property="descricao" headerScope="descricao" titleKey="displaytag.descricao"/>
	<display:column property="idcentrocustomaster.descricao" headerScope="idcentrocustomaster.descricao" titleKey="displaytag.descricao.master"/>
	<display:column style="text-align: center;width: 165px;">
		<a class="btn-lower btn-xs" href="<c:url value="/cadastro/centro-de-custo/${obj.id}"/>"><i class="icon-pencil"></i>&nbsp;<fmt:message key="button.editar"/></a>
		<button class="btn-der btn-xs" formaction="<c:url value="/cadastro/centro-de-custo?obj.id=${obj.id}"/>" onclick="deletar(this);" type="button"><span class="icon-trash"></span>&nbsp;<fmt:message key="button.deletar"/></button>
	</display:column>
</display:table>
<nav class="nav-group-tie nav-fixed-bottom" role="complementary">
	<ul>
		<li><a href="<c:url value="/cadastro/centro-de-custo/formulario"/>"><i class="icon-plus"></i>&nbsp;<fmt:message key="button.novo"/></a></li>
	</ul>
</nav>
<%@include file="/config/footer.jsp"%>