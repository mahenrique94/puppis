<%@include file="/config/taglibraries.jsp"%>
<%@include file="/config/libraries-style.jsp"%>
<fieldset class="block-lube">
	<legend class="block-header">
		<h1 class="block-title"><label><fmt:message key="nav.cadastro"/>&nbsp;<fmt:message key="label.barra"/>&nbsp;<fmt:message key="nav.cadastro.produto.servico"/>&nbsp;<fmt:message key="label.barra"/>&nbsp;<fmt:message key="nav.cadastro.produto.servico.grupo"/></label></h1>
	</legend>
	<form action="<c:url value="/produto-servico/grupo/listarsl"/>" class="form-search" id="formlistarpsgrupo" method="get" name="formlistarpsgrupo" role="search">
		<nav class="clearfix nav-block" role="navigation">
			<div class="w-15"><select class="select-search" data-class="displaytagSelect" name="parametrosWeb[0].campo"></select></div>
			<div class="w-85">
				<input autocomplete="off" class="input-search" name="parametrosWeb[0].parametro" pattern="letraNumeroEspacoPontoTracoBarra" type="search">
			</div>
		</nav>
	</form>
	<section class="block-body no-padding">
		<display:table class="table-default" export="false" id="obj" name="${PsGrupoList}" requestURI="/produto-servico/grupo">
			<display:column headerScope="id" property="id" style="width: 50px;" titleKey="displaytag.id"/>
			<display:column headerScope="descricao" property="descricao" titleKey="displaytag.descricao"/>
			<display:column class="hidden" headerClass="hidden">
				<select class="selectOpenBox">
					<option id="psgrupo_id" value="${obj.id}"></option>
				</select>
			</display:column>
		</display:table>
	</section>
</fieldset>
<%@include file="/config/libraries-js.jsp"%>