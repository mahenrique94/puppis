<%@include file="/config/header.jsp" %>
<form action="<c:url value="/financeiro/documento/transferencia"/>" class="o-form" id="formfindocumentotransferencia" method="post" name="formfindocumentotransferencia" role="form">
    <nav class="o-navbar--gary" role="complementary">
        <div class="o-breadcrumb--arrow">
            <span class="o-breadcrumb__link"><a href="<c:url value="/dashboard"/>" role="link" title="<fmt:message key="nav.dashboard"/>"><fmt:message key="nav.dashboard"/></a></span>
            <span class="o-breadcrumb__link"><a href="<c:url value="/dashboard/financeiro"/>" role="link" title="<fmt:message key="nav.cadastro"/>"><fmt:message key="nav.financeiro"/></a></span>
            <span class="o-breadcrumb__link"><a class="is-inactive" href="<c:url value="/financeiro/documento/transferencia"/>" role="link" title="<fmt:message key="nav.financeiro.transferencia"/>"><fmt:message key="nav.financeiro.transferencia"/></a></span>
        </div>
    </nav>
    <section class="o-form__body o-form__body--padding">
        <div class="l-row" role="row">
            <div class="u-grid--6" role="grid">
                <label class="o-form__text" for="idContaOrigem"><fmt:message key="label.conta.origem"/></label>
                <select aria-required="true" class="o-form__data has-validation" data-select="slFinContaBancaria" data-url="slFinanceiro_Conta-bancaria_Json" id="idContaOrigem" name="idContaOrigem" required></select>
            </div>
            <div class="u-grid--6" role="grid">
                <label class="o-form__text" for="idContaDestino"><fmt:message key="label.conta.destino"/></label>
                <select aria-required="true" class="o-form__data has-validation" data-select="slFinContaBancaria" data-url="slFinanceiro_Conta-bancaria_Json" id="idContaDestino" name="idContaDestino" required></select>
            </div>
        </div>
        <div class="l-row" role="row">
            <div class="u-grid--12" role="grid">
                <label class="o-form__text" for="valor"><fmt:message key="label.valor"/></label>
                <input aria-required="true" class="o-form__data has-validation" id="valor" maxlength="13" name="valor" pattern="numeric10-2" required type="text" value="${parametrosWeb[7].parametroInicial}"/>
            </div>
        </div>
    </section>
    <menu class="o-toolbar--lube is-fixedBottomFull" role="menubar">
        <menuitem class="o-toolbar__item" role="menuitem"><button role="button" title="<fmt:message key="button.transferir"/>" type="submit"><i class="icon-exchange"></i>&nbsp;<fmt:message key="button.transferir"/></button></menuitem>
    </menu>
</form>
<%@include file="/config/footer.jsp"%>