<%@include file="/config/header.jsp" %>
<form action="<c:url value="/financeiro/documento/baixa"/>" class="o-form" id="formfindocumentobaixa" method="post" name="formfindocumentobaixa" role="form">
	<input aria-hidden="true" name="parametrosWeb[0].parametroInicialaux" type="hidden" value="${parametrosWeb[0].parametroInicial}">
	<input aria-hidden="true" name="parametrosWeb[1].parametroInicialaux" type="hidden" value="${parametrosWeb[1].parametroInicial}">
	<input aria-hidden="true" name="idTipoOperacaoaux" type="hidden" value="${idTipoOperacao}">
	<nav class="o-navbar--gary" role="complementary">
		<div class="o-breadcrumb--arrow">
			<span class="o-breadcrumb__link"><a href="<c:url value="/dashboard"/>" role="link" title="<fmt:message key="nav.dashboard"/>"><fmt:message key="nav.dashboard"/></a></span>
			<span class="o-breadcrumb__link"><a href="<c:url value="/dashboard/financeiro"/>" role="link" title="<fmt:message key="nav.cadastro"/>"><fmt:message key="nav.financeiro"/></a></span>
			<span class="o-breadcrumb__link"><a class="is-inactive" href="<c:url value="/financeiro/documento/baixa"/>" role="link" title="<fmt:message key="nav.financeiro.baixa"/>"><fmt:message key="nav.financeiro.baixa"/></a></span>
		</div>
	</nav>
	<section class="o-form__body o-form__body--padding">
		<fieldset class="c-block--lube" style="margin-bottom: 1rem;">
			<legend class="c-block__header"><label class="c-block__title"><i class="icon-search"></i>&nbsp;<fmt:message key="titulo.pesquisar"/></label></legend>
			<section class="c-block__body c-block__body--padding">
				<div class="l-row" role="row">
					<div class="u-grid--6" role="separator">
						<label class="o-form__text" for="conta"><fmt:message key="label.conta"/></label>
						<select aria-required="true" class="o-form__data has-validation" data-select="slFinContaBancaria" data-url="slFinanceiro_Conta-bancaria_Json" id="conta" name="parametrosWeb[0].parametroInicial" required></select>
					</div>
					<div class="u-grid--6" role="separator">
						<label class="o-form__text" for="pessoa"><fmt:message key="label.pessoa"/></label>
						<select aria-required="true" class="o-form__data has-validation ss-search" data-select="slPesDefinicao" data-url="slPessoa_Definicao_Json" id="pessoa" name="parametrosWeb[1].parametroInicial" required></select>
					</div>
				</div>
				<div class="l-row" role="row">
					<div class="u-grid--3" role="separator">
						<label class="o-form__text" for="numerodocumento"><fmt:message key="label.numero.documento"/></label>
						<input class="o-form__data has-validation" id="numerodocumento" name="parametrosWeb[2].parametroInicial" pattern="number0to9" step="1" type="number" value="${parametrosWeb[2].parametroInicial}">
					</div>
					<div class="u-grid--3" role="separator">
						<label class="o-form__text" for="numerodocumentoate"><fmt:message key="label.ate"/></label>
						<input class="o-form__data has-validation" id="numerodocumentoate" name="parametrosWeb[2].parametroFinal" pattern="number0to9" step="1" type="number" value="${parametrosWeb[2].parametroFinal}">
					</div>
					<div class="u-grid--3" role="separator">
						<label class="o-form__text" for="datavencimento"><fmt:message key="label.data.vencimento"/></label>
						<input class="o-form__data has-validation" id="datavencimento" max="31-12-2900" maxlength="10" min="01-01-1900" name="parametrosWeb[3].parametroInicial" onkeypress="checkMask(event);" onkeyup="mask(maskData, this, event);" pattern="data" type="text" value="${parametrosWeb[3].parametroInicial}">
					</div>
					<div class="u-grid--3" role="separator">
						<label class="o-form__text" for="datavencimentoate"><fmt:message key="label.ate"/></label>
						<input class="o-form__data has-validation" id="datavencimentoate" max="31-12-2900" maxlength="10" min="01-01-1970" name="parametrosWeb[3].parametroFinal" onkeypress="checkMask(event);" onkeyup="mask(maskData, this, event);" pattern="data" type="text" value="${parametrosWeb[3].parametroFinal}">
					</div>
				</div>
				<div class="l-row" role="row">
					<div class="u-grid--12" role="separator">
						<label class="o-form__text" for="operacao"><fmt:message key="label.operacao"/></label>
						<select aria-required="true" class="o-form__data has-validation" data-parameters-fields="[idmodulo.id, gruporesumo]" data-parameters-values="[2, BAIXA]" data-select="slSysTipoOperacao" data-url="slSystem_Tipo-de-operacao_Json" id="operacao" name="idTipoOperacao" required></select>
					</div>
				</div>
			</section>
		</fieldset>
		<c:if test="${not empty FinDocumentoList}">
			<c:import url="lista.jsp">
				<c:param name="idTipoOperacao" value="${idTipoOperacao}"></c:param>
			</c:import>
		</c:if>
	</section>
	<menu class="o-toolbar--lube is-fixedBottomFull" role="menubar">
		<menuitem class="o-toolbar__item" role="menuitem"><button role="button" title="<fmt:message key="button.pesquisar"/>" type="submit"><i class="icon-search"></i>&nbsp;<fmt:message key="button.pesquisar"/></button></menuitem>
		<c:if test="${not empty FinDocumentoList}">
			<menuitem class="o-toolbar__item" role="menuitem"><button formaction="<c:url value="/financeiro/documento/processar"/>" role="button" title="<fmt:message key="button.processar"/>"><i class="icon-spin6"></i>&nbsp;<fmt:message key="button.processar"/></button></menuitem>
		</c:if>
	</menu>
</form>
<%@include file="/config/footer.jsp"%>