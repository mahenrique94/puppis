<%@include file="/config/header.jsp" %>
<div class="container-tie">
	<form action="<c:url value="/financeiro/controle"/>" class="form-block" id="formfincontrole" method="post" name="formfincontrole" role="form">
		<input name="obj.id" type="hidden" value="${obj.id}">
		<input name="obj.idcomercio.idaux" type="hidden" value="${obj.idcomercio.id}">
		<input name="obj.idcontabancaria.idaux" type="hidden" value="${obj.idcontabancaria.id}">
		<div class="container-header">
			<div class="row">
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
					<h2><fmt:message key="nav.financeiro"/>&nbsp;<fmt:message key="label.barra"/>&nbsp;<fmt:message key="nav.financeiro.controle"/></h2>
				</div>
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
					<button class="btn-md float-left m-right-5" title="<fmt:message key="button.salvar"/>" type="submit"><span class="icon-floppy-disk"></span>&nbsp;<fmt:message key="button.salvar"/></button>
					<a href="<c:url value="/financeiro/controle"/>" class="btn-md float-left m-right-5" title="<fmt:message key="button.pesquisar"/>"><span class="icon-search"></span>&nbsp;<fmt:message key="button.pesquisar"/></a>
				</div>
			</div>
		</div>
		<section aria-expanded="true" aria-hidden="false" class="clearfix" role="form">
			<div class="row-input" role="row">
				<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6" role="separator">
					<label><fmt:message key="label.comercio"/></label>
					<select class="select-form" data-class="slAdmComercio" id="slAdministrador_Comercio_Json_01" name="obj.idcomercio.id"></select>
					<netsis:validationMessage name="obj.idcomercio.id"/>
				</div>
				<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6" role="separator">
					<label><fmt:message key="label.conta"/></label>
					<select class="select-form" data-class="slFinContaBancaria" id="slFinanceiro_Conta-bancaria_Json_01" name="obj.idcontabancaria.id"></select>
					<netsis:validationMessage name="obj.idcontabancaria.id"/>
				</div>
			</div>
			<div class="row-input" role="row">
				<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6" role="separator">
					<label><fmt:message key="label.renda.mensal"/></label>
					<input class="input-form" maxlength="13" name="obj.rendamensal" pattern="numeric10_2" required type="text" value="${obj.rendamensal}">
					<netsis:validationMessage name="obj.rendamensal"/>
				</div>
				<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6" role="separator">
					<label><fmt:message key="label.limite"/></label>
					<input class="input-form" maxlength="13" name="obj.limite" pattern="numeric10_2" type="text" value="${obj.limite}">
					<netsis:validationMessage name="obj.limite"/>
				</div>
			</div>
			<div class="row-input" role="row">
				<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6" role="separator">
					<label><fmt:message key="label.aceita.saldo.negativo"/></label>
					<input <c:if test="${obj.aceitasaldonegativo == true}">checked</c:if> class="input-form" name="obj.aceitasaldonegativo" type="checkbox" value="true">
					<netsis:validationMessage name="obj.aceitasaldonegativo"/>
				</div>
				<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6" role="separator">
					<label><fmt:message key="label.aceita.ultrapassar.limite"/></label>
					<input <c:if test="${obj.aceitaultrapassarlimite == true}">checked</c:if> class="input-form" name="obj.aceitaultrapassarlimite" type="checkbox" value="true">
					<netsis:validationMessage name="obj.aceitaultrapassarlimite"/>
				</div>
			</div>
		</section>
	</form>
</div>
<%@include file="/config/footer.jsp"%>