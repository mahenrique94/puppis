<%@include file="/config/header.jsp"%>
<nav class="o-navbar--gary" role="complementary">
	<div class="o-breadcrumb--arrow">
		<span class="o-breadcrumb__link"><a class="is-inactive" href="<c:url value="/administrador/permissao"/>" role="link" title="<fmt:message key="nav.administrador.permissao"/>"><fmt:message key="nav.administrador.permissao"/></a></span>
	</div>
	<form action="<c:url value="/administrador/permissao"/>" class="o-form" id="formadmpermissaolistar" method="get" name="formadmpermissaolistar" role="search">
		<input aria-hidden="true" name="parametrosWeb[0].campo" type="hidden" value="${parametrosWeb[0].campo}">
		<input aria-hidden="true" name="parametrosWeb[0].parametroInicial" type="hidden" value="${parametrosWeb[0].parametroInicial}">
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
<display:table class="c-table--lube c-table--hovered c-table--zebrered c-table--bordered" export="false" id="obj" name="${AdmPermissaoList}" requestURI="/administrador/permissao">
	<display:column headerScope="id" property="id" style="width: 50px;" titleKey="displaytag.id"/>
	<display:column headerScope="idusuario.usuario" property="idusuario.usuario" titleKey="displaytag.usuario"/>
	<display:column style="width: 50px;text-align: center;" titleKey="displaytag.deletar">
		<c:if test="${obj.deletar == true}"><i class="icon-ok l-color--ren"></i></c:if>
		<c:if test="${obj.deletar == false}"><i class="icon-cancel l-color--der"></i></c:if>
	</display:column>
	<display:column style="width: 50px;text-align: center;" titleKey="displaytag.editar">
		<c:if test="${obj.editar == true}"><i class="icon-ok l-color--ren"></i></c:if>
		<c:if test="${obj.editar == false}"><i class="icon-cancel l-color--der"></i></c:if>
	</display:column>
	<display:column style="width: 50px;text-align: center;" titleKey="displaytag.formulario">
		<c:if test="${obj.formulario == true}"><i class="icon-ok l-color--ren"></i></c:if>
		<c:if test="${obj.formulario == false}"><i class="icon-cancel l-color--der"></i></c:if>
	</display:column>
	<display:column style="width: 50px;text-align: center;" titleKey="displaytag.listar">
		<c:if test="${obj.listar == true}"><i class="icon-ok l-color--ren"></i></c:if>
		<c:if test="${obj.listar == false}"><i class="icon-cancel l-color--der"></i></c:if>
	</display:column>
	<display:column style="width: 50px;text-align: center;" titleKey="displaytag.salvar">
		<c:if test="${obj.salvar == true}"><i class="icon-ok l-color--ren"></i></c:if>
		<c:if test="${obj.salvar == false}"><i class="icon-cancel l-color--der"></i></c:if>
	</display:column>
	<display:column style="text-align: center;width: 185px;">
		<a class="o-button--low o-button--small" href="<c:url value="/administrador/permissao/${obj.id}"/>"><i class="icon-pencil"></i>&nbsp;<fmt:message key="button.editar"/></a>
		<button class="o-button--der o-button--small" formaction="<c:url value="/administrador/permissao?obj.id=${obj.id}"/>" onclick="DialogController.build(event, this, requestDelete, 'Deseja confirmar a exclusao', 'icon-trash');" role="button" type="button" title="<fmt:message key="button.deletar"/>"><i class="icon-trash"></i>&nbsp;<fmt:message key="button.deletar"/></button>
	</display:column>
</display:table>
<menu class="o-toolbar--lube is-fixedBottomFull" role="menubar">
	<menuitem class="o-toolbar__item" role="menuitem"><a href="<c:url value="/administrador/permissao/formulario/${parametrosWeb[0].parametroInicial}"/>" role="link" title="<fmt:message key="button.novo"/>"><i class="icon-plus"></i>&nbsp;<fmt:message key="button.novo"/></a></menuitem>
</menu>
<%@include file="/config/footer.jsp"%>