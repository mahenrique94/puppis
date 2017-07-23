<%@include file="/config/header.jsp" %>
<c:set var="autoFocus" value="${obj.id != null ? '' : 'autofocus'}"/>
<form action="<c:url value="/tabela-de-preco"/>" class="o-form" id="formtblpreco" method="post" name="formtblpreco" role="form">
	<input aria-hidden="true" name="obj.id" type="hidden" value="${obj.id}">
	<input aria-hidden="true" name="obj.idprodutoservico.idaux" type="hidden" value="${obj.idprodutoservico.id}">
	<nav class="o-navbar--gary" role="complementary">
		<div class="o-breadcrumb--arrow">
			<span class="o-breadcrumb__link"><a href="<c:url value="/dashboard"/>" role="link" title="<fmt:message key="nav.dashboard"/>"><fmt:message key="nav.dashboard"/></a></span>
			<span class="o-breadcrumb__link"><a href="<c:url value="/dashboard/cadastro"/>" role="link" title="<fmt:message key="nav.cadastro"/>"><fmt:message key="nav.cadastro"/></a></span>
			<span class="o-breadcrumb__link"><a href="<c:url value="/tabela-de-preco"/>" role="link" title="<fmt:message key="nav.cadastro.tabela.preco"/>"><fmt:message key="nav.cadastro.tabela.preco"/></a></span>
			<span class="o-breadcrumb__link"><a href="<c:url value="/tabela-de-preco"/>" role="link" title="<fmt:message key="nav.lista"/>"><fmt:message key="nav.lista"/></a></span>
			<span class="o-breadcrumb__link"><a class="is-inactive" href="<c:url value="/tabela-de-preco/formulario"/>" role="link" title="<fmt:message key="nav.formulario"/>"><fmt:message key="nav.formulario"/></a></span>
		</div>
	</nav>
	<section class="o-form__body o-form__body--padding">
		<div class="l-row" role="row">
			<div class="u-grid--12" role="grid">
				<label class="o-form__text" for="item"><fmt:message key="label.item"/><validate:validationMessage name="obj.idprodutoservico.id"/></label>
				<select aria-required="true" ${autoFocus} class="o-form__data has-validation ss-search" data-select="sl" data-url="slProduto-Servico_Json" id="item" name="obj.idprodutoservico.id" required></select>
			</div>
		</div>
		<c:if test="${obj.id != null}">
			<fieldset class="c-block--lube" style="margin-bottom: 1rem;">
				<legend class="c-block__header"><label class="c-block__title"><i class="icon-male"></i>&nbsp;<fmt:message key="titulo.pessoa"/></label></legend>
				<section class="c-block__body">
					<div class="o-band--gary">
						<a class="o-button--lube o-button--small" href="<c:url value="/tabela-de-preco/pessoa/formulario/${obj.id}"/>" onclick="ModalController.show(this, event);" role="link" title="<fmt:message key="button.novo"/>"><i class="icon-plus"></i>&nbsp;<fmt:message key="button.novo"/></a>
					</div>
					<div class="js-loadgrid" data-load="<c:url value="/tabela-de-preco/pessoa/loadgrid/${obj.id}"/>" id="tblprecopessoa01"></div>
				</section>
			</fieldset>
		</c:if>
	</section>
	<menu class="o-toolbar--lube is-fixedBottomFull" role="menubar">
		<menuitem class="o-toolbar__item" role="menuitem"><a href="<c:url value="/tabela-de-preco/formulario"/>" role="link" title="<fmt:message key="button.novo"/>"><i class="icon-plus"></i>&nbsp;<fmt:message key="button.novo"/></a></menuitem>
		<menuitem class="o-toolbar__item" role="menuitem"><button role="button" title="<fmt:message key="button.salvar"/>" type="submit"><i class="icon-floppy"></i>&nbsp;<fmt:message key="button.salvar"/></button></menuitem>
		<menuitem class="o-toolbar__item" role="menuitem"><a href="<c:url value="/tabela-de-preco"/>" role="link" title="<fmt:message key="button.pesquisar"/>"><i class="icon-search"></i>&nbsp;<fmt:message key="button.pesquisar"/></a></menuitem>
	</menu> 
</form>
<%@include file="/config/footer.jsp"%>