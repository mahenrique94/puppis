<%@include file="/config/header.jsp"%>
<nav class="o-navbar--gary" role="complementary">
	<div class="o-breadcrumb--arrow">
		<span class="o-breadcrumb__link"><a href="<c:url value="/dashboard"/>" role="link" title="<fmt:message key="nav.dashboard"/>"><fmt:message key="nav.dashboard"/></a></span>
		<span class="o-breadcrumb__link"><a href="<c:url value="/dashboard/administrador"/>" role="link" title="<fmt:message key="nav.administrador"/>"><fmt:message key="nav.administrador"/></a></span>
		<span class="o-breadcrumb__link"><a class="is-inactive" href="<c:url value="/administrador/comercio"/>" role="link" title="<fmt:message key="nav.administrador.comercio"/>"><fmt:message key="nav.administrador.comercio"/></a></span>
		<span class="o-breadcrumb__link"><a class="is-inactive" href="<c:url value="/administrador/comercio"/>" role="link" title="<fmt:message key="nav.lista"/>"><fmt:message key="nav.lista"/></a></span>
	</div>
	<form action="<c:url value="/administrador/comercio"/>" class="o-form" id="formadmcomerciolistar" method="get" name="formadmcomerciolistar" role="search">
		<div class="l-row" role="row">
			<div class="u-grid--2" role="grid">
				<select class="o-form__data" data-select="slTable" name="parametrosWeb[0].campo"></select>
			</div>
			<div class="u-grid--10" role="grid">
				<div class="o-form__group">
					<input class="o-form__data" name="parametrosWeb[0].parametroInicial" placeholder="<fmt:message key="placeholder.pesquisar"/>" type="search">
					<span class="o-form__groupElement"><button class="o-button--lube" role="button" title="<fmt:message key="button.pesquisar"/>" type="submit"><i class="icon-search"></i></button></span>
				</div>
			</div>   		
		</div>
	</form>
</nav>
<display:table class="c-table--lube c-table--hovered c-table--zebrered c-table--bordered" export="false" id="obj" name="${AdmComercioList}" requestURI="/administrador/comercio">
	<display:column headerScope="id" property="id" style="width: 50px;" titleKey="displaytag.id"/>
	<display:column headerScope="nomerazaosocial" property="nomerazaosocial" titleKey="displaytag.nome.razao.social"/>
	<display:column headerScope="nomefantasia" property="nomefantasia" titleKey="displaytag.nome.fantasia"/>
	<display:column headerScope="documento.cpfcnpj" property="documento.cpfcnpj" style="width: 110px;" titleKey="displaytag.cpf.cnpj"/>
	<display:column headerScope="documento.rginscricaoestadual" property="documento.rginscricaoestadual" style="width: 130px;" titleKey="displaytag.rg.inscricao.estadual"/>
	<display:column style="text-align: center;width: 185px;">
		<a class="o-button--low o-button--small" href="<c:url value="/administrador/comercio/${obj.id}"/>" role="link" title="<fmt:message key="button.editar"/>"><i class="icon-pencil"></i>&nbsp;<fmt:message key="button.editar"/></a>
		<button class="o-button--der o-button--small" formaction="<c:url value="/administrador/comercio?obj.id=${obj.id}"/>" onclick="DialogController.build(event, this, requestDelete, 'Deseja confirmar a exclusao', 'icon-trash');" role="button" type="button" title="<fmt:message key="button.deletar"/>"><i class="icon-trash"></i>&nbsp;<fmt:message key="button.deletar"/></button>
	</display:column>
</display:table>
<menu class="o-toolbar--lube is-fixedBottomFull" role="menubar">
	<menuitem class="o-toolbar__item" role="menuitem"><a href="<c:url value="/administrador/comercio/formulario"/>" role="link" title="<fmt:message key="button.novo"/>"><i class="icon-plus"></i>&nbsp;<fmt:message key="button.novo"/></a></menuitem>
</menu>
<%@include file="/config/footer.jsp"%>