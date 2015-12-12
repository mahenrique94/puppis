<%@include file="/config/taglibraries.jsp"%>
<%@include file="/config/libraries-style.jsp"%>
<fieldset class="block-lube">
	<legend class="block-header">
		<h1 class="block-title"><label><fmt:message key="nav.cadastro"/>&nbsp;<fmt:message key="label.barra"/>&nbsp;<fmt:message key="nav.cadastro.produto.servico"/></label></h1>
	</legend>
	<form action="<c:url value="/produto-servico/listarsl"/>" class="form-search" id="formlistarpsprodutoservico" method="get" name="formlistarpsprodutoservico" role="search">
		<nav class="clearfix nav-block" role="navigation">
			<div class="w-15"><select class="select-search" data-class="displaytagSelect" name="parametrosWeb[0].campo"></select></div>
			<div class="w-85">
				<input autocomplete="off" class="input-search" name="parametrosWeb[0].parametro" pattern="letraNumeroEspacoPontoTracoBarra" type="search">
			</div>
		</nav>
	</form>
	<section class="block-body no-padding">
		<display:table class="table-default" export="false" id="obj" name="${PsProdutoServicoList}" requestURI="/produto-servico">
			<display:column headerScope="idgrupo.id" property="idgrupo.id" style="width: 70px;" titleKey="displaytag.id.grupo"/>
			<display:column headerScope="idclasse.id" property="idclasse.id" style="width: 70px;" titleKey="displaytag.id.classe"/>
			<display:column headerScope="id" property="id" style="width: 70px;" titleKey="displaytag.id"/>
			<display:column headerScope="descricao" property="descricao" titleKey="displaytag.descricao"/>
			<display:column class="hidden" headerClass="hidden">
				<select class="selectOpenBox">
					<option id="psprodutoservico_idgrupo_id" value="${obj.idgrupo.id}"></option>
					<option id="psprodutoservico_idclasse_id" value="${obj.idclasse.id}"></option>
					<option id="psprodutoservico_id" value="${obj.id}"></option>
					<option id="psprodutoservico_descricao" value="${obj.descricao}"></option>
					<option id="psprodutoservico_custo_valorvenda" value="${obj.custo.valorvenda}"></option>
				</select>
			</display:column>
		</display:table>
	</section>
</fieldset>
<%@include file="/config/libraries-js.jsp"%>