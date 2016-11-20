<%@include file="/config/taglibraries.jsp" %>
<%@include file="/config/libraries-style.jsp"%>
<form action="<c:url value="/produto-servico/composicao"/>" class="form-modern" id="formpscomposicao" method="post" name="formpscomposicao" onsubmit="return enviarPost(this);" role="form">
	<input name="obj.id" type="hidden" value="${obj.id}">
	<input name="obj.idprodutoservico.id" type="hidden" value="${obj.idprodutoservico.id}">
	<input name="obj.idcomposicao.idaux" type="hidden" value="${obj.idcomposicao.id}">
	<nav class="band-nav-lube" role="complementary">
		<div class="row" role="row">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" role="separator">
				<label><fmt:message key="nav.cadastro.produto.servico.composicao"/></label>					
			</div>
		</div>
	</nav>
	<section aria-expanded="true" aria-hidden="false" class="form-body" role="form">
		<div class="row" role="row">
			<div class="col-xs-10 col-sm-10 col-md-10 col-lg-10" role="separator">
				<label><fmt:message key="label.produto.servico"/></label>
				<select class="form-data ss validate" data-class="sl" id="slProduto-Servico_Json_01" name="obj.idcomposicao.id"></select>
				<netsis:validationMessage name="obj.idcomposicao.id"/>
			</div>
			<div class="col-xs-2 col-sm-@ col-md-2 col-lg-2" role="separator">
				<label><fmt:message key="label.quantidade"/></label>
				<input class="form-data validate" maxlength="10" name="obj.quantidade" pattern="numeric10_2" required type="text" value="<fmt:formatNumber pattern="0.00" type="currency" value="${obj.quantidade}"/>">
				<netsis:validationMessage name="obj.quantidade"/>
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