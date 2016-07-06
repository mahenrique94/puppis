<%@include file="/config/taglibraries.jsp"%>
<%@include file="/config/libraries-style.jsp"%>
<form action="<c:url value="/financeiro/extrato"/>" class="form-modern" id="formfinextrato" method="post" name="formfinextrato" onsubmit="return enviarPost(this);" role="form">
	<input name="obj.id" type="hidden" value="${obj.id}">
	<nav class="band-nav-lube" role="complementary">
		<div class="row" role="row">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" role="separator">
				<label><a href="<c:url value="/dashboard/financeiro"/>"><fmt:message key="nav.financeiro"/></a>&nbsp;<i class="icon-right-open"></i>&nbsp;<fmt:message key="nav.financeiro.extrato"/></label>					
			</div>
		</div>
	</nav>
	<section aria-expanded="true" aria-hidden="false" class="form-body" role="form">
		<div class="row" role="row">
			<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6" role="separator">
				<label><fmt:message key="label.operacao"/></label>
				<select class="form-data validate" data-class="slSysTipoOperacao" data-fields="idmodulo.id, gruporesumo" data-parameters="2, EXTRATO" id="slSystem_Tipo-de-operacao_Json_01" name="obj.idtipooperacao.id" required></select>
				<netsis:validationMessage name="obj.idtipooperacao.id"/>
			</div>
			<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6" role="separator">
				<label><fmt:message key="label.tipo"/></label>
				<select class="form-data validate" name="obj.creditodebito">
					<option value="C">CREDITO</option>
					<option value="D">DEBITO</option>
				</select>
				<netsis:validationMessage name="obj.creditodebito"/>
			</div>
		</div>
		<div class="row" role="row">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" role="separator">
				<label><fmt:message key="label.valor"/></label>
				<input class="form-data validate" maxlength="13" name="obj.valor" pattern="numeric10_2" required type="text" value="<fmt:formatNumber pattern="0.00" type="currency" value="${obj.valor}"/>"/>
				<netsis:validationMessage name="obj.valor"/>
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