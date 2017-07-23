<%@include file="/config/taglibraries.jsp" %>
<%@include file="/config/libraries-style.jsp"%>
<form action="<c:url value="/tabela-de-preco/pessoa"/>" class="o-form"id="formtblprecopessoa" method="post" name="formtblprecopessoa" onsubmit="requestModal(this, event);" role="form">
	<input aria-hidden="true" name="obj.id" type="hidden" value="${obj.id}">
	<input aria-hidden="true" name="obj.idtabelapreco.id" type="hidden" value="${obj.idtabelapreco.id}">
	<input aria-hidden="true" name="obj.iddefinicao.idaux" type="hidden" value="${obj.iddefinicao.id}">
	<header class="o-modal__header">
		<label class="o-modal__title" id="o-modal__title--1"><i class="icon-male"></i>&nbsp;<fmt:message key="titulo.tblpreco.pessoa"/></label>
	</header>
	<section class="o-modal__body" style="padding-top: 67px;">
		<c:import url="tabs.jsp"/>
	</section>
	<footer class="o-modal__footer is-alignRight">
		<button class="o-button--ren o-button--large" role="button" title="<fmt:message key="button.salvar"/>" type="submit"><i class="icon-floppy"></i>&nbsp;<fmt:message key="button.salvar"/></button> 
	</footer>
</form>
<%@include file="/config/libraries-js.jsp"%>