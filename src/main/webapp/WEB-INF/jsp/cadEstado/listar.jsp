<%@include file="/config/header.jsp"%>
<div class="container-tie">
	<div class="container-header">
		<form action="<c:url value="/cadastro/estado"/>" class="form-search" id="formlistarcadestado" method="get" name="formlistarcadestado" role="search">
			<div class="row">
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
					<h2><fmt:message key="nav.cadastro"/>&nbsp;<fmt:message key="label.barra"/>&nbsp;<fmt:message key="nav.cadastro.estado"/></h2>					
				</div>
				<div class="col-xs-4 col-sm-4 col-md-3 col-lg-2">
					<select class="select-search" data-class="displaytagSelect" name="parametrosWeb[0].campo"></select>
				</div>
				<div class="col-xs-8 col-sm-8 col-md-9 col-lg-10">
					<input autocomplete="off" class="input-search" name="parametrosWeb[0].parametro" pattern="letraNumeroEspacoPontoTracoBarra" type="search">
				</div>
			</div>
		</form>
	</div>
	<display:table class="table-default" export="false" id="obj" name="${CadEstadoList}" requestURI="/cadastro/estado">
		<display:column headerScope="id" property="id" style="width: 50px;" titleKey="displaytag.id"/>
		<display:column property="descricao" headerScope="descricao" titleKey="displaytag.estado"/>
		<display:column headerScope="uf" property="uf" style="width: 50px;text-align: center;" titleKey="displaytag.uf"/>
	</display:table>
</div>
<%@include file="/config/footer.jsp"%>