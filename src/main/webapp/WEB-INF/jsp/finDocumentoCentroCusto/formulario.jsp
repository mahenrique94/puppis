<%@include file="/config/taglibraries.jsp" %>
<%@include file="/config/libraries-style.jsp"%>
<form action="<c:url value="/financeiro/documento/centro-de-custo"/>" class="form-modern" id="formfindocumentocentrocusto" method="post" name="formfindocumentocentrocusto" onsubmit="return enviarPost(this);" role="form">
	<input name="obj.id" type="hidden" value="${obj.id}">
	<input name="obj.iddocumento.id" type="hidden" value="${obj.iddocumento.id}">
	<input name="obj.idcentrocusto.idaux" type="hidden" value="${obj.idcentrocusto.id}">
	<nav class="band-nav-lube" role="complementary">
		<div class="row" role="row">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" role="separator">
				<label><fmt:message key="nav.financeiro.documento.centro.custo"/></label>					
			</div>
		</div>
	</nav>
	<section aria-expanded="true" aria-hidden="false" class="form-body" role="form">
		<div class="row" role="row">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" role="separator">
				<label><fmt:message key="label.id.centro.custo"/></label>
				<select class="form-data ss validate" data-class="sl" id="slCadastro_Centro-de-custo_Json_01" name="obj.idcentrocusto.id"></select>
				<netsis:validationMessage name="obj.idcentrocusto.id"/>
			</div>
		</div>
	</section>
	<nav class="nav-group-tie nav-fixed-bottom" role="complementary">
		<ul>
			<li><button title="<fmt:message key="button.salvar"/>" type="submit"><i class="icon-floppy"></i>&nbsp;<fmt:message key="button.salvar"/></button></li>
		</ul>
	</nav>
</form>
<%@include file="/config/libraries-js.jsp"%>