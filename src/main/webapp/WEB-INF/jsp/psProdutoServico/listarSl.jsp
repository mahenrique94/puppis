<%@include file="/config/taglibraries.jsp"%>
<%@include file="/config/libraries-style.jsp"%>
<div class="container-tie">
	<div class="container-header">
		<form action="<c:url value="/produto-servico"/>" class="form-search" id="formlistarpsprodutoservico" method="get" name="formlistarpsprodutoservico" role="search">
			<div class="row">
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
					<h2><fmt:message key="nav.cadastro"/>&nbsp;<fmt:message key="label.barra"/>&nbsp;<fmt:message key="nav.cadastro.produto.servico"/></h2>					
				</div>
				<div class="col-xs-12 col-sm-12 col-md-2 col-lg-1">
					<a href="<c:url value="/produto-servico/formulario"/>" class="btn-md float-left" title="<fmt:message key="button.novo"/>"><span class="icon-plus"></span>&nbsp;<fmt:message key="button.novo"/></a>
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
</div>
<%@include file="/config/libraries-js.jsp"%>