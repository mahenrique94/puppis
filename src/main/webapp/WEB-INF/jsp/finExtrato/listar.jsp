<%@include file="/config/header.jsp" %>
<form action="<c:url value="/financeiro/extrato"/>" class="o-form" id="formfinextrato" method="get" name="formfinextrato" role="form">
	<input aria-hidden="true" name="parametrosWeb[0].parametroInicialaux" type="hidden" value="${parametrosWeb[0].parametroInicial}">
	<nav class="o-navbar--gary" role="complementary">
		<div class="o-breadcrumb--arrow">
			<span class="o-breadcrumb__link"><a href="<c:url value="/dashboard"/>" role="link" title="<fmt:message key="nav.dashboard"/>"><fmt:message key="nav.dashboard"/></a></span>
			<span class="o-breadcrumb__link"><a href="<c:url value="/dashboard/financeiro"/>" role="link" title="<fmt:message key="nav.cadastro"/>"><fmt:message key="nav.financeiro"/></a></span>
			<span class="o-breadcrumb__link"><a class="is-inactive" href="<c:url value="/financeiro/extrato"/>" role="link" title="<fmt:message key="nav.financeiro.extrato"/>"><fmt:message key="nav.financeiro.extrato"/></a></span>
		</div>
	</nav>
	<section class="o-form__body o-form__body--padding">
		<fieldset class="c-block--lube" style="margin-bottom: 1rem;">
			<legend class="c-block__header"><label class="c-block__title"><i class="icon-search"></i>&nbsp;<fmt:message key="titulo.pesquisar"/></label></legend>
			<section class="c-block__body c-block__body--padding">
				<div class="l-row" role="row">
					<div class="u-grid--12" role="separator">
						<label class="o-form__text" for="conta"><fmt:message key="label.conta"/></label>
						<select aria-required="true" class="o-form__data has-validation" data-select="slFinContaBancaria" data-url="slFinanceiro_Conta-bancaria_Json" id="conta" name="parametrosWeb[0].parametroInicial" required></select>
					</div>
				</div>
				<div class="l-row" role="row">
					<div class="u-grid--6" role="separator">
						<label class="o-form__text" for="dataemissao"><fmt:message key="label.data.emissao"/></label>
						<input class="o-form__data has-validation" id="dataemissao" max="31-12-2900" maxlength="10" min="01-01-1900" name="parametrosWeb[1].parametroInicial" onkeypress="checkMask(event);" onkeyup="mask(maskData, this, event);" pattern="data" type="text" value="${parametrosWeb[1].parametroInicial}">
					</div>
					<div class="u-grid--6" role="separator">
						<label class="o-form__text" for="dataemissaoate"><fmt:message key="label.ate"/></label>
						<input class="o-form__data has-validation" id="dataemissaoate" max="31-12-2900" maxlength="10" min="01-01-1900" name="parametrosWeb[1].parametroFinal" onkeypress="checkMask(event);" onkeyup="mask(maskData, this, event);" pattern="data" type="text" value="${parametrosWeb[1].parametroFinal}">
					</div>
				</div>
			</section>
		</fieldset>
		<c:if test="${not empty FinExtratoList}">
			<c:import url="lista.jsp"/>
		</c:if>
	</section>
	<menu class="o-toolbar--lube is-fixedBottomFull" role="menubar">
		<menuitem class="o-toolbar__item" role="menuitem"><a href="<c:url value="/financeiro/extrato/formulario"/>" onclick="ModalController.show(this, event);" role="link" title="<fmt:message key="button.novo"/>"><i class="icon-plus"></i>&nbsp;<fmt:message key="button.novo"/></a></menuitem>
		<menuitem class="o-toolbar__item" role="menuitem"><button role="button" title="<fmt:message key="button.pesquisar"/>" type="submit"><i class="icon-search"></i>&nbsp;<fmt:message key="button.pesquisar"/></button></menuitem>
	</menu>
</form>
<%@include file="/config/footer.jsp"%>