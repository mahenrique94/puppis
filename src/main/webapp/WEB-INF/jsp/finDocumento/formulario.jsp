<%@include file="/config/header.jsp" %>
<div class="container-tie">
	<form action="<c:url value="/financeiro/documento"/>" class="form-block" id="formfindocumento" method="post" name="formfindocumento" role="form">
		<input name="obj.id" type="hidden" value="${obj.id}">
		<input name="obj.idtipooperacao.idaux" type="hidden" value="${obj.idtipooperacao.id}">
		<div class="container-header">
			<div class="row">
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
					<h2><fmt:message key="nav.financeiro"/>&nbsp;<fmt:message key="label.barra"/>&nbsp;<fmt:message key="nav.operacional"/>&nbsp;<fmt:message key="label.barra"/>&nbsp;<fmt:message key="nav.financeiro.operacional.documento"/></h2>
				</div>
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
					<button class="btn-md float-left m-right-5" title="<fmt:message key="button.salvar"/>" type="submit"><span class="icon-floppy-disk"></span>&nbsp;<fmt:message key="button.salvar"/></button>
					<a href="<c:url value="/financeiro/documento"/>" class="btn-md float-left m-right-5" title="<fmt:message key="button.pesquisar"/>"><span class="icon-search"></span>&nbsp;<fmt:message key="button.pesquisar"/></a>
				</div>
			</div>
		</div>
		<section aria-expanded="true" aria-hidden="false" class="clearfix" role="form">
			<div class="row-input" role="row">
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
					<label><fmt:message key="label.operacao"/></label>
					<select class="select-form" data-class="slSysTipoOperacao" data-fields="idmodulo.id" data-parameters="2" id="slSystem_Tipo-de-operacao_Json_01" name="obj.idtipooperacao.id"></select>
				</div>
			</div>
		</section>
	</form>
</div>
<%@include file="/config/footer.jsp"%>