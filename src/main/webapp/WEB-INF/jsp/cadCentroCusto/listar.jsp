<%@include file="/config/header.jsp"%>
<form action="<c:url value="/cadastro/centro-de-custo"/>" class="form-modern" id="formlistarcadcentrocusto" method="get" name="formlistarcadcentrocusto" role="search">
	<nav class="band-nav-lube" role="complementary">
		<div class="row" role="row">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" role="separator">
				<label><fmt:message key="nav.cadastro"/>&nbsp;<fmt:message key="label.barra"/>&nbsp;<fmt:message key="nav.cadastro.centro.custo"/></label>					
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
<display:table class="table-default" export="false" id="obj" name="${CadCentroCustoList}" requestURI="/cadastro/centro-de-custo">
	<display:column property="descricao" headerScope="descricao" titleKey="displaytag.descricao"/>
	<display:column property="idcentrocustomaster.descricao" headerScope="idcentrocustomaster.descricao" titleKey="displaytag.descricao.master"/>
	<display:column style="width: 150px;text-align: center;">
		<a class="btn-lower btn-xs" href="<c:url value="/cadastro/centro-de-custo/${obj.id}"/>"><span class="icon-pencil"></span>&nbsp;<fmt:message key="button.editar"/></a>
		<a class="btn-der btn-xs" href="<c:url value="/cadastro/centro-de-custo/${obj.id}"/>" onclick="deletar(this);"><span class="icon-trash"></span>&nbsp;<fmt:message key="button.deletar"/></a>
	</display:column>
</display:table>
<nav class="nav-group-lube nav-fixed-bottom" role="complementary">
	<ul>
		<li><a href="<c:url value="/cadastro/centro-de-custo/formulario"/>"><i class="icon-plus"></i>&nbsp;<fmt:message key="button.novo"/></a></li>
	</ul>
</nav>
<%@include file="/config/footer.jsp"%>