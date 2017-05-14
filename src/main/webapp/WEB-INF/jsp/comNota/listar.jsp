<%@include file="/config/header.jsp"%>
<nav class="o-navbar--gary" role="complementary">
	<div class="o-breadcrumb--arrow">
		<span class="o-breadcrumb__link"><a href="<c:url value="/dashboard"/>" role="link" title="<fmt:message key="nav.dashboard"/>"><fmt:message key="nav.dashboard"/></a></span>
		<span class="o-breadcrumb__link"><a href="<c:url value="/dashboard/comercio"/>" role="link" title="<fmt:message key="nav.comercio"/>"><fmt:message key="nav.comercio"/></a></span>
		<span class="o-breadcrumb__link"><a class="is-inactive" href="<c:url value="/comercio/nota"/>" role="link" title="<fmt:message key="nav.comercio.nota"/>"><fmt:message key="nav.comercio.nota"/></a></span>
		<span class="o-breadcrumb__link"><a class="is-inactive" href="<c:url value="/comercio/nota"/>" role="link" title="<fmt:message key="nav.lista"/>"><fmt:message key="nav.lista"/></a></span>
	</div>
	<form action="<c:url value="/comercio/nota"/>" class="o-form" id="formcomnotalistar" method="get" name="formcomnotalistar" role="search">
		<div class="l-row" role="row">
			<div class="u-grid--2" role="grid">
				<div class="o-form__group">
					<span class="o-form__groupElement"><label class="o-button--lube"><fmt:message key="label.de"/></label></span>
					<input class="o-form__data has-validation" max="12-31-2900" maxlength="10" min="01-01-1900" name="parametrosWeb[1].parametroInicial" onkeypress="checkMask(event);" onkeyup="mask(maskData, this, event);" pattern="data" type="text" value="${parametrosWeb[1].parametroInicial}">
				</div>
			</div>
			<div class="u-grid--2" role="grid">
				<div class="o-form__group">
					<span class="o-form__groupElement"><label class="o-button--lube"><fmt:message key="label.ate"/></label></span>
					<input class="o-form__data has-validation" max="12-31-2900" maxlength="10" min="01-01-1900" name="parametrosWeb[1].parametroFinal" onkeypress="checkMask(event);" onkeyup="mask(maskData, this, event);" pattern="data" type="text" value="${parametrosWeb[1].parametroFinal}">
				</div>
			</div>
			<div class="u-grid--2" role="grid">
				<select class="o-form__data" data-select="slTable" name="parametrosWeb[0].campo"></select>
			</div>
			<div class="u-grid--4" role="grid">
				<div class="o-form__group">
					<input class="o-form__data" name="parametrosWeb[0].parametroInicial" placeholder="<fmt:message key="placeholder.pesquisar"/>" type="search">
					<span class="o-form__groupElement"><button class="o-button--lube" role="button" title="<fmt:message key="button.pesquisar"/>" type="submit"><i class="icon-search"></i></button></span>
				</div>
			</div>   		
			<div class="u-grid--2" role="grid" style="margin-top: -1rem;">
				<label class="o-form__text" for="atualizadas"><fmt:message key="label.atualizadas"/></label>
				<input <c:if test="${parametrosWeb[2].operador.equals('is not null')}">checked</c:if> class="o-mark__data--checkbox" id="atualizadas" name="parametrosWeb[2].operador" type="hidden" value="${parametrosWeb[2].operador}">
				<label class="o-mark__text"><span class="o-mark__element" data-marked="is not null" data-unmarked="is null" onclick="MarkController.mark(this);"></span></label>
			</div>
		</div>
	</form>
</nav>
<display:table class="c-table--lube c-table--hovered c-table--zebrered c-table--bordered" export="false" id="obj" name="${ComNotaList}" requestURI="/nota">
	<display:column headerScope="id" property="id" style="width: 50px;" titleKey="displaytag.id"/>
	<display:column headerScope="iddefinicao.idpessoa.nomerazaosocial" property="iddefinicao.idpessoa.nomerazaosocial" titleKey="displaytag.razao.social"/>
	<display:column headerScope="idusuario.usuario" property="idusuario.usuario" titleKey="displaytag.usuario"/>
	<display:column headerScope="idtipooperacao.descricao" property="idtipooperacao.descricao" style="width: 70px;" titleKey="displaytag.operacao"/>
	<display:column style="text-align: center;width: 185px;">
		<a class="o-button--low o-button--small" href="<c:url value="/comercio/nota/${obj.id}"/>" role="link" title="<fmt:message key="button.editar"/>"><i class="icon-pencil"></i>&nbsp;<fmt:message key="button.editar"/></a>
		<button class="o-button--der o-button--small" formaction="<c:url value="/comercio/nota?obj.id=${obj.id}"/>" onclick="DialogController.build(event, this, requestDelete, 'Deseja confirmar a exclusao', 'icon-trash');" role="button" type="button" title="<fmt:message key="button.deletar"/>"><i class="icon-trash"></i>&nbsp;<fmt:message key="button.deletar"/></button>
	</display:column>
</display:table>
<menu class="o-toolbar--lube is-fixedBottomFull" role="menubar">
	<menuitem class="o-toolbar__item" role="menuitem"><a href="<c:url value="/comercio/nota/formulario"/>" role="link" title="<fmt:message key="button.novo"/>"><i class="icon-plus"></i>&nbsp;<fmt:message key="button.novo"/></a></menuitem>
</menu>
<%@include file="/config/footer.jsp"%>