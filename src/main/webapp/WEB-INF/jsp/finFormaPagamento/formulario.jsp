<%@include file="/config/header.jsp" %>
<c:set var="autoFocus" value="${obj.id != null ? '' : 'autofocus'}"/>
<form action="<c:url value="/financeiro/forma-de-pagamento"/>" class="o-form" id="formfinformapagamento" method="post" name="formfinformapagamento" role="form">
	<input aria-hidden="true" name="obj.id" type="hidden" value="${obj.id}">
	<nav class="o-navbar--gary" role="complementary">
		<div class="o-breadcrumb--arrow">
			<span class="o-breadcrumb__link"><a href="<c:url value="/dashboard"/>" role="link" title="<fmt:message key="nav.dashboard"/>"><fmt:message key="nav.dashboard"/></a></span>
			<span class="o-breadcrumb__link"><a href="<c:url value="/dashboard/cadastro"/>" role="link" title="<fmt:message key="nav.cadastro"/>"><fmt:message key="nav.cadastro"/></a></span>
			<span class="o-breadcrumb__link"><a href="<c:url value="/financeiro/forma-de-pagamento"/>" role="link" title="<fmt:message key="nav.cadastro.forma.pagamento"/>"><fmt:message key="nav.cadastro.forma.pagamento"/></a></span>
			<span class="o-breadcrumb__link"><a href="<c:url value="/financeiro/forma-de-pagamento"/>" role="link" title="<fmt:message key="nav.lista"/>"><fmt:message key="nav.lista"/></a></span>
			<span class="o-breadcrumb__link"><a class="is-inactive" href="<c:url value="/financeiro/forma-de-pagamento"/>" role="link" title="<fmt:message key="nav.formulario"/>"><fmt:message key="nav.formulario"/></a></span>
		</div>
	</nav>
	<section class="o-form__body o-form__body--padding">
		<div class="l-row" role="row">
			<div class="u-grid--12" role="grid">
				<label class="o-form__text" for="descricao"><fmt:message key="label.descricao"/><validate:validationMessage name="obj.descricao"/></label>
				<input aria-required="true" ${autoFocus} class="o-form__data has-validation" id="descricao" maxlength="30" name="obj.descricao" pattern="espacoLetraNumero" required type="text" value="${obj.descricao}">
			</div>
		</div>
		<div class="l-row" role="row">
			<div class="u-grid--6" role="grid">
				<label class="o-form__text" for="quantidadeparcela"><fmt:message key="label.quantidade.parcela"/><validate:validationMessage name="obj.quantidadeparcela"/></label>
				<input aria-required="true" class="o-form__data has-validation" id="quantidadeparcela" min="0" name="obj.quantidadeparcela" pattern="number0to9" required step="1" type="number" value="${obj.quantidadeparcela}">
			</div>
			<div class="u-grid--6" role="grid">
				<label class="o-form__text" for="intervalo"><fmt:message key="label.intervalo"/><validate:validationMessage name="obj.intervalo"/></label>
				<input aria-required="true" class="o-form__data has-validation" id="intervalo" min="0" name="obj.intervalo" pattern="number0to9" required step="1" type="number" value="${obj.intervalo}">
			</div>
		</div>
	</section>
	<menu class="o-toolbar--lube is-fixedBottomFull" role="menubar">
		<menuitem class="o-toolbar__item" role="menuitem"><button role="button" title="<fmt:message key="button.salvar"/>" type="submit"><i class="icon-floppy"></i>&nbsp;<fmt:message key="button.salvar"/></button></menuitem>
		<menuitem class="o-toolbar__item" role="menuitem"><a href="<c:url value="/financeiro/forma-de-pagamento"/>" role="link" title="<fmt:message key="button.pesquisar"/>"><i class="icon-search"></i>&nbsp;<fmt:message key="button.pesquisar"/></a></menuitem>
	</menu> 
</form>
<%@include file="/config/footer.jsp"%>