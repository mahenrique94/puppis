<%@include file="/config/header.jsp" %>
<form action="<c:url value="/financeiro/extrato/listar"/>" class="form-modern" id="formfinextrato" method="post" name="formfinextrato" role="form">
	<input name="parametrosWeb[0].parametroInicialaux" type="hidden" value="${parametrosWeb[0].parametroInicial}">
	<nav class="band-nav-lube" role="complementary">
		<div class="row" role="row">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" role="separator">
				<label><a href="<c:url value="/dashboard/financeiro"/>"><fmt:message key="nav.financeiro"/></a>&nbsp;<i class="icon-right-open"></i>&nbsp;<fmt:message key="nav.financeiro.extrato"/></label>					
			</div>
		</div>
	</nav>
	<section aria-expanded="true" aria-hidden="false" class="form-body" role="form">
		<fieldset class="block-lube m-bottom-15">
			<legend class="block-header"><label class="block-title"><i class="font-5x icon-search"></i>&nbsp;<fmt:message key="titulo.pesquisar"/></label></legend>
			<section class="block-body block-body-padding">
				<div class="row" role="row">
					<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" role="separator">
						<label><fmt:message key="label.conta"/></label>
						<select class="form-data validate" data-class="slFinContaBancaria" id="slFinanceiro_Conta-bancaria_Json_01" required name="parametrosWeb[0].parametroInicial"></select>
					</div>
				</div>
				<div class="row" role="row">
					<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6" role="separator">
						<label><fmt:message key="label.data.emissao"/></label>
						<input class="form-data validate" maxlength="10" min="01-01-1970" name="parametrosWeb[1].parametroInicial" onkeypress="format(this, event, dataMask);" pattern="data" type="text" value="${parametrosWeb[1].parametroInicial}">
					</div>
					<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6" role="separator">
						<label><fmt:message key="label.ate"/></label>
						<input class="form-data validate" maxlength="10" min="01-01-1970" name="parametrosWeb[1].parametroFinal" onkeypress="format(this, event, dataMask);" pattern="data" type="text" value="${parametrosWeb[1].parametroFinal}">
					</div>
				</div>
			</section>
		</fieldset>
		<c:if test="${not empty FinExtratoList}">
			<c:import url="lista.jsp"/>
		</c:if>
	</section>
</form>
<nav class="nav-group-tie nav-fixed-bottom" role="complementary">
	<ul>
		<li><a data-controller="ModalController" href="<c:url value="/financeiro/extrato/formulario"/>" onclick="ModalController.show(this, event);" title="<fmt:message key="button.novo"/>"><i class="icon-plus"></i>&nbsp;<fmt:message key="button.novo"/></a></li>
		<li><button form="formfinextrato" title="<fmt:message key="button.pesquisar"/>" type="submit"><i class="icon-search"></i>&nbsp;<fmt:message key="button.pesquisar"/></button></li>
	</ul>
</nav>
<%@include file="/config/footer.jsp"%>