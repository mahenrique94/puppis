<%@include file="/config/header.jsp" %>
<fieldset class="block-lube">
	<legend class="block-header">
		<h1 class="block-title"><label><fmt:message key="nav.cadastro"/>&nbsp;<fmt:message key="label.barra"/>&nbsp;<fmt:message key="nav.cadastro.centro.custo"/></label></h1>
	</legend>
	<form action="<c:url value="/cadastro/centro-de-custo"/>" class="form-inline" id="formlistarcadcentrocusto" method="post" name="formlistarcadcentrocusto" role="form">
		<input type="hidden" name="obj.id" value="${obj.id}">
		<nav class="clearfix nav-block" role="navigation">
			<div class="w-100">
				<button class="btn-md float-left m-right-5" title="<fmt:message key="button.salvar"/>" type="submit"><span class="icon-floppy-disk"></span>&nbsp;<fmt:message key="button.salvar"/></button>
				<a href="<c:url value="/cadastro/centro-de-custo"/>" class="btn-md float-left m-right-5" title="<fmt:message key="button.pesquisar"/>"><span class="icon-search"></span>&nbsp;<fmt:message key="button.pesquisar"/></a>
			</div>
		</nav>
		<section aria-expanded="true" aria-hidden="false" class="block-body clearfix" role="form">
			<div class="row-input" role="row">
				<div class="w-50" role="separator">
					<label class="align-left"><fmt:message key="label.conta"/></label>
					<input autofocus class="input-form" maxlength="10" name="obj.conta" pattern="numero" required type="number" value="${obj.conta}">
					<netsis:validationMessage name="obj.conta"/>
				</div>
				<div class="w-50" role="separator">
					<label class="align-left"><fmt:message key="label.sub.conta"/></label>
					<input class="input-form full" maxlength="10" name="obj.subconta" pattern="numero" required type="number" value="${obj.subconta}">
					<netsis:validationMessage name="obj.subconta"/>
				</div>
			</div>
			<div class="row-input" role="row">
				<div class="w-100" role="separator">
					<label class="align-left"><fmt:message key="label.descricao"/></label>
					<input class="input-form full" maxlength="60" name="obj.descricao" pattern="letraEspaco" required type="text" value="${obj.descricao}">
					<netsis:validationMessage name="obj.descricao"/>
				</div>
			</div>
		</section>
	</form>
</fieldset>
<%@include file="/config/footer.jsp"%>