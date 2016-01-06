<%@include file="/config/taglibraries.jsp" %>
<%@include file="/config/libraries-style.jsp"%>
<div class="container-tie">
	<div class="container-header">
		<form action="<c:url value="/pessoa"/>" class="form-search" id="formlistarpespessoa" method="get" name="formlistarpespessoa" role="search">
			<div class="row">
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
					<h2><fmt:message key="nav.cadastro"/>&nbsp;<fmt:message key="label.barra"/>&nbsp;<fmt:message key="nav.cadastro.pessoa"/></h2>					
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
</div>
<%@include file="/config/libraries-js.jsp"%>