<%@include file="/config/header.jsp"%>
<fieldset class="block-lube">
	<legend class="block-header">
		<h1 class="block-title"><label><fmt:message key="nav.cadastro"/>&nbsp;<fmt:message key="label.barra"/>&nbsp;<fmt:message key="nav.cadastro.centro.custo"/></label></h1>
	</legend>
	<form action="<c:url value="/cadastro/centro-de-custo"/>" class="form-search" id="formlistarcadcentrocusto" method="get" name="formlistarcadcentrocusto" role="search">
		<nav class="clearfix nav-block" role="navigation">
			<div class="w-25"><a href="<c:url value="/cadastro/centro-de-custo/formulario"/>" class="btn-md float-left m-right-5" title="<fmt:message key="button.novo"/>"><span class="icon-plus"></span>&nbsp;<fmt:message key="button.novo"/></a></div>
			<div class="w-15"><select class="select-search" data-class="displaytagSelect" name="parametrosWeb[0].campo"></select></div>
			<div class="w-60">
				<input autocomplete="off" class="input-search" name="parametrosWeb[0].parametro" pattern="letraNumeroEspacoPontoTracoBarra" type="search">
			</div>
		</nav>
	</form>
	<section class="block-body no-padding">
		<display:table class="table-default" export="false" id="obj" name="${CadCentroCustoList}" requestURI="/cadastro/centro-de-custo">
			<display:column headerScope="conta" property="conta" style="width: 50px;tex-align: center;" titleKey="displaytag.conta"/>
			<display:column headerScope="subconta" property="subconta" style="width: 80px;tex-align: center;" titleKey="displaytag.sub.conta"/>
			<display:column property="descricao" headerScope="descricao" titleKey="displaytag.descricao"/>
			<display:column style="width: 150px;text-align: center;">
				<a class="btn-xs" href="<c:url value="/cadastro/centro-de-custo/${obj.id}"/>"><span class="icon-pencil"></span>&nbsp;<fmt:message key="button.editar"/></a>
				<a class="btn-xs" href="<c:url value="/cadastro/centro-de-custo/${obj.id}"/>" onclick="deletar(this);"><span class="icon-trash"></span>&nbsp;<fmt:message key="button.deletar"/></a>
			</display:column>
		</display:table>
	</section>
</fieldset>
<%@include file="/config/footer.jsp"%>