<%@include file="/config/header.jsp" %>
<fieldset class="block-lube">
	<legend class="block-header">
		<h1 class="block-title"><label><fmt:message key="nav.cadastro"/>&nbsp;<fmt:message key="label.barra"/>&nbsp;<fmt:message key="nav.cadastro.produto.servico"/>&nbsp;<fmt:message key="label.barra"/>&nbsp;<fmt:message key="nav.cadastro.produto.servico.grupo"/></label></h1>
	</legend>
	<form action="<c:url value="/produto-servico/grupo"/>" class="form-inline" id="formlistarpsgrupo" method="post" name="formlistarpsgrupo" role="form">
		<nav class="clearfix nav-block" role="navigation">
			<div class="w-100">
				<button class="btn-md float-left m-right-5" title="<fmt:message key="button.salvar"/>" type="submit"><span class="icon-floppy-disk"></span>&nbsp;<fmt:message key="button.salvar"/></button>
				<a href="<c:url value="/produto-servico/grupo"/>" class="btn-md float-left m-right-5" title="<fmt:message key="button.pesquisar"/>"><span class="icon-search"></span>&nbsp;<fmt:message key="button.pesquisar"/></a>
			</div>
		</nav>
		<section aria-expanded="true" aria-hidden="false" class="block-body clearfix" role="form">
			<div class="row-input" role="row">
				<div class="w-20" role="separator">
					<label class="align-left"><fmt:message key="label.id"/></label>
					<input autofocus class="input-form" maxlength="10" name="obj.id" pattern="numero0a9" type="number" value="${obj.id}">
					<netsis:validationMessage name="obj.id"/>
				</div>
				<div class="w-80" role="separator">
					<label class="align-left"><fmt:message key="label.descricao"/></label>
					<input class="input-form full" maxlength="30" name="obj.descricao" pattern="letraNumeroEspaco" required type="text" value="${obj.descricao}">
					<netsis:validationMessage name="obj.descricao"/>
				</div>
			</div>
		</section>
	</form>
</fieldset>
<%@include file="/config/footer.jsp"%>