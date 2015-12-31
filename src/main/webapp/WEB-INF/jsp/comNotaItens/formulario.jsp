<%@include file="/config/taglibraries.jsp" %>
<%@include file="/config/libraries-style.jsp"%>
<c:set var="readOnly" value="${obj.id != null ? 'readonly' : ''}"/>
<c:set var="disabled" value="${obj.id != null ? 'disabled' : ''}"/>
<div class="container-tie">
	<form action="<c:url value="/comercio/nota-itens"/>" class="form-block" id="formcomnotaitens" method="post" name="formcomnotaitens" onsubmit="return enviarPost(this);" role="form">
		<input type="hidden" name="openBoxSearch" value="psprodutoservico">
		<input type="hidden" name="obj.id" value="${obj.id}">
		<input type="hidden" name="obj.idnota.id" value="${obj.idnota.id}">
		<div class="container-header">
			<div class="row">
				<div class="col-xs-12-last col-sm-12-last col-md-12-last col-lg-12-last">
					<h2><fmt:message key="nav.comercio"/>&nbsp;<fmt:message key="label.barra"/>&nbsp;<fmt:message key="nav.comercio.operacional"/>&nbsp;<fmt:message key="label.barra"/>&nbsp;<fmt:message key="nav.comercio.operacional.compra.venda"/></h2>
				</div>
				<div class="col-xs-12-last col-sm-12-last col-md-12 col-lg-12">
					<button class="btn-md float-left m-right-5" title="<fmt:message key="button.salvar"/>" type="submit"><span class="icon-floppy-disk"></span>&nbsp;<fmt:message key="button.salvar"/></button>
				</div>
			</div>
		</div>
		<section aria-expanded="true" aria-hidden="false" class="clearfix" role="form">
			<div class="row" role="row">
				<div class="col-xs-2 col-sm-2 col-md-2 col-lg-2" role="separator">
					<label><fmt:message key="label.id.item"/></label>
					<input class="input-form" data-toggle="modal" formaction="<c:url value="/produto-servico/listarsl"/>" id="psprodutoservico_id" maxlength="10" name="obj.iditem.id" required type="search" value="${obj.iditem.id}">
					<netsis:validationMessage name="obj.iditem.id"/>
				</div>
				<div class="col-xs-10-last col-sm-10-last col-md-10-last col-lg-10-last" role="separator">
					<label><fmt:message key="label.descricao"/></label>
					<input class="input-form" id="psprodutoservico_descricao" readonly type="text" value="${obj.iditem.descricao}">
					<netsis:validationMessage name="obj.iditem.descricao"/>
				</div>
			</div>
			<div class="row" role="row">
				<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6" role="separator">
					<label><fmt:message key="label.quantidade"/></label>
					<input class="input-form" maxlength="10" name="obj.quantidade" pattern="numeric10_2" required type="text" value="${obj.quantidade}">
					<netsis:validationMessage name="obj.quantidade"/>
				</div>
				<div class="col-xs-6-last col-sm-6-last col-md-6-last col-lg-6-last" role="separator">
					<label><fmt:message key="label.valor.unitario"/></label>
					<input class="input-form" id="psprodutoservico_custo_valorvenda" maxlength="13" name="obj.valorunitario" pattern="numeric10_2" required type="text" value="${obj.valorunitario}">
					<netsis:validationMessage name="obj.valorunitario"/>
				</div>
			</div>
			<div class="row" role="row">
				<div class="col-xs-3 col-sm-3 col-md-3 col-lg-3" role="separator">
					<label><fmt:message key="label.porc.icms"/></label>
					<input class="input-form" maxlength="13" name="obj.porcicms" pattern="numeric10_2" type="text" value="${obj.porcicms}">
					<netsis:validationMessage name="obj.porcicms"/>
				</div>
				<div class="col-xs-3 col-sm-3 col-md-3 col-lg-3" role="separator">
					<label><fmt:message key="label.porc.ipi"/></label>
					<input class="input-form" maxlength="13" name="obj.porcipi" pattern="numeric10_2" type="text" value="${obj.porcipi}">
					<netsis:validationMessage name="obj.porcipi"/>
				</div>
				<div class="col-xs-3 col-sm-3 col-md-3 col-lg-3" role="separator">
					<label><fmt:message key="label.porc.lucro"/></label>
					<input class="input-form" maxlength="13" name="obj.porclucro" pattern="numeric10_2" type="text" value="${obj.porclucro}">
					<netsis:validationMessage name="obj.porclucro"/>
				</div>
				<div class="col-xs-3-last col-sm-3-last col-md-3-last col-lg-3-last" role="separator">
					<label><fmt:message key="label.porc.desconto"/></label>
					<input class="input-form" maxlength="13" name="obj.porcdesconto" pattern="numeric10_2" type="text" value="${obj.porcdesconto}">
					<netsis:validationMessage name="obj.porcdesconto"/>
				</div>
			</div>
			<div class="row" role="row">
				<div class="col-xs-12-last col-sm-12-last col-md-12-last col-lg-12-last" role="separator">
					<label><fmt:message key="label.valor.total"/></label>
					<input class="input-form" readonly type="text" value="${obj.valortotal}">
					<netsis:validationMessage name="obj.valortotal"/>
				</div>
			</div>
		</section>
	</form>
</div>
<%@include file="/config/libraries-js.jsp"%>