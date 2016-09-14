<%@include file="/config/header.jsp" %>
<form action="<c:url value="/tabela-de-preco"/>" class="form-modern" data-controller="ModalController" id="formtblpreco" method="post" name="formtblpreco" role="form">
	<input name="obj.id" type="hidden" value="${obj.id}">
	<input name="obj.idprodutoservico.idaux" type="hidden" value="${obj.idprodutoservico.id}">
	<nav class="band-nav-lube" role="complementary">
		<div class="row" role="row">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" role="separator">
				<label><a href="<c:url value="/dashboard/cadastro"/>"><fmt:message key="nav.cadastro"/></a>&nbsp;<i class="icon-right-open"></i>&nbsp;<fmt:message key="nav.cadastro.tabela.preco"/></label>					
			</div>
		</div>
	</nav>
	<section aria-expanded="true" aria-hidden="false" class="form-body" role="form">
		<div class="row" role="row">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" role="separator">
				<label><fmt:message key="label.item"/></label>
				<select class="form-data ss validate" data-class="sl" id="slProduto-Servico_Json_01" name="obj.idprodutoservico.id" required></select>
				<netsis:validationMessage name="obj.idprodutoservico.id"/>
			</div>
		</div>
		<c:if test="${obj.id != null}">
			<fieldset class="block-lube">
				<legend class="block-header"><label class="block-title"><fmt:message key="titulo.pessoa"/></label></legend>
			</fieldset>
			<section class="block-body">
				<div class="band-default">
					<a class="btn-default btn-xs" href="<c:url value="/tabela-de-preco/pessoa/formulario/${obj.id}"/>" onclick="ModalController.show(this, event);"><i class="icon-plus"></i>&nbsp;<fmt:message key="button.novo"/></a>
				</div>
				<div class="loadgrid" data-load="<c:url value="/tabela-de-preco/pessoa/loadgrid/${obj.id}"/>" id="tblprecopessoa01"></div>
			</section>
		</c:if>
	</section>
	<nav class="nav-group-tie nav-fixed-bottom" role="complementary">
		<ul>
			<li><button title="<fmt:message key="button.salvar"/>" type="submit"><i class="icon-floppy"></i>&nbsp;<fmt:message key="button.salvar"/></button></li>
			<li><a href="<c:url value="/tabela-de-preco"/>" title="<fmt:message key="button.pesquisar"/>"><i class="icon-search"></i>&nbsp;<fmt:message key="button.pesquisar"/></a></li>
		</ul>
	</nav>
</form>
<%@include file="/config/footer.jsp"%>