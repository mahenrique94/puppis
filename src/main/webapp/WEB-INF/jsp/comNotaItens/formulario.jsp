<%@include file="/config/taglibraries.jsp" %>
<%@include file="/config/libraries-style.jsp"%>
<fieldset class="block-lube no-border w-100">
	<legend class="block-header">
		<h1 class="block-title"><label><fmt:message key="nav.comercio"/>&nbsp;<fmt:message key="label.barra"/>&nbsp;<fmt:message key="nav.comercio.operacional"/>&nbsp;<fmt:message key="label.barra"/>&nbsp;<fmt:message key="nav.comercio.operacional.compra.venda"/></label></h1>
	</legend>
	<form action="<c:url value="/nota-itens"/>" class="form-inline" id="formlistarcadsetor" method="post" name="formlistarcadsetor" onsubmit="return enviarPost(this);" role="form">
		<input type="hidden" name="openBoxSearch" value="psprodutoservico">
		<input type="hidden" name="obj.id" value="${obj.id}">
		<input type="hidden" name="obj.idnota.id" value="${obj.idnota.id}">
		<nav class="clearfix nav-block" role="navigation">
			<div class="w-100">
				<button class="btn-md float-left m-right-5" title="<fmt:message key="button.salvar"/>" type="submit"><span class="icon-floppy-disk"></span>&nbsp;<fmt:message key="button.salvar"/></button>
			</div>
		</nav>
		<section aria-expanded="true" aria-hidden="false" class="block-body clearfix" role="form">
			<div class="row-input" role="row">
				<div class="w-20" role="separator">
					<label class="align-left"><fmt:message key="label.id.item"/></label>
					<input class="input-form" data-toggle="modal" formaction="<c:url value="/produto-servico/listarsl"/>" id="psprodutoservico_id" maxlength="10" name="obj.iditem.id" required type="search" value="${obj.iditem.id}">
					<netsis:validationMessage name="obj.iditem.id"/>
				</div>
				<div class="w-80" role="separator">
					<label class="align-left"><fmt:message key="label.descricao"/></label>
					<input class="input-form full-block-no-border" id="psprodutoservico_descricao" readonly type="text" value="${obj.iditem.descricao}">
					<netsis:validationMessage name="obj.iditem.descricao"/>
				</div>
			</div>
			<div class="row-input" role="row">
				<div class="w-50" role="separator">
					<label class="align-left"><fmt:message key="label.quantidade"/></label>
					<input class="input-form" maxlength="10" name="obj.quantidade" pattern="numeric10_2" required type="text" value="${obj.quantidade}">
					<netsis:validationMessage name="obj.quantidade"/>
				</div>
				<div class="w-50" role="separator">
					<label class="align-left"><fmt:message key="label.valor.unitario"/></label>
					<input class="input-form full-block-no-border" id="psprodutoservico_custo_valorvenda" maxlength="13" name="obj.valorunitario" pattern="numeric10_2" required type="text" value="${obj.valorunitario}">
					<netsis:validationMessage name="obj.valorunitario"/>
				</div>
			</div>
			<div class="row-input" role="row">
				<div class="w-25" role="separator">
					<label class="align-left"><fmt:message key="label.porc.icms"/></label>
					<input class="input-form" maxlength="13" name="obj.porcicms" pattern="numeric10_2" type="text" value="${obj.porcicms}">
					<netsis:validationMessage name="obj.porcicms"/>
				</div>
				<div class="w-25" role="separator">
					<label class="align-left"><fmt:message key="label.porc.ipi"/></label>
					<input class="input-form" maxlength="13" name="obj.porcipi" pattern="numeric10_2" type="text" value="${obj.porcipi}">
					<netsis:validationMessage name="obj.porcipi"/>
				</div>
				<div class="w-25" role="separator">
					<label class="align-left"><fmt:message key="label.porc.lucro"/></label>
					<input class="input-form" maxlength="13" name="obj.porclucro" pattern="numeric10_2" type="text" value="${obj.porclucro}">
					<netsis:validationMessage name="obj.porclucro"/>
				</div>
				<div class="w-25" role="separator">
					<label class="align-left"><fmt:message key="label.porc.desconto"/></label>
					<input class="input-form full-block-no-border" maxlength="13" name="obj.porcdesconto" pattern="numeric10_2" type="text" value="${obj.porcdesconto}">
					<netsis:validationMessage name="obj.porcdesconto"/>
				</div>
			</div>
			<div class="row-input" role="row">
				<div class="w-100" role="separator">
					<label class="align-left"><fmt:message key="label.valor.total"/></label>
					<input class="input-form full-block-no-border" readonly type="text" value="${obj.valortotal}">
					<netsis:validationMessage name="obj.valortotal"/>
				</div>
			</div>
		</section>
	</form>
</fieldset>
<%@include file="/config/libraries-js.jsp"%>