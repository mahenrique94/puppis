<%@include file="/config/taglibraries.jsp"%>
<%@include file="/config/libraries-style.jsp"%>
<div class="container-tie">
	<div class="container-header">
		<form action="<c:url value="/produto-servico/classe"/>" class="form-search" id="formlistarpsclasse" method="get" name="formlistarpsclasse" role="search">
			<div class="row">
				<div class="col-xs-12-last col-sm-12-last col-md-12-last col-lg-12-last">
					<h2><fmt:message key="nav.cadastro"/>&nbsp;<fmt:message key="label.barra"/>&nbsp;<fmt:message key="nav.cadastro.produto.servico"/>&nbsp;<fmt:message key="label.barra"/>&nbsp;<fmt:message key="nav.cadastro.produto.servico.classe"/></h2>					
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
	<display:table class="table-default" export="false" id="obj" name="${PsClasseList}" requestURI="/produto-servico/classe">
		<display:column headerScope="idgrupo.id" property="idgrupo.id" style="width: 60px;" titleKey="displaytag.id.grupo"/>
		<display:column headerScope="id" property="id" style="width: 50px;" titleKey="displaytag.id"/>
		<display:column headerScope="descricao" property="descricao" titleKey="displaytag.descricao"/>
		<display:column class="hidden" headerClass="hidden">
			<select class="selectOpenBox">
				<option id="psclasse_id" value=${obj.id}></option>
				<option id="psclasse_idgrupo_id" value="${obj.idgrupo.id}"></option>
			</select>
		</display:column>
	</display:table>
</div>
<%@include file="/config/libraries-js.jsp"%>