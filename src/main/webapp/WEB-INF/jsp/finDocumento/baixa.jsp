<%@include file="/config/header.jsp" %>
<form action="<c:url value="/financeiro/documento/baixa"/>" class="form-modern" id="formfindocumento" method="post" name="formfindocumento" role="form">
	<input name="parametrosWeb[0].parametroInicialaux" type="hidden" value="${parametrosWeb[0].parametroInicial}">
	<input name="parametrosWeb[1].parametroInicialaux" type="hidden" value="${parametrosWeb[1].parametroInicial}">
	<input name="idTipoOperacaoaux" type="hidden" value="${idTipoOperacao}">
	<nav class="band-nav-lube" role="complementary">
		<div class="row" role="row">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" role="separator">
				<label><a href="<c:url value="/dashboard/financeiro"/>"><fmt:message key="nav.financeiro"/></a>&nbsp;<i class="icon-right-open"></i>&nbsp;<fmt:message key="nav.financeiro.baixa"/></label>					
			</div>
		</div>
	</nav>
	<section aria-expanded="true" aria-hidden="false" class="form-body" role="form">
		<fieldset class="block-lube m-bottom-15">
			<legend class="block-header"><label class="block-title"><i class="font-5x icon-search"></i>&nbsp;<fmt:message key="titulo.pesquisar"/></label></legend>
			<section class="block-body block-body-padding">
				<div class="row" role="row">
					<div class="col-6" role="separator">
						<label><fmt:message key="label.conta"/></label>
						<select class="form-data validate" data-class="slFinContaBancaria" id="slFinanceiro_Conta-bancaria_Json_01" required name="parametrosWeb[0].parametroInicial"></select>
					</div>
					<div class="col-6" role="separator">
						<label><fmt:message key="label.pessoa"/></label>
						<select class="form-data ss validate" data-class="slPesDefinicao" id="slPessoa_Definicao_Json_01" required name="parametrosWeb[1].parametroInicial"></select>
					</div>
				</div>
				<div class="row" role="row">
					<div class="col-3" role="separator">
						<label><fmt:message key="label.numero.documento"/></label>
						<input class="form-data validate" name="parametrosWeb[2].parametroInicial" pattern="numero0a9" step="1" type="text" value="${parametrosWeb[2].parametroInicial}">
					</div>
					<div class="col-3" role="separator">
						<label><fmt:message key="label.ate"/></label>
						<input class="form-data validate" name="parametrosWeb[2].parametroFinal" pattern="numero0a9" step="1" type="text" value="${parametrosWeb[2].parametroFinal}">
					</div>
					<div class="col-3" role="separator">
						<label><fmt:message key="label.data.emissao"/></label>
						<input class="form-data validate" maxlength="10" min="01-01-1970" name="parametrosWeb[3].parametroInicial" pattern="data" type="text" value="${parametrosWeb[3].parametroInicial}">
					</div>
					<div class="col-3" role="separator">
						<label><fmt:message key="label.ate"/></label>
						<input class="form-data validate" maxlength="10" min="01-01-1970" name="parametrosWeb[3].parametroFinal" pattern="data" type="text" value="${parametrosWeb[3].parametroFinal}">
					</div>
				</div>
				<div class="row" role="row">
					<div class="col-12" role="separator">
						<label><fmt:message key="label.operacao"/></label>
						<select class="form-data validate" data-class="slSysTipoOperacao" data-fields="idmodulo.id, gruporesumo" data-parameters="2, BAIXA" id="slSystem_Tipo-de-operacao_Json_01" name="idTipoOperacao" required></select>
					</div>
				</div>
			</section>
		</fieldset>
		<c:if test="${not empty FinDocumentoList}">
			<c:import url="lista.jsp"/>
		</c:if>
	</section>
</form>
<nav class="nav-group-tie nav-fixed-bottom" role="complementary">
	<ul>
		<li><button form="formfindocumento" title="<fmt:message key="button.pesquisar"/>" type="submit"><i class="icon-search"></i>&nbsp;<fmt:message key="button.pesquisar"/></button></li>
		<li><button form="formfindocumento" formaction="<c:url value="/financeiro/documento/processar"/>" title="<fmt:message key="button.processar"/>"><i class="icon-spin6"></i>&nbsp;<fmt:message key="button.processar"/></button></li>
	</ul>
</nav>
<%@include file="/config/footer.jsp"%>