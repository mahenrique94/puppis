<%@include file="/config/header.jsp" %>
<div class="container-tie">
	<form action="<c:url value="/cadastro/centro-de-custo"/>" class="form-block" id="formcadcentrocusto" method="post" name="formcadcentrocusto" role="form">
		<input type="hidden" name="obj.id" value="${obj.id}">
		<div class="container-header">
			<div class="row">
				<div class="col-xs-12-last col-sm-12-last col-md-12-last col-lg-12-last">
					<h2><fmt:message key="nav.cadastro"/>&nbsp;<fmt:message key="label.barra"/>&nbsp;<fmt:message key="nav.cadastro.centro.custo"/></h2>
				</div>
				<div class="col-xs-12-last col-sm-12-last col-md-3 col-lg-2">
					<button class="btn-md float-left m-right-5" title="<fmt:message key="button.salvar"/>" type="submit"><span class="icon-floppy-disk"></span>&nbsp;<fmt:message key="button.salvar"/></button>
					<a href="<c:url value="/cadastro/centro-de-custo"/>" class="btn-md float-left m-right-5" title="<fmt:message key="button.pesquisar"/>"><span class="icon-search"></span>&nbsp;<fmt:message key="button.pesquisar"/></a>
				</div>
			</div>
		</div>
		<section aria-expanded="true" aria-hidden="false" class="clearfix" role="form">
			<div class="row-input" role="row">
				<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6" role="separator">
					<label><fmt:message key="label.conta"/></label>
					<input autofocus class="input-form" maxlength="10" name="obj.conta" pattern="numero" required type="number" value="${obj.conta}">
					<netsis:validationMessage name="obj.conta"/>
				</div>
				<div class="col-xs-6-last col-sm-6-last col-md-6-last col-lg-6-last" role="separator">
					<label><fmt:message key="label.sub.conta"/></label>
					<input class="input-form" maxlength="10" name="obj.subconta" pattern="numero" required type="number" value="${obj.subconta}">
					<netsis:validationMessage name="obj.subconta"/>
				</div>
			</div>
			<div class="row-input" role="row">
				<div class="col-xs-12-last col-sm-12-last col-md-12-last col-lg-12-last" role="separator">
					<label><fmt:message key="label.descricao"/></label>
					<input class="input-form" maxlength="60" name="obj.descricao" pattern="letraEspaco" required type="text" value="${obj.descricao}">
					<netsis:validationMessage name="obj.descricao"/>
				</div>
			</div>
		</section>
	</form>
</div>
<%@include file="/config/footer.jsp"%>