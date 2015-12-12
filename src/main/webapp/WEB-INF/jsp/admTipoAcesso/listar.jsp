<%@include file="/config/header.jsp"%>
<fieldset class="block-lube">
	<legend class="block-header">
		<h1 class="block-title"><label><fmt:message key="nav.cadastro"/>&nbsp;<fmt:message key="label.barra"/>&nbsp;<fmt:message key="nav.cadastro.tipo"/>&nbsp;<fmt:message key="label.barra"/>&nbsp;<fmt:message key="nav.cadastro.tipo.acesso"/></label></h1>
	</legend>
	<form action="<c:url value="/tipo-de-acesso"/>" class="form-search" id="formlistaradmtipoacesso" method="get" name="formlistaradmtipoacesso" role="search">
		<nav class="clearfix nav-block" role="navigation">
			<div class="w-15"><select class="select-search" data-class="displaytagSelect" name="parametrosWeb[0].campo"></select></div>
			<div class="w-85">
				<input autocomplete="off" class="input-search" name="parametrosWeb[0].parametro" pattern="letraNumeroEspacoPontoTracoBarra" type="search">
			</div>
		</nav>
	</form>
	<section class="block-body no-padding">
		<display:table export="false" class="table-default" id="obj" name="${AdmTipoAcessoList}" requestURI="/tipo-de-acesso">
			<display:column headerScope="id" property="id" style="width: 50px;" titleKey="displaytag.id"/>
			<display:column headerScope="tipo" property="tipo" titleKey="displaytag.tipo.acesso"/>
			<display:column property="acesso" headerScope="acesso" style="width: 50px;text-align: center;" titleKey="displaytag.acesso"/>
		</display:table>
	</section>
</fieldset>
<%@include file="/config/footer.jsp"%>