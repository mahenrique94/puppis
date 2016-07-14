<%@include file="/config/header.jsp" %>
<form action="<c:url value="/financeiro/documento/parcelamento"/>" class="form-modern" id="formfindocumento" method="post" name="formfindocumento" role="form">
	<input name="parametrosWeb[0].parametroInicialaux" type="hidden" value="${parametrosWeb[0].parametroInicial}">
	<input name="parametrosWeb[1].parametroInicialaux" type="hidden" value="${parametrosWeb[1].parametroInicial}">
	<input name="parametrosWeb[2].parametroInicialaux" type="hidden" value="${parametrosWeb[2].parametroInicial}">
	<input name="parametrosWeb[3].parametroInicialaux" type="hidden" value="${parametrosWeb[3].parametroInicial}">
	<input name="parametrosWeb[8].parametroInicialaux" type="hidden" value="${parametrosWeb[8].parametroInicial}">
	<input name="parametrosWeb[9].parametroInicialaux" type="hidden" value="${parametrosWeb[9].parametroInicial}">
	<c:set var="disabled" value="disabled"/>
	<nav class="band-nav-lube" role="complementary">
		<div class="row" role="row">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" role="separator">
				<label><a href="<c:url value="/dashboard/financeiro"/>"><fmt:message key="nav.financeiro"/></a>&nbsp;<i class="icon-right-open"></i>&nbsp;<fmt:message key="nav.financeiro.parcelamento"/></label>					
			</div>
		</div>
	</nav>
	<section aria-expanded="true" aria-hidden="false" class="form-body" role="form">
		<div class="row-input" role="row">
			<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
				<label><fmt:message key="label.operacao"/></label>
				<select class="form-data validate" data-class="slSysTipoOperacao" data-fields="idmodulo.id, gruporesumo" data-parameters="2, DOCUMENTO" id="slSystem_Tipo-de-operacao_Json_01" name="parametrosWeb[9].parametroInicial" required></select>
			</div>
			<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6" role="separator">
				<label><fmt:message key="label.forma.pagamento"/></label>
				<select class="form-data validate" data-class="slFinFormaPagamento" id="slFinanceiro_Forma-de-pagamento_Json_01" name="parametrosWeb[0].parametroInicial"></select>
			</div>
		</div>
		<div class="row" role="row">
			<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6" role="separator">
				<label><fmt:message key="label.pessoa"/></label>
				<select class="form-data ss validate" data-class="slPesDefinicao" id="slPessoa_Definicao_Json_01" name="parametrosWeb[1].parametroInicial" required></select>
			</div>
			<div class="col-xs-3 col-sm-3 col-md-3 col-lg-3" role="separator">
				<label><fmt:message key="label.conta"/></label>
				<select class="form-data validate" data-class="slFinContaBancaria" id="slFinanceiro_Conta-bancaria_Json_01" name="parametrosWeb[2].parametroInicial" required></select>
			</div>
			<div class="col-xs-3 col-sm-3 col-md-3 col-lg-3" role="separator">
				<label><fmt:message key="label.tipo.documento"/></label>
				<select class="form-data validate" data-class="slFinTipoDocumento" id="slFinanceiro_Tipo-de-documento_Json_01" name="parametrosWeb[3].parametroInicial"></select>
			</div>
		</div>
		<div class="row" role="row">
			<div class="col-xs-3 col-sm-3 col-md-3 col-lg-3" role="separator">
				<label><fmt:message key="label.numero"/></label>
				<div class="form-data-group">
					<input class="form-data validate" id="code-target" min="0" name="parametrosWeb[4].parametroInicial" pattern="numero0a9" required type="number" value="${parametrosWeb[4].parametroInicial}">
					<span class="form-data-group-btn"><button class="btn-default" onclick="gerarCode();" type="button"><i class="icon-cog"></i></button></span>
				</div>
			</div>		
			<div class="col-xs-3 col-sm-3 col-md-3 col-lg-3" role="separator">
				<label><fmt:message key="label.serie"/></label>
				<input class="form-data validate" min="0" name="parametrosWeb[5].parametroInicial" pattern="numero0a9" type="number" value="${parametrosWeb[5].parametroInicial}">
			</div>
			<div class="col-xs-3 col-sm-3 col-md-3 col-lg-3" role="separator">
				<label><fmt:message key="label.desdobramento.inicial"/></label>
				<input class="form-data validate" min="0" name="parametrosWeb[10].parametroInicial" pattern="numero0a9" type="number" value="${parametrosWeb[10].parametroInicial}">
			</div>
			<div class="col-xs-3 col-sm-3 col-md-3 col-lg-3" role="separator">
				<label><fmt:message key="label.data.emissao"/></label>
				<input class="form-data validate" maxlength="10" min="01-01-1970" name="parametrosWeb[6].parametroInicial" onkeypress="format(this, event, dataMask);" pattern="data" required type="text" value="${parametrosWeb[6].parametroInicial}">
			</div>
		</div>
		<div class="row" role="row">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" role="separator">
				<label><fmt:message key="label.valor.total"/></label>
				<input class="form-data validate" maxlength="13" name="parametrosWeb[7].parametroInicial" pattern="numeric10_2" required type="text" value="${parametrosWeb[7].parametroInicial}"/>
			</div>
		</div>
		<div class="row" role="row">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" role="separator">
				<label><fmt:message key="label.id.historico"/></label>
				<select class="form-data ss validate" data-class="sl" id="slFinanceiro_Historico_Json_01" name="parametrosWeb[8].parametroInicial"></select>
			</div>
		</div>
		<c:if test="${not empty FinDocumentoList}">
			<c:forEach var="finDocumento" items="${FinDocumentoList}" varStatus="list">
				<input name="finDocumentoList[${list.index}].idcontabancaria.id" type="hidden" value="${finDocumento.idcontabancaria.id}">
				<input name="finDocumentoList[${list.index}].iddefinicao.id" type="hidden" value="${finDocumento.iddefinicao.id}">
				<input name="finDocumentoList[${list.index}].idtipooperacao.id" type="hidden" value="${finDocumento.idtipooperacao.id}">
				<input name="finDocumentoList[${list.index}].numero" type="hidden" value="${finDocumento.numero}">
				<input name="finDocumentoList[${list.index}].serie" type="hidden" value="${finDocumento.serie}">
				<input name="finDocumentoList[${list.index}].desdobramento" type="hidden" value="${finDocumento.desdobramento}">
				<input name="finDocumentoList[${list.index}].idtipodocumento.id" type="hidden" value="${finDocumento.idtipodocumento.id}">
				<input name="finDocumentoList[${list.index}].idhistorico.id" type="hidden" value="${finDocumento.idhistorico.id}">
				<input name="finDocumentoList[${list.index}].idformapagamento.id" type="hidden" value="${finDocumento.idformapagamento.id}">
				<input name="finDocumentoList[${list.index}].valortotal" type="hidden" value="<fmt:formatNumber pattern="0.00" type="currency" value="${finDocumento.valortotal}"/>">
				<input name="finDocumentoList[${list.index}].saldo" type="hidden" value="<fmt:formatNumber pattern="0.00" type="currency" value="${finDocumento.saldo}"/>">
				<input name="finDocumentoList[${list.index}].dataemissao" type="hidden" value="<fmt:formatDate pattern="dd/MM/yyyy" type="date" value="${finDocumento.dataemissao.time}"/>">
				<input name="finDocumentoList[${list.index}].datavencimento" type="hidden" value="<fmt:formatDate pattern="dd/MM/yyyy" type="date" value="${finDocumento.datavencimento.time}"/>">
				<input name="finDocumentoList[${list.index}].datacreate" type="hidden" value="<fmt:formatDate pattern="dd/MM/yyyy" type="date" value="${finDocumento.datacreate.time}"/>">
				<input name="finDocumentoList[${list.index}].dataupdate" type="hidden" value="<fmt:formatDate pattern="dd/MM/yyyy" type="date" value="${finDocumento.dataupdate.time}"/>">
			</c:forEach>
			<c:set var="disabled" value=""/>
			<display:table class="table-default" export="false" id="obj" name="${FinDocumentoList}" requestURI="/financeiro/documento">
				<display:column format="{0, date, dd/MM/yyyy}" headerScope="dataemissao" property="dataemissao.time" titleKey="displaytag.data.emissao"/>
				<display:column format="{0, date, dd/MM/yyyy}" headerScope="datavencimento" property="datavencimento.time" titleKey="displaytag.data.vencimento"/>
				<display:column headerScope="numero" property="numero" titleKey="displaytag.numero.documento"/>
				<display:column headerScope="serie" property="serie" titleKey="displaytag.serie"/>
				<display:column headerScope="desdobramento" property="desdobramento" titleKey="displaytag.desdobramento"/>
				<display:column headerScope="valortotal" property="valortotal" titleKey="displaytag.valor.total"/>
			</display:table>
		</c:if>
	</section>	
	<nav class="nav-group-tie nav-fixed-bottom" role="complementary">
		<ul>
			<li><a href="<c:url value="/financeiro/documento/parcelamento"/>"><i class="icon-plus"></i>&nbsp;<fmt:message key="button.novo"/></a></li>
			<li><button title="<fmt:message key="button.processar"/>" type="submit"><i class="icon-spin6"></i>&nbsp;<fmt:message key="button.processar"/></button></li>
			<li><button ${disabled} formaction="<c:url value="/financeiro/documento/parcelamento/confirmar"/>" title="<fmt:message key="button.confirmar"/>" type="submit"><i class="icon-thumbs-up"></i>&nbsp;<fmt:message key="button.confirmar"/></button></li>
		</ul>
	</nav>
</form>
<%@include file="/config/footer.jsp"%>