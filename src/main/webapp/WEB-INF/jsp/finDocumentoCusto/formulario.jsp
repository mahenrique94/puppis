<%@include file="/config/taglibraries.jsp" %>
<%@include file="/config/libraries-style.jsp" %>
<div class="container-tie">
	<form action="<c:url value="/financeiro/documento/custo"/>" class="form-block" id="formfindocumentocusto" method="post" name="formfindocumentocentrocusto" onsubmit="return enviarPost(this);" role="form">
		<input name="obj.id" type="hidden" value="${obj.id}">
		<input name="obj.iddocumento.id" type="hidden" value="${obj.iddocumento.id}">
		<div class="container-header">
			<div class="row">
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
					<h2><fmt:message key="nav.financeiro"/>&nbsp;<fmt:message key="label.barra"/>&nbsp;<fmt:message key="nav.operacional"/>&nbsp;<fmt:message key="label.barra"/>&nbsp;<fmt:message key="nav.financeiro.operacional.documento"/>&nbsp;<fmt:message key="label.barra"/>&nbsp;<fmt:message key="tab.custo"/></h2>
				</div>
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
					<button class="btn-md float-left m-right-5" title="<fmt:message key="button.salvar"/>" type="submit"><span class="icon-floppy-disk"></span>&nbsp;<fmt:message key="button.salvar"/></button>
				</div>
			</div>
		</div>
		<section aria-expanded="true" aria-hidden="false" class="clearfix" role="form">
			<div class="row" role="row">
			</div>
		</section>
	</form>
</div>
<%@include file="/config/libraries-js.jsp" %>