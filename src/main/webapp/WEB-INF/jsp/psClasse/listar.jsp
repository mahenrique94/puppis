<%@include file="/config/header.jsp"%>
<fieldset class="block-lube">
	<legend class="block-header">
		<h1 class="block-title"><label><fmt:message key="nav.cadastro"/>&nbsp;<fmt:message key="label.barra"/>&nbsp;<fmt:message key="nav.cadastro.produto.servico"/>&nbsp;<fmt:message key="label.barra"/>&nbsp;<fmt:message key="nav.cadastro.produto.servico.classe"/></label></h1>
	</legend>
	<form action="<c:url value="/produto-servico/classe"/>" class="form-search" id="formlistarpsclasse" method="get" name="formlistarpsclasse" role="search">
		<nav class="clearfix nav-block" role="navigation">
			<div class="w-25"><a href="<c:url value="/produto-servico/classe/formulario"/>" class="btn-md float-left m-right-5" title="<fmt:message key="button.novo"/>"><span class="icon-plus"></span>&nbsp;<fmt:message key="button.novo"/></a></div>
			<div class="w-15"><select class="select-search" data-class="displaytagSelect" name="parametrosWeb[0].campo"></select></div>
			<div class="w-60">
				<input autocomplete="off" class="input-search" name="parametrosWeb[0].parametro" pattern="letraNumeroEspacoPontoTracoBarra" type="search">
			</div>
		</nav>
	</form>
	<section class="block-body no-padding">
		<display:table class="table-default" export="false" id="obj" name="${PsClasseList}" requestURI="/produto-servico/classe">
			<display:column headerScope="idgrupo.id" property="idgrupo.id" style="width: 60px;" titleKey="displaytag.id.grupo"/>
			<display:column headerScope="id" property="id" style="width: 50px;" titleKey="displaytag.id"/>
			<display:column headerScope="descricao" property="descricao" titleKey="displaytag.descricao"/>
			<display:column style="width: 150px;text-align: center;">
				<a class="btn-xs" href="<c:url value="/produto-servico/classe/${obj.id}"/>"><span class="icon-pencil"></span>&nbsp;<fmt:message key="button.editar"/></a>
				<a class="btn-xs" href="<c:url value="/produto-servico/classe/${obj.id}"/>" onclick="deletar(this);"><span class="icon-trash"></span>&nbsp;<fmt:message key="button.deletar"/></a>
			</display:column>
		</display:table>
	</section>
</fieldset>
<%@include file="/config/footer.jsp"%>