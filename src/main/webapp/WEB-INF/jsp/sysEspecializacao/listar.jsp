<%@include file="/config/header.jsp"%>
<fieldset class="block-lube">
	<legend class="block-header">
		<h1 class="block-title"><label><fmt:message key="nav.cadastro"/>&nbsp;<fmt:message key="label.barra"/>&nbsp;<fmt:message key="nav.cadastro.especializacao"/></label></h1>
	</legend>
	<form action="<c:url value="/especializacao"/>" class="form-search" id="formlistarsysespecializacao" method="get" name="formlistarsysespecializacao" role="search">
		<nav class="clearfix nav-block" role="navigation">
			<div class="w-15"><select class="select-search" data-class="displaytagSelect" name="parametrosWeb[0].campo"></select></div>
			<div class="w-85">
				<input autocomplete="off" class="input-search" name="parametrosWeb[0].parametro" pattern="letraNumeroEspacoPontoTracoBarra" type="search">
			</div>
		</nav>
	</form>
	<section class="block-body no-padding">
		<display:table class="table-default" export="false" id="obj" name="${SysEspecializacaoList}" requestURI="/especializacao">
			<display:column headerScope="id" property="id" style="width: 50px;" titleKey="displaytag.id"/>
			<display:column headerScope="descricao" property="descricao" titleKey="displaytag.descricao"/>
		</display:table>
	</section>
</fieldset>
<%@include file="/config/footer.jsp"%>