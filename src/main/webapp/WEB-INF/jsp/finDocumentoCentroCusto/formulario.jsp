<%@include file="/config/taglibraries.jsp" %>
<%@include file="/config/libraries-style.jsp" %>
<div class="container-tie">
	<form action="<c:url value="/financeiro/documento/centro-de-custo"/>" class="form-block" id="formfindocumentocentrocusto" method="post" name="formfindocumentocentrocusto" onsubmit="return enviarPost(this);" role="form">
		<input name="openBoxSearch" type="hidden" value="cadcentrocusto">
		<input name="obj.id" type="hidden" value="${obj.id}">
		<input name="obj.iddocumento.id" type="hidden" value="${obj.iddocumento.id}">
		<div class="container-header">
			<div class="row">
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
					<h2><fmt:message key="nav.financeiro"/>&nbsp;<fmt:message key="label.barra"/>&nbsp;<fmt:message key="nav.operacional"/>&nbsp;<fmt:message key="label.barra"/>&nbsp;<fmt:message key="nav.financeiro.operacional.documento"/>&nbsp;<fmt:message key="label.barra"/>&nbsp;<fmt:message key="tab.centro.custo"/></h2>
				</div>
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
					<button class="btn-md float-left m-right-5" title="<fmt:message key="button.salvar"/>" type="submit"><span class="icon-floppy-disk"></span>&nbsp;<fmt:message key="button.salvar"/></button>
				</div>
			</div>
		</div>
		<section aria-expanded="true" aria-hidden="false" class="clearfix" role="form">
			<div class="row" role="row">
				<div class="col-xs-2 col-sm-2 col-md-2 col-lg-2" role="separator">
					<label><fmt:message key="label.id.centro.custo"/></label>
					<input class="input-form" data-toggle="modal" formaction="<c:url value="/cadastro/centro-de-custo/listarsl"/>" id="cadcentrocusto_id" name="obj.idcentrocusto.id" required type="search" value="${obj.idcentrocusto.id}">
					<netsis:validationMessage name="obj.idcentrocusto.id"/>
				</div>
				<div class="col-xs-10 col-sm-10 col-md-10 col-lg-10" role="separator">
					<label><fmt:message key="label.descricao"/></label>
					<input class="input-form" id="cadcentrocusto_descricao" readonly type="text" value="${obj.idcentrocusto.descricao}">
					<netsis:validationMessage name="obj.idcentrocusto.descricao"/>
				</div>
			</div>
		</section>
	</form>
</div>
<%@include file="/config/libraries-js.jsp" %>