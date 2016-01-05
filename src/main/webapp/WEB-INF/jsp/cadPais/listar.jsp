<%@include file="/config/header.jsp"%>
<div class="container-tie">
	<div class="container-header">
		<form action="<c:url value="/cadastro/pais"/>" class="form-search" id="formlistarcadpais" method="get" name="formlistarcadpais" role="search">
			<div class="row">
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
					<h2><fmt:message key="nav.cadastro"/>&nbsp;<fmt:message key="label.barra"/>&nbsp;<fmt:message key="nav.cadastro.pais"/></h2>					
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
	<display:table class="table-default" export="false" id="obj" name="${CadPaisList}" requestURI="/cadastro/pais">
		<display:column headerScope="id" property="id" style="width: 50px;" titleKey="displaytag.id"/>
		<display:column headerScope="descricao" property="descricao" titleKey="displaytag.pais"/>
	</display:table>
</div>
<%@include file="/config/footer.jsp"%>