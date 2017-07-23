<%@include file="/config/header.jsp"%>
<nav class="o-navbar--gary" role="complementary">
	<div class="o-breadcrumb--arrow">
		<span class="o-breadcrumb__link"><a href="<c:url value="/dashboard"/>" role="link" title="<fmt:message key="nav.dashboard"/>"><fmt:message key="nav.dashboard"/></a></span>
		<span class="o-breadcrumb__link"><a href="<c:url value="/dashboard/financeiro"/>" role="link" title="<fmt:message key="nav.cadastro"/>"><fmt:message key="nav.financeiro"/></a></span>
		<span class="o-breadcrumb__link"><a class="is-inactive" href="<c:url value="/financeiro/documento"/>" role="link" title="<fmt:message key="nav.financeiro.documento"/>"><fmt:message key="nav.financeiro.documento"/></a></span>
		<span class="o-breadcrumb__link"><a class="is-inactive" href="<c:url value="/financeiro/documento"/>" role="link" title="<fmt:message key="nav.lista"/>"><fmt:message key="nav.lista"/></a></span>
	</div>
	<form action="<c:url value="/financeiro/documento"/>" class="o-form" id="formfindocumentolistar" method="get" name="formfindocumentolistar" role="search">
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
				<label class="o-form__text" for="baixados"><fmt:message key="label.baixados"/></label>
				<input <c:if test="${parametrosWeb[2].operador.equals('is not null')}">checked</c:if> class="o-mark__data--checkbox" id="baixados" name="parametrosWeb[2].operador" type="hidden" value="${parametrosWeb[2].operador}">
				<label class="o-mark__text"><span class="o-mark__element" data-marked="is not null" data-unmarked="is null" onclick="MarkController.mark(this);"></span></label>
			</div>
		</div>
	</form>
</nav>
<display:table class="c-table--lube c-table--hovered c-table--zebrered c-table--bordered" export="false" id="obj" name="${FinDocumentoList}" requestURI="/financeiro/documento">
	<display:column headerScope="numero" property="numero" titleKey="displaytag.numero.documento"/>
	<display:column headerScope="serie" property="serie" titleKey="displaytag.serie"/>
	<display:column headerScope="idtipodocumento.descricao" property="idtipodocumento.descricao" titleKey="displaytag.tipo.documento"/>
	<display:column headerScope="idformapagamento.descricao" property="idformapagamento.descricao" titleKey="displaytag.forma.pagamento"/>
	<display:column headerScope="iddefinicao.idpessoa.nomerazaosocial" property="iddefinicao.idpessoa.nomerazaosocial" titleKey="displaytag.pessoa"/>
	<display:column headerScope="valortotal" property="valortotal" titleKey="displaytag.valor.total"/>
	<display:column style="text-align: center;width: 185px;">
		<a class="o-button--low o-button--small" href="<c:url value="/financeiro/documento/${obj.id}"/>" role="link" title="<fmt:message key="button.editar"/>"><i class="icon-pencil"></i>&nbsp;<fmt:message key="button.editar"/></a>
		<button class="o-button--der o-button--small" formaction="<c:url value="/financeiro/documento?obj.id=${obj.id}"/>" onclick="DialogController.build(event, this, requestDelete, 'Deseja confirmar a exclusao', 'icon-trash');" role="button" type="button" title="<fmt:message key="button.deletar"/>"><i class="icon-trash"></i>&nbsp;<fmt:message key="button.deletar"/></button>
	</display:column>
</display:table>
<menu class="o-toolbar--lube is-fixedBottomFull" role="menubar">
	<menuitem class="o-toolbar__item" role="menuitem"><a href="<c:url value="/financeiro/documento/formulario"/>" role="link" title="<fmt:message key="button.novo"/>"><i class="icon-plus"></i>&nbsp;<fmt:message key="button.novo"/></a></menuitem>
</menu>
<%@include file="/config/footer.jsp"%>