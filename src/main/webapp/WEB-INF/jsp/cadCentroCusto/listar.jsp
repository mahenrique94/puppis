<%@include file="/config/header.jsp"%>
<div class="container-tie">
	<div class="container-header">
		<form action="<c:url value="/cadastro/centro-de-custo"/>" class="form-search" id="formlistarcadcentrocusto" method="get" name="formlistarcadcentrocusto" role="search">
			<div class="row">
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
					<h2><fmt:message key="nav.cadastro"/>&nbsp;<fmt:message key="label.barra"/>&nbsp;<fmt:message key="nav.cadastro.centro.custo"/></h2>					
				</div>
				<div class="col-xs-12 col-sm-12 col-md-2 col-lg-1">
					<a href="<c:url value="/cadastro/centro-de-custo/formulario"/>" class="btn-md float-left" title="<fmt:message key="button.novo"/>"><span class="icon-plus"></span>&nbsp;<fmt:message key="button.novo"/></a>
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
	<display:table class="table-default" export="false" id="obj" name="${CadCentroCustoList}" requestURI="/cadastro/centro-de-custo">
		<display:column headerScope="conta" property="conta" style="width: 50px;tex-align: center;" titleKey="displaytag.conta"/>
		<display:column headerScope="subconta" property="subconta" style="width: 80px;tex-align: center;" titleKey="displaytag.sub.conta"/>
		<display:column property="descricao" headerScope="descricao" titleKey="displaytag.descricao"/>
		<display:column style="width: 150px;text-align: center;">
			<a class="btn-xs" href="<c:url value="/cadastro/centro-de-custo/${obj.id}"/>"><span class="icon-pencil"></span>&nbsp;<fmt:message key="button.editar"/></a>
			<a class="btn-xs" href="<c:url value="/cadastro/centro-de-custo/${obj.id}"/>" onclick="deletar(this);"><span class="icon-trash"></span>&nbsp;<fmt:message key="button.deletar"/></a>
		</display:column>
	</display:table>
</div>
<%@include file="/config/footer.jsp"%>