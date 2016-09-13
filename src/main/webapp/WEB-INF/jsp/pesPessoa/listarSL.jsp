<%@include file="/config/taglibraries.jsp"%>
<%@include file="/config/libraries-style.jsp"%>
<form action="<c:url value="/pessoa/listarsl"/>" class="form-modern" id="formlistarpespessoa" method="get" name="formlistarpespessoa" role="search">
	<input name="openBoxSearch" type="hidden" value="${param.search}">
	<nav class="band-nav-lube" role="complementary">
		<div class="row" role="row">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" role="separator">
				<label><a href="<c:url value="/dashboard/cadastro"/>"><fmt:message key="nav.cadastro"/></a>&nbsp;<i class="icon-right-open"></i>&nbsp;<fmt:message key="nav.cadastro.pessoa"/></label>					
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
<display:table class="table-default" export="false" id="obj" name="${PesPessoaList}" requestURI="/pessoa">
	<display:column headerScope="id" property="id" style="width: 50px;" titleKey="displaytag.id"/>
	<display:column headerScope="nomerazaosocial" property="nomerazaosocial" titleKey="displaytag.nome.razao.social"/>
	<display:column headerScope="documento.cpfcnpj" property="documento.cpfcnpj" titleKey="displaytag.cpf.cnpj"/>
	<display:column headerScope="documento.rginscricaoestadual" property="documento.rginscricaoestadual" titleKey="displaytag.rg.inscricao.estadual"/>
	<display:column class="hidden" headerClass="hidden">
		<select class="selectOpenBox">
			<option id="id" value="${obj.id}"></option>
		</select>
	</display:column>
</display:table>
<%@include file="/config/libraries-js.jsp"%>