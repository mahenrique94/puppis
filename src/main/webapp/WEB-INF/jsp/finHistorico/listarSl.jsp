<%@include file="/config/taglibraries.jsp"%>
<%@include file="/config/libraries-style.jsp"%>
<div class="container-tie">
	<div class="container-header">
		<form action="<c:url value="/financeiro/historico/listarsl"/>" class="form-search" id="formlistarfinhistorico" method="get" name="formlistarfinhistorico" role="search">
			<div class="row">
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
					<h2><fmt:message key="nav.financeiro"/>&nbsp;<fmt:message key="label.barra"/>&nbsp;<fmt:message key="nav.financeiro.historico"/></h2>					
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
	<display:table class="table-default" export="false" id="obj" name="${FinHistoricoList}" requestURI="/financeiro/historico">
		<display:column headerScope="id" property="id" style="width: 50px;" titleKey="displaytag.id"/>
		<display:column headerScope="descricao" property="descricao" titleKey="displaytag.descricao"/>
		<display:column headerClass="hidden" class="hidden">
			<select class="selectOpenBox">
				<option id="finhistorico_id" value="${obj.id}"></option>
				<option id="finhistorico_descricao" value="${obj.descricao}"></option>
			</select>
		</display:column>
	</display:table>
</div>
<%@include file="/config/libraries-js.jsp"%>