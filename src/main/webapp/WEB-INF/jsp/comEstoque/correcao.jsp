<%@include file="/config/header.jsp" %>
<form action="<c:url value="/comercio/estoque/correcao"/>" class="o-form" id="formcomnota" method="post" name="formcomnota" role="form">
	<nav class="o-navbar--gary" role="complementary">
		<div class="o-breadcrumb--arrow">
			<span class="o-breadcrumb__link"><a href="<c:url value="/dashboard"/>" role="link" title="<fmt:message key="nav.dashboard"/>"><fmt:message key="nav.dashboard"/></a></span>
			<span class="o-breadcrumb__link"><a href="<c:url value="/dashboard/comercio"/>" role="link" title="<fmt:message key="nav.comercio"/>"><fmt:message key="nav.comercio"/></a></span>
			<span class="o-breadcrumb__link"><a class="is-inactive" href="<c:url value="/comercio/estoque/correcao"/>" role="link" title="<fmt:message key="nav.comercio.correcao.estoque"/>"><fmt:message key="nav.comercio.correcao.estoque"/></a></span>
		</div>
	</nav>
	<section class="o-form__body o-form__body--padding">
		<div class="l-row" role="row">
			<div class="u-grid--12" role="grid">
				<label class="o-form__text" for="movimentotipo"><fmt:message key="label.movimento.tipo"/></label>
				<select aria-required="true" class="o-form__data has-validation" data-select="sl" data-url="slProduto-Servico_Movimento_Tipo_json" id="movimentotipo" name="idMovimento" required></select>
			</div>
		</div>
		<div class="l-row" role="row">
			<div class="u-grid--12" role="grid">
				<label class="o-form__text" for="produtoservico"><fmt:message key="label.produto.servico"/></label>
				<select aria-required="true" class="o-form__data has-validation" data-select="sl" data-url="slProduto-Servico_Json" id="produtoservico" name="idProduto" required></select>
			</div>
		</div>
		<div class="l-row" role="row">
			<div class="u-grid--12" role="grid">
				<label class="o-form__text" for="quantidade"><fmt:message key="label.quantidade"/></label>
				<input aria-required="true" class="o-form__data has-validation" id="quantidade" maxlength="13" name="quantidade" pattern="numeric10-2" required type="text">
			</div>
		</div>
	</section>
	<menu class="o-toolbar--lube is-fixedBottomFull" role="menubar">
		<menuitem class="o-toolbar__item" role="menuitem"><button role="button" title="<fmt:message key="button.processar"/>" type="submit"><i class="icon-spin6"></i>&nbsp;<fmt:message key="button.processar"/></button></menuitem>
	</menu> 
</form>
<%@include file="/config/footer.jsp"%>