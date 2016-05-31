<%@include file="/config/header.jsp" %>
<form action="<c:url value="/financeiro/conta-bancaria"/>" class="form-modern" id="formfincontabancaria" method="post" name="formfincontabancaria" role="form">
	<input name="obj.id" type="hidden" value="${obj.id}">
	<input name="obj.idbanco.idaux" type="hidden" value="${obj.idbanco.id}">
	<input name="obj.idtipocontabancaria.idaux" type="hidden" value="${obj.idtipocontabancaria.id}">
	<nav class="band-nav-lube" role="complementary">
		<div class="row" role="row">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" role="separator">
				<label><a href="<c:url value="/dashboard/cadastro"/>"><fmt:message key="nav.cadastro"/></a>&nbsp;<i class="icon-right-open"></i>&nbsp;<fmt:message key="nav.cadastro.conta.bancaria"/></label>					
			</div>
		</div>
	</nav>
	<section aria-expanded="true" aria-hidden="false" class="form-body" role="form">
		<div class="row-input" role="row">
			<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6" role="separator">
				<label><fmt:message key="label.banco"/></label>
				<select class="form-data validate" data-class="slFinBanco" id="slFinanceiro_Banco_Json_01" name="obj.idbanco.id"></select>
				<netsis:validationMessage name="obj.idbanco.id"/>
			</div>
			<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6" role="separator">
				<label><fmt:message key="label.tipo"/></label>
				<select class="form-data validate" data-class="slFinTipoContaBancaria" id="slFinanceiro_Tipo-de-conta-bancaria_Json_01" name="obj.idtipocontabancaria.id"></select>
				<netsis:validationMessage name="obj.idtipocontabancaria.id"/>
			</div>
		</div>
		<div class="row-input" role="row">
			<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6" role="separator">
				<label><fmt:message key="label.agencia"/></label>
				<input class="form-data validate" maxlength="10" name="obj.agencia" pattern="numeroPontoTracoBarra" required type="text" value="${obj.agencia}">
				<netsis:validationMessage name="obj.agencia"/>
			</div>
			<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6" role="separator">
				<label><fmt:message key="label.conta"/></label>
				<input class="form-data validate" maxlength="10" name="obj.numeroconta" pattern="numeroPontoTracoBarra" required type="text" value="${obj.numeroconta}">
				<netsis:validationMessage name="obj.numeroconta"/>
			</div>
		</div>
		<div class="row-input" role="row">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" role="separator">
				<label><fmt:message key="label.titular"/></label>
				<input class="form-data validateform-data validate" maxlength="60" name="obj.nometitular" pattern="letraNumeroEspaco" required type="text" value="${obj.nometitular}">
				<netsis:validationMessage name="obj.nometitular"/>
			</div>
		</div>
		<div class="row-input" role="row">
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
		<li><button form="formfincontabancaria" title="<fmt:message key="button.salvar"/>" type="submit"><i class="icon-floppy"></i>&nbsp;<fmt:message key="button.salvar"/></button></li>
		<li><a href="<c:url value="/financeiro/conta-bancaria"/>" title="<fmt:message key="button.pesquisar"/>"><i class="icon-search"></i>&nbsp;<fmt:message key="button.pesquisar"/></a></li>
	</ul>
</nav>
<%@include file="/config/footer.jsp"%>