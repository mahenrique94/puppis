<%@include file="/config/taglibraries.jsp" %>
<%@include file="/config/libraries-style.jsp"%>
<form action="<c:url value="/pessoa/definicao"/>" class="form-modern" id="formpesdefinicao" method="post" name="formpesdefinicao" onsubmit="return enviarPost(this);" role="form">
	<input name="obj.id" type="hidden" value="${obj.id}">
	<input name="obj.idpessoa.id" type="hidden" value="${obj.idpessoa.id}">
	<input name="obj.idtipo.idaux" type="hidden" value="${obj.idtipo.id}">
	<nav class="band-nav-lube" role="complementary">
		<div class="row" role="row">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" role="separator">
				<label><fmt:message key="nav.cadastro.pessoa.definicao"/></label>					
			</div>
		</div>
	</nav>
	<section aria-expanded="true" aria-hidden="false" class="form-body" role="form">
		<div class="row" role="row">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" role="separator">
				<label><fmt:message key="label.tipo"/></label>
				<select class="form-data validate" data-class="sl" id="slPessoa_Tipo_Json_01" name="obj.idtipo.id"></select>
				<netsis:validationMessage name="obj.idtipo.id"/>
			</div>
		</div>
		<div class="row" role="row">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" role="separator">
				<label><fmt:message key="label.inativo"/></label>
				<input <c:if test="${obj.inativo == true}">checked</c:if> class="form-data" name="obj.inativo" type="checkbox" value="true">
				<netsis:validationMessage name="obj.inativo"/>
			</div>
		</div>
	</section>
</form>
<nav class="nav-group-lube nav-fixed-bottom" role="complementary">
	<ul>
		<li><button form="formpesdefinicao" title="<fmt:message key="button.salvar"/>" type="submit"><i class="icon-floppy"></i>&nbsp;<fmt:message key="button.salvar"/></button></li>
	</ul>
</nav>
<%@include file="/config/libraries-js.jsp"%>