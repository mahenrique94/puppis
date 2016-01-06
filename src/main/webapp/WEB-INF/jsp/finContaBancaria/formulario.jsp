<%@include file="/config/header.jsp" %>
<div class="container-tie">
	<form action="<c:url value="/financeiro/conta-bancaria"/>" class="form-block" id="formfincontabancaria" method="post" name="formfincontabancaria" role="form">
		<input name="obj.id" type="hidden" value="${obj.id}">
		<input name="obj.idbanco.idaux" type="hidden" value="${obj.idbanco.id}">
		<input name="obj.idtipocontabancaria.idaux" type="hidden" value="${obj.idtipocontabancaria.id}">
		<div class="container-header">
			<div class="row">
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
					<h2><fmt:message key="nav.financeiro"/>&nbsp;<fmt:message key="label.barra"/>&nbsp;<fmt:message key="nav.financeiro.conta.bancaria"/></h2>
				</div>
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
					<button class="btn-md float-left m-right-5" title="<fmt:message key="button.salvar"/>" type="submit"><span class="icon-floppy-disk"></span>&nbsp;<fmt:message key="button.salvar"/></button>
					<a href="<c:url value="/financeiro/conta-bancaria"/>" class="btn-md float-left m-right-5" title="<fmt:message key="button.pesquisar"/>"><span class="icon-search"></span>&nbsp;<fmt:message key="button.pesquisar"/></a>
				</div>
			</div>
		</div>
		<section aria-expanded="true" aria-hidden="false" class="clearfix" role="form">
			<div class="row-input" role="row">
				<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6" role="separator">
					<label><fmt:message key="label.banco"/></label>
					<select class="select-form" data-class="slFinBanco" id="slFinanceiro_Banco_Json_01" name="obj.idbanco.id"></select>
					<netsis:validationMessage name="obj.idbanco.id"/>
				</div>
				<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6" role="separator">
					<label><fmt:message key="label.tipo"/></label>
					<select class="select-form" data-class="slFinTipoContaBancaria" id="slFinanceiro_Tipo-de-conta-bancaria_Json_01" name="obj.idtipocontabancaria.id"></select>
					<netsis:validationMessage name="obj.idtipocontabancaria.id"/>
				</div>
			</div>
			<div class="row-input" role="row">
				<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6" role="separator">
					<label><fmt:message key="label.agencia"/></label>
					<input class="input-form" maxlength="10" name="obj.agencia" pattern="numeroPontoTracoBarra" required type="text" value="${obj.agencia}">
					<netsis:validationMessage name="obj.agencia"/>
				</div>
				<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6" role="separator">
					<label><fmt:message key="label.conta"/></label>
					<input class="input-form" maxlength="10" name="obj.numeroconta" pattern="numeroPontoTracoBarra" required type="text" value="${obj.numeroconta}">
					<netsis:validationMessage name="obj.numeroconta"/>
				</div>
			</div>
			<div class="row-input" role="row">
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" role="separator">
					<label><fmt:message key="label.titular"/></label>
					<input class="input-form" maxlength="60" name="obj.nometitular" pattern="letraNumeroEspaco" required type="text" value="${obj.nometitular}">
					<netsis:validationMessage name="obj.nometitular"/>
				</div>
			</div>
			<div class="row-input" role="row">
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" role="separator">
					<label><fmt:message key="label.inativo"/></label>
					<input <c:if test="${obj.inativo == true}">checked</c:if> class="input-form" name="obj.inativo" type="checkbox" value="true">
					<netsis:validationMessage name="obj.inativo"/>
				</div>
			</div>
		</section>
	</form>
</div>
<%@include file="/config/footer.jsp"%>