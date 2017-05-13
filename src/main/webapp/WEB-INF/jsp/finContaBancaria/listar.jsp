<%@include file="/config/header.jsp"%>
<nav class="o-navbar--gary" role="complementary">
	<div class="o-breadcrumb--arrow">
		<span class="o-breadcrumb__link"><a href="<c:url value="/dashboard"/>" role="link" title="<fmt:message key="nav.dashboard"/>"><fmt:message key="nav.dashboard"/></a></span>
		<span class="o-breadcrumb__link"><a href="<c:url value="/dashboard/cadastro"/>" role="link" title="<fmt:message key="nav.cadastro"/>"><fmt:message key="nav.cadastro"/></a></span>
		<span class="o-breadcrumb__link"><a class="is-inactive" href="<c:url value="/financeiro/conta-bancaria"/>" role="link" title="<fmt:message key="nav.cadastro.conta.bancaria"/>"><fmt:message key="nav.cadastro.conta.bancaria"/></a></span>
		<span class="o-breadcrumb__link"><a class="is-inactive" href="<c:url value="/financeiro/conta-bancaria"/>" role="link" title="<fmt:message key="nav.lista"/>"><fmt:message key="nav.lista"/></a></span>
	</div>
	<form action="<c:url value="/financeiro/conta-bancaria"/>" class="o-form" id="formfincontabancarialistar" method="get" name="formfincontabancarialistar" role="search">
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
<display:table class="c-table--lube c-table--hovered c-table--zebrered c-table--bordered" export="false" id="obj" name="${FinContaBancariaList}" requestURI="/financeiro/conta-bancaria">
	<display:column headerScope="idbanco.descricao" property="idbanco.descricao" titleKey="displaytag.banco"/>
	<display:column headerScope="idtipocontabancaria.descricao" property="idtipocontabancaria.descricao" titleKey="displaytag.tipo"/>
	<display:column headerScope="agencia" property="agencia" titleKey="displaytag.agencia"/>
	<display:column headerScope="numeroconta" property="numeroconta" titleKey="displaytag.conta"/>
	<display:column headerScope="nometitular" property="nometitular" titleKey="displaytag.titular"/>
	<display:column style="width: 50px;text-align: center;" titleKey="displaytag.inativo">
		<c:if test="${obj.inativo == true}"><i class="icon-ok l-color--ren"></i></c:if>
		<c:if test="${obj.inativo == false}"><i class="icon-cancel l-color--der"></i></c:if>
	</display:column>
	<display:column style="text-align: center;width: 185px;">
		<a class="o-button--low o-button--small" href="<c:url value="/financeiro/conta-bancaria/${obj.id}"/>" role="link" title="<fmt:message key="button.editar"/>"><i class="icon-pencil"></i>&nbsp;<fmt:message key="button.editar"/></a>
		<button class="o-button--der o-button--small" formaction="<c:url value="/financeiro/conta-bancaria?obj.id=${obj.id}"/>" onclick="DialogController.build(event, this, requestDelete, 'Deseja confirmar a exclusao', 'icon-trash');" role="button" type="button" title="<fmt:message key="button.deletar"/>"><i class="icon-trash"></i>&nbsp;<fmt:message key="button.deletar"/></button>
	</display:column>
</display:table>
<menu class="o-toolbar--lube is-fixedBottomFull" role="menubar">
	<menuitem class="o-toolbar__item" role="menuitem"><a href="<c:url value="/financeiro/conta-bancaria/formulario"/>" role="link" title="<fmt:message key="button.novo"/>"><i class="icon-plus"></i>&nbsp;<fmt:message key="button.novo"/></a></menuitem>
</menu>
<%@include file="/config/footer.jsp"%>