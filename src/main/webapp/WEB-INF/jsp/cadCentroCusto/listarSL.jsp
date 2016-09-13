<%@include file="/config/taglibraries.jsp"%>
<%@include file="/config/libraries-style.jsp"%>
<form action="<c:url value="/cadastro/centro-de-custo/listarsl"/>" class="form-modern" id="formlistarcadcentrocusto" method="get" name="formlistarcadcentrocusto" role="search">
	<input name="openBoxSearch" type="hidden" value="${param.search}">
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
	<display:column class="hidden" headerClass="hidden">
		<select class="selectOpenBox">
			<option id="id" value="${obj.id}"></option>
		</select>
	</display:column>
</display:table>
<%@include file="/config/libraries-js.jsp"%>