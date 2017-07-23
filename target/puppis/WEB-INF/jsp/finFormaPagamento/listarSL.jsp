<%@include file="/config/taglibraries.jsp"%>
<%@include file="/config/libraries-style.jsp"%>
<nav class="o-navbar--gary" role="complementary">
	<div class="o-breadcrumb--arrow">
		<span class="o-breadcrumb__link"><a class="is-inactive" href="#" role="link" title="<fmt:message key="nav.lista"/>&nbsp;<fmt:message key="label.de"/>&nbsp;<fmt:message key="nav.financeiro.forma.pagamento"/>"><fmt:message key="nav.lista"/>&nbsp;<fmt:message key="label.de"/>&nbsp;<fmt:message key="nav.financeiro.forma.pagamento"/></a></span>
	</div>
	<form action="<c:url value="/financeiro/forma-de-pagamento/listarsl"/>" class="o-form" id="formfinformapagamentolistar" method="get" name="formfinformapagamentolistar" role="search">
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
<display:table class="c-table--lube c-table--hovered c-table--zebrered c-table--bordered js-slTable" export="false" id="obj" name="${FinFormaPagamentoList}" requestURI="/financeiro/forma-de-pagamento">
	<display:column headerScope="id" property="id" style="width: 50px;" titleKey="displaytag.id"/>
	<display:column property="descricao" headerScope="descricao" titleKey="displaytag.descricao"/>
	<display:column headerScope="quantidadeparcela" property="quantidadeparcela" style="width: 100px;text-align: center;" titleKey="displaytag.quantidade.parcela"/>
	<display:column headerScope="intervalor" property="intervalo" style="width: 50px;text-align: center;" titleKey="displaytag.intervalo"/>
	<display:column class="is-hide" headerClass="is-hide">
		<select data-select="slSelect">
			<option data-provide="finformapagamento.id" value="${obj.id}"></option>
		</select>
	</display:column>
</display:table>
<%@include file="/config/libraries-js.jsp"%>