<%@include file="/config/taglibraries.jsp"%>
<%@include file="/config/libraries-style.jsp"%>
<nav class="o-navbar--gary" role="complementary">
	<div class="o-breadcrumb--arrow">
		<span class="o-breadcrumb__link"><a class="is-inactive" href="#" role="link" title="<fmt:message key="nav.lista"/>&nbsp;<fmt:message key="label.de"/>&nbsp;<fmt:message key="nav.cadastro.centro.custo"/>"><fmt:message key="nav.lista"/>&nbsp;<fmt:message key="label.de"/>&nbsp;<fmt:message key="nav.cadastro.centro.custo"/></a></span>
	</div>
	<form action="<c:url value="/cadastro/centro-de-custo/listarsl"/>" class="o-form" id="formcadcentrocustolistar" method="get" name="formcadcentrocustolistar" role="search">
		<input aria-hidden="true" data-search name="search" type="hidden" value="${param.search}">
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
<display:table class="c-table--lube c-table--hovered c-table--zebrered c-table--bordered js-slTable" export="false" id="obj" name="${CadCentroCustoList}" requestURI="/cadastro/centro-de-custo">
	<display:column property="descricao" headerScope="descricao" titleKey="displaytag.descricao"/>
	<display:column property="idcentrocustomaster.descricao" headerScope="idcentrocustomaster.descricao" titleKey="displaytag.descricao.master"/>
	<display:column class="is-hide" headerClass="is-hide">
		<select data-select="slSelect">
			<option data-provide="cadcentrocusto.id" value="${obj.id}"></option>
		</select>
	</display:column>
</display:table>
<%@include file="/config/libraries-js.jsp"%>