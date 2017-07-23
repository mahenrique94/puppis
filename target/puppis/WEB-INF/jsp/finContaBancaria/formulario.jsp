<%@include file="/config/header.jsp" %>
<c:set var="autoFocus" value="${obj.id != null ? '' : 'autofocus'}"/>
<form action="<c:url value="/financeiro/conta-bancaria"/>" class="o-form" id="formfincontabancaria" method="post" name="formfincontabancaria" role="form">
	<input aria-hidden="true" name="obj.id" type="hidden" value="${obj.id}">
	<input aria-hidden="true" name="obj.idbanco.idaux" type="hidden" value="${obj.idbanco.id}">
	<input aria-hidden="true" name="obj.idtipocontabancaria.idaux" type="hidden" value="${obj.idtipocontabancaria.id}">
	<nav class="o-navbar--gary" role="complementary">
		<div class="o-breadcrumb--arrow">
			<span class="o-breadcrumb__link"><a href="<c:url value="/dashboard"/>" role="link" title="<fmt:message key="nav.dashboard"/>"><fmt:message key="nav.dashboard"/></a></span>
			<span class="o-breadcrumb__link"><a href="<c:url value="/dashboard/cadastro"/>" role="link" title="<fmt:message key="nav.cadastro"/>"><fmt:message key="nav.cadastro"/></a></span>
			<span class="o-breadcrumb__link"><a href="<c:url value="/financeiro/conta-bancaria"/>" role="link" title="<fmt:message key="nav.cadastro.conta.bancaria"/>"><fmt:message key="nav.cadastro.conta.bancaria"/></a></span>
			<span class="o-breadcrumb__link"><a href="<c:url value="/financeiro/conta-bancaria"/>" role="link" title="<fmt:message key="nav.lista"/>"><fmt:message key="nav.lista"/></a></span>
			<span class="o-breadcrumb__link"><a class="is-inactive" href="<c:url value="/financeiro/conta-bancaria/formulario"/>" role="link" title="<fmt:message key="nav.formulario"/>"><fmt:message key="nav.formulario"/></a></span>
		</div>
	</nav>
	<section class="o-form__body o-form__body--padding">
		<div class="l-row" role="row">
			<div class="u-grid--6" role="grid">
				<label class="o-form__text" for="banco"><fmt:message key="label.banco"/><validate:validationMessage name="obj.idbanco.id"/></label>
				<select aria-required="true" class="o-form__data has-validation" data-select="slFinBanco" data-url="slFinanceiro_Banco_Json" id="banco" name="obj.idbanco.id" required></select>
			</div>
			<div class="u-grid--6" role="grid">
				<label class="o-form__text" for="tipo"><fmt:message key="label.tipo"/><validate:validationMessage name="obj.idtipocontabancaria.id"/></label>
				<select aria-required="true" class="o-form__data has-validation" data-select="slFinTipoContaBancaria" data-url="slFinanceiro_Tipo-de-conta-bancaria_Json" id="tipo" name="obj.idtipocontabancaria.id" required></select>
			</div>
		</div>
		<div class="l-row" role="row">
			<div class="u-grid--6" role="grid">
				<label class="o-form__text" for="agencia"><fmt:message key="label.agencia"/><validate:validationMessage name="obj.agencia"/></label>
				<input aria-required="true" class="o-form__data has-validation" id="agencia" maxlength="10" name="obj.agencia" pattern="letraNumeroBarraPontoTraco" required type="text" value="${obj.agencia}">
			</div>
			<div class="u-grid--6" role="grid">
				<label class="o-form__text" for="conta"><fmt:message key="label.conta"/><validate:validationMessage name="obj.numeroconta"/></label>
				<input aria-required="true" class="o-form__data has-validation" id="contaconta" maxlength="10" name="obj.numeroconta" pattern="letraNumeroPontoTraco" required type="text" value="${obj.numeroconta}">
			</div>
		</div>
		<div class="l-row" role="row">
			<div class="u-grid--12" role="grid">
				<label class="o-form__text" for="titular"><fmt:message key="label.titular"/><validate:validationMessage name="obj.nometitular"/></label>
				<input aria-required="true" class="o-form__data has-validation" id="titular" maxlength="60" name="obj.nometitular" pattern="espacoLetraNumero" required type="text" value="${obj.nometitular}">
			</div>
		</div>
		<div class="l-row" role="row">
			<div class="u-grid--12" role="grid">
				<label class="o-form__text" for="inativo"><fmt:message key="label.inativo"/><validate:validationMessage name="obj.inativo"/></label>
				<input <c:if test="${obj.inativo == true}">checked</c:if> class="o-mark__data--checkbox" id="inativo" name="obj.inativo" type="hidden" value="${obj.inativo}">
				<label class="o-mark__text"><span class="o-mark__element" data-marked="true" data-unmarked="false" onclick="MarkController.mark(this);"></span></label>
			</div>
		</div>
	</section>
	<menu class="o-toolbar--lube is-fixedBottomFull" role="menubar">
		<menuitem class="o-toolbar__item" role="menuitem"><button role="button" title="<fmt:message key="button.salvar"/>" type="submit"><i class="icon-floppy"></i>&nbsp;<fmt:message key="button.salvar"/></button></menuitem>
		<menuitem class="o-toolbar__item" role="menuitem"><a href="<c:url value="/financeiro/conta-bancaria"/>" role="link" title="<fmt:message key="button.pesquisar"/>"><i class="icon-search"></i>&nbsp;<fmt:message key="button.pesquisar"/></a></menuitem>
	</menu> 
</form>
<%@include file="/config/footer.jsp"%>