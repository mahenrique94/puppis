<%@include file="/config/header.jsp" %>
<form action="<c:url value="/tabela-de-preco"/>" class="form-modern" data-controller="ModalController" id="formtblpreco" method="post" name="formtblpreco" role="form">
	<input name="obj.id" type="hidden" value="${obj.id}">
	<nav class="band-nav-lube" role="complementary">
		<div class="row" role="row">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" role="separator">
				<label><a href="<c:url value="/dashboard/cadastro"/>"><fmt:message key="nav.cadastro"/></a>&nbsp;<i class="icon-right-open"></i>&nbsp;<fmt:message key="nav.cadastro.tabela.preco"/></label>					
			</div>
		</div>
	</nav>
	<section aria-expanded="true" aria-hidden="false" class="form-body" role="form">
		<div class="row" role="row">
			<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6" role="separator">
				<label><fmt:message key="label.data.vigencia.inicial"/></label>
				<input autofocus class="form-data validate" maxlength="16" name="obj.datavigenciainicial" onkeypress="format(this, event, maskDataHora);" pattern="dataHora" required type="text" value="<fmt:formatDate pattern="dd/MM/yyyy HH:mm" type="date" value="${obj.datavigenciainicial.time}"/>">
				<netsis:validationMessage name="obj.datavigenciainicial"/>
			</div>
			<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6" role="separator">
				<label><fmt:message key="label.data.vigencia.final"/></label>
				<input autofocus class="form-data validate" maxlength="16" name="obj.datavigenciafinal" onkeypress="format(this, event, maskDataHora);" pattern="dataHora" required type="text" value="<fmt:formatDate pattern="dd/MM/yyyy HH:mm" type="date" value="${obj.datavigenciafinal.time}"/>">
				<netsis:validationMessage name="obj.datavigenciafinal"/>
			</div>
		</div>
		<div class="row" role="row">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" role="separator">
				<label><fmt:message key="label.inativo"/></label>
				<input <c:if test="${obj.inativo == true}">checked</c:if> class="form-data" name="obj.inativo" type="checkbox" value="true">
				<netsis:validationMessage name="obj.inativo"/>
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