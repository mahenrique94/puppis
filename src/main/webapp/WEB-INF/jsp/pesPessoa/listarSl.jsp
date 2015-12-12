<%@include file="/config/taglibraries.jsp" %>
<%@include file="/config/libraries-style.jsp"%>
<fieldset class="block-lube">
	<legend class="block-header">
		<h1 class="block-title"><label><fmt:message key="nav.cadastro"/>&nbsp;<fmt:message key="label.barra"/>&nbsp;<fmt:message key="nav.cadastro.pessoa"/>&nbsp;<fmt:message key="label.barra"/>&nbsp;<fmt:message key="nav.cadastro.pessoa.cliente"/></label></h1>
	</legend>
	<form action="<c:url value="/pessoa/listarsl"/>" class="form-search" id="formlistarpespessoa" method="get" name="formlistarpespessoa" role="search">
		<nav class="clearfix nav-block" role="navigation">
			<div class="w-15"><select class="select-search" data-class="displaytagSelect" name="parametrosWeb[0].campo"></select></div>
			<div class="w-85">
				<input autocomplete="off" class="input-search" name="parametrosWeb[0].parametro" pattern="letraNumeroEspacoPontoTracoBarra" type="search">
			</div>
		</nav>
	</form>
	<section class="block-body no-padding">
		<display:table class="table-default" export="false" id="obj" name="${PesPessoaList}" requestURI="/pessoa">
			<display:column headerScope="id" property="id" style="width: 50px;" titleKey="displaytag.id"/>
			<display:column headerScope="nomerazaosocial" property="nomerazaosocial" titleKey="displaytag.nome.razao.social"/>
			<display:column headerScope="documento.cpfcnpj" property="documento.cpfcnpj" titleKey="displaytag.cpf.cnpj"/>
			<display:column headerScope="documento.rginscricaoestadual" property="documento.rginscricaoestadual" titleKey="displaytag.rg.inscricao.estadual"/>
			<display:column class="hidden" headerClass="hidden">
				<select class="selectOpenBox">
					<option id="pespessoa_id" value="${obj.id}"></option>
					<option id="pespessoa_nomerazaosocial" value="${obj.nomerazaosocial}"></option>
					<option id="pespessoa_cpfcnpj" value="${obj.documento.cpfcnpj}"></option>
					<option id="pespessoa_rginscricaoestadual" value="${obj.documento.rginscricaoestadual}"></option>
				</select>
			</display:column>
		</display:table>
	</section>
</fieldset>
<%@include file="/config/libraries-js.jsp"%>