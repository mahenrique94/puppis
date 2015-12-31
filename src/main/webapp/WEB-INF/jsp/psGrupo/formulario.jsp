<%@include file="/config/header.jsp" %>
<div class="container-tie">
	<form action="<c:url value="/produto-servico/grupo"/>" class="form-block" id="formpsgrupo" method="post" name="formpsgrupo" role="form">
		<div class="container-header">
			<div class="row">
				<div class="col-xs-12-last col-sm-12-last col-md-12-last col-lg-12-last">
					<h2><fmt:message key="nav.cadastro"/>&nbsp;<fmt:message key="label.barra"/>&nbsp;<fmt:message key="nav.cadastro.produto.servico"/>&nbsp;<fmt:message key="label.barra"/>&nbsp;<fmt:message key="nav.cadastro.produto.servico.grupo"/></h2>
				</div>
				<div class="col-xs-12-last col-sm-12-last col-md-12 col-lg-12">
					<button class="btn-md float-left m-right-5" title="<fmt:message key="button.salvar"/>" type="submit"><span class="icon-floppy-disk"></span>&nbsp;<fmt:message key="button.salvar"/></button>
					<a href="<c:url value="/produto-servico/grupo"/>" class="btn-md float-left m-right-5" title="<fmt:message key="button.pesquisar"/>"><span class="icon-search"></span>&nbsp;<fmt:message key="button.pesquisar"/></a>
				</div>
			</div>
		</div>
		<section aria-expanded="true" aria-hidden="false" class="clearfix" role="form">
			<div class="row" role="row">
				<div class="col-xs-2 col-sm-2 col-md-2 col-lg-2" role="separator">
					<label><fmt:message key="label.id"/></label>
					<input autofocus class="input-form" maxlength="10" name="obj.id" pattern="numero0a9" type="number" value="${obj.id}">
					<netsis:validationMessage name="obj.id"/>
				</div>
				<div class="col-xs-10-last col-sm-10-last col-md-10-last col-lg-10-last" role="separator">
					<label><fmt:message key="label.descricao"/></label>
					<input class="input-form" maxlength="30" name="obj.descricao" pattern="letraNumeroEspaco" required type="text" value="${obj.descricao}">
					<netsis:validationMessage name="obj.descricao"/>
				</div>
			</div>
		</section>
	</form>
</div>
<%@include file="/config/footer.jsp"%>