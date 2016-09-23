<%@include file="/config/taglibraries.jsp"%>
<%@include file="/config/libraries-style.jsp"%>
<form action="<c:url value="/produto-servico/listarsl"/>" class="form-modern" id="formlistarpsprodutoservico" method="get" name="formlistarpsprodutoservico" role="search">
	<input name="openBoxSearch" type="hidden" value="${param.search}">
	<nav class="band-nav-lube" role="complementary">
		<div class="row" role="row">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" role="separator">
				<label><a href="<c:url value="/dashboard/cadastro"/>"><fmt:message key="nav.cadastro"/></a>&nbsp;<i class="icon-right-open"></i>&nbsp;<a href="<c:url value="/dashboard/produtoServico"/>"><fmt:message key="nav.cadastro.produto.servico"/></a>&nbsp;<i class="icon-right-open"></i>&nbsp;<fmt:message key="nav.cadastro.produto.servico"/></label>					
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
<display:table class="table-default" export="false" id="obj" name="${PsProdutoServicoList}" requestURI="/produto-servico">
	<display:column headerScope="idclasse.idgrupo.id" property="idclasse.idgrupo.id" style="width: 90px;" titleKey="displaytag.id.grupo"/>
	<display:column headerScope="idclasse.id" property="idclasse.id" style="width: 79px;" titleKey="displaytag.id.classe"/>
	<display:column headerScope="id" property="id" style="width: 70px;" titleKey="displaytag.id"/>
	<display:column headerScope="descricao" property="descricao" titleKey="displaytag.descricao"/>
	<display:column class="hidden" headerClass="hidden">
		<select class="selectOpenBox">
			<option id="id" value="${obj.id}"></option>
		</select>
	</display:column>
</display:table>
<%@include file="/config/libraries-js.jsp"%>