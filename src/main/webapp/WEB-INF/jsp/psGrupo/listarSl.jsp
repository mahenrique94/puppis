<%@include file="/config/taglibraries.jsp"%>
<%@include file="/config/libraries-style.jsp"%>
<div class="container-tie">
	<div class="container-header">
		<form action="<c:url value="/produto-servico/grupo/listarsl"/>" class="form-search" id="formlistarpsgrupo" method="get" name="formlistarpsgrupo" role="search">
			<div class="row">
				<div class="col-xs-12-last col-sm-12-last col-md-12-last col-lg-12-last">
					<h2><fmt:message key="nav.cadastro"/>&nbsp;<fmt:message key="label.barra"/>&nbsp;<fmt:message key="nav.cadastro.produto.servico"/>&nbsp;<fmt:message key="label.barra"/>&nbsp;<fmt:message key="nav.cadastro.produto.servico.grupo"/></h2>					
				</div>
				<div class="col-xs-4 col-sm-4 col-md-3 col-lg-2">
					<select class="select-search" data-class="displaytagSelect" name="parametrosWeb[0].campo"></select>
				</div>
				<div class="col-xs-8-last col-sm-8-last col-md-9-last col-lg-10-last">
					<input autocomplete="off" class="input-search" name="parametrosWeb[0].parametro" pattern="letraNumeroEspacoPontoTracoBarra" type="search">
				</div>
			</div>
		</form>
	</div>
	<display:table class="table-default" export="false" id="obj" name="${PsGrupoList}" requestURI="/produto-servico/grupo">
		<display:column headerScope="id" property="id" style="width: 50px;" titleKey="displaytag.id"/>
		<display:column headerScope="descricao" property="descricao" titleKey="displaytag.descricao"/>
		<display:column class="hidden" headerClass="hidden">
			<select class="selectOpenBox">
				<option id="psgrupo_id" value="${obj.id}"></option>
			</select>
		</display:column>
	</display:table>
</div>
<%@include file="/config/libraries-js.jsp"%>