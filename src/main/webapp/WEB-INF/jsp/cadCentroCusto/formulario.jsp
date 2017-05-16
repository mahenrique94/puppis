<%@include file="/config/header.jsp" %>
<c:set var="autoFocus" value="${obj.id != null ? '' : 'autofocus'}"/>
<form action="<c:url value="/cadastro/centro-de-custo"/>" class="o-form" id="formcadcentrocusto" method="post" name="formcadcentrocusto" role="form">
	<input aria-hidden="true" name="obj.id" type="hidden" value="${obj.id}">
	<input aria-hidden="true" name="obj.idcentrocustomaster.idaux" type="hidden" value="${obj.idcentrocustomaster.id}">
	<nav class="o-navbar--gary" role="complementary">
		<div class="o-breadcrumb--arrow">
			<span class="o-breadcrumb__link"><a href="<c:url value="/dashboard"/>" role="link" title="<fmt:message key="nav.dashboard"/>"><fmt:message key="nav.dashboard"/></a></span>
			<span class="o-breadcrumb__link"><a href="<c:url value="/dashboard/cadastro"/>" role="link" title="<fmt:message key="nav.cadastro"/>"><fmt:message key="nav.cadastro"/></a></span>
			<span class="o-breadcrumb__link"><a href="<c:url value="/cadastro/centro-de-custo"/>" role="link" title="<fmt:message key="nav.cadastro.centro.custo"/>"><fmt:message key="nav.cadastro.centro.custo"/></a></span>
			<span class="o-breadcrumb__link"><a href="<c:url value="/cadastro/centro-de-custo"/>" role="link" title="<fmt:message key="nav.lista"/>"><fmt:message key="nav.lista"/></a></span>
			<span class="o-breadcrumb__link"><a class="is-inactive" href="<c:url value="/cadastro/centro-de-custo/formulario"/>" role="link" title="<fmt:message key="nav.formulario"/>"><fmt:message key="nav.formulario"/></a></span>
		</div>
	</nav>
	<section class="o-form__body o-form__body--padding">
		<div class="l-row" role="row">
			<div class="u-grid--6" role="grid">
				<label class="o-form__text" for="descricao"><fmt:message key="label.descricao"/><validate:validationMessage name="obj.descricao"/></label>
				<input aria-required="true" ${autoFocus} class="o-form__data has-validation" id="descricao" maxlength="60" name="obj.descricao" pattern="espacoLetra" required type="text" value="${obj.descricao}">
			</div>
			<div class="u-grid--6" role="grid">
				<label class="o-form__text" for="descricaomaster"><fmt:message key="label.descricao.master"/><validate:validationMessage name="obj.idcentrocustomaster.id"/></label>
				<select class="o-form__data has-validation ss-search" data-select="sl" data-url="slCadastro_Centro-de-Custo_Json" id="descricaomaster" name="obj.idcentrocustomaster.id"></select>
			</div>
		</div>
	</section>
	<menu class="o-toolbar--lube is-fixedBottomFull" role="menubar">
		<menuitem class="o-toolbar__item" role="menuitem"><button role="button" title="<fmt:message key="button.salvar"/>" type="submit"><i class="icon-floppy"></i>&nbsp;<fmt:message key="button.salvar"/></button></menuitem>
		<menuitem class="o-toolbar__item" role="menuitem"><a href="<c:url value="/cadastro/centro-de-custo"/>" role="link" title="<fmt:message key="button.pesquisar"/>"><i class="icon-search"></i>&nbsp;<fmt:message key="button.pesquisar"/></a></menuitem>
	</menu> 
</form>
<%@include file="/config/footer.jsp"%>