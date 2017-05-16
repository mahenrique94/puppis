<%@include file="/config/header.jsp" %>
<form action="<c:url value="/financeiro/documento/parcelamento"/>" class="o-form" id="formfindocumentoparcelamento" method="post" name="formfindocumentoparcelamento" role="form">
	<input aria-hidden="true" name="parametrosWeb[0].parametroInicialaux" type="hidden" value="${parametrosWeb[0].parametroInicial}">
	<input aria-hidden="true" name="parametrosWeb[1].parametroInicialaux" type="hidden" value="${parametrosWeb[1].parametroInicial}">
	<input aria-hidden="true" name="parametrosWeb[2].parametroInicialaux" type="hidden" value="${parametrosWeb[2].parametroInicial}">
	<input aria-hidden="true" name="parametrosWeb[3].parametroInicialaux" type="hidden" value="${parametrosWeb[3].parametroInicial}">
	<input aria-hidden="true" name="parametrosWeb[8].parametroInicialaux" type="hidden" value="${parametrosWeb[8].parametroInicial}">
	<input aria-hidden="true" name="parametrosWeb[9].parametroInicialaux" type="hidden" value="${parametrosWeb[9].parametroInicial}">
	<input aria-hidden="true" name="parametrosWeb[11].parametroInicialaux" type="hidden" value="${parametrosWeb[11].parametroInicial}">
	<nav class="o-navbar--gary" role="complementary">
		<div class="o-breadcrumb--arrow">
			<span class="o-breadcrumb__link"><a href="<c:url value="/dashboard"/>" role="link" title="<fmt:message key="nav.dashboard"/>"><fmt:message key="nav.dashboard"/></a></span>
			<span class="o-breadcrumb__link"><a href="<c:url value="/dashboard/financeiro"/>" role="link" title="<fmt:message key="nav.cadastro"/>"><fmt:message key="nav.financeiro"/></a></span>
			<span class="o-breadcrumb__link"><a class="is-inactive" href="<c:url value="/financeiro/documento/parcelamento"/>" role="link" title="<fmt:message key="nav.financeiro.parcelamento"/>"><fmt:message key="nav.financeiro.parcelamento"/></a></span>
		</div>
	</nav>
	<section class="o-form__body o-form__body--padding">
		<div class="l-row" role="row">
			<div class="u-grid--6">
				<label class="o-form__text" for="operacao"><fmt:message key="label.operacao"/></label>
				<select aria-readonly="true" class="o-form__data has-validation" data-parameters-fields="[idmodulo.id, gruporesumo]" data-parameters-values="[2, DOCUMENTO]" data-select="slSysTipoOperacao" data-url="slSystem_Tipo-de-operacao_Json" id="operacao" name="parametrosWeb[9].parametroInicial" readonly></select>
			</div>
			<div class="u-grid--6" role="grid">
				<label class="o-form__text" for="formapagamento"><fmt:message key="label.forma.pagamento"/></label>
				<select aria-required="true" class="o-form__data has-validation" data-select="slFinFormaPagamento" data-url="slFinanceiro_Forma-de-pagamento_Json" id="formapagamento" name="parametrosWeb[0].parametroInicial" required></select>
			</div>
		</div>
		<div class="l-row" role="row">
			<div class="u-grid--6" role="grid">
				<label class="o-form__text" for="pessoa"><fmt:message key="label.pessoa"/></label>
				<select aria-required="true" class="o-form__data has-validation ss-search" data-select="slPesDefinicao" data-url="slPessoa_Definicao_Json" id="pessoa" name="parametrosWeb[1].parametroInicial" required></select>
			</div>
			<div class="u-grid--3" role="grid">
				<label class="o-form__text" for="conta"><fmt:message key="label.conta"/></label>
				<select aria-required="true" class="o-form__data has-validation" data-select="slFinContaBancaria" data-url="slFinanceiro_Conta-bancaria_Json" id="conta" name="parametrosWeb[2].parametroInicial" required></select>
			</div>
			<div class="u-grid--3" role="grid">
				<label class="o-form__text" for="tipodocumento"><fmt:message key="label.tipo.documento"/></label>
				<select aria-required="true" class="o-form__data has-validation" data-select="slFinTipoDocumento" data-url="slFinanceiro_Tipo-de-documento_Json" id="tipodocumento" name="parametrosWeb[3].parametroInicial" required></select>
			</div>
		</div>
		<div class="l-row" role="row">
			<div class="u-grid--3" role="grid">
				<label class="o-form__text" for="numero"><fmt:message key="label.numero"/></label>
				<div class="o-form__group">
					<input aria-required="true" class="o-form__data has-validation" id="numero" min="0" name="parametrosWeb[4].parametroInicial" pattern="number0to9" required step="1" type="number" value="${parametrosWeb[4].parametroInicial}">
					<span class="o-form__groupElement"><button class="o-button--lube" onclick="createCode(this);" role="button" title="<fmt:message key="button.gerar.numero"/>" type="button"><i class="icon-cog"></i></button></span>
				</div>
			</div>		
			<div class="u-grid--3" role="grid">
				<label class="o-form__text" for="serie"><fmt:message key="label.serie"/></label>
				<input class="o-form__data has-validation" min="0" name="parametrosWeb[5].parametroInicial" pattern="number0to9" step="1" type="number" value="${parametrosWeb[5].parametroInicial}">
			</div>
			<div class="u-grid--3" role="grid">
				<label class="o-form__text" for="desdobramentoinicial"><fmt:message key="label.desdobramento.inicial"/></label>
				<div class="o-form__tooltip">
					<input class="o-form__data has-validation" id="desdobramentoinicial" maxlength="7" minlength="0" name="parametrosWeb[10].parametroInicial" pattern="desdobramento" type="text" value="${parametrosWeb[10].parametroInicial}">
					<span class="o-tooltip--gary"></span>
				</div>
			</div>
			<div class="u-grid--3" role="grid">
				<label class="o-form__text" for="dataemissao"><fmt:message key="label.data.emissao"/></label>
				<input aria-required="true" class="o-form__data has-validation" id="dataemissao" max="12-31-2900" maxlength="10" min="01-01-1900" name="parametrosWeb[6].parametroInicial" onkeypress="checkMask(event);" onkeyup="mask(maskData, this, event);" pattern="data" required type="text" value="${parametrosWeb[6].parametroInicial}">
			</div>
		</div>
		<div class="l-row" role="row">
			<div class="u-grid--12" role="grid">
				<label class="o-form__text" for="valorparcela"><fmt:message key="label.valor.parcela"/></label>
				<input aria-required="true" class="o-form__data has-validation" id="valorparcela" maxlength="13" name="parametrosWeb[7].parametroInicial" pattern="numeric10-2" required type="text" value="${parametrosWeb[7].parametroInicial}"/>
			</div>
		</div>
		<div class="l-row" role="row">
			<div class="u-grid--12" role="grid">
				<label class="o-form__text" for="historico"><fmt:message key="label.historico"/></label>
				<select class="o-form__data has-validation" data-select="sl" data-url="slFinanceiro_Historico_Json" id="historico" name="parametrosWeb[8].parametroInicial"></select>
			</div>
		</div>
		<div class="l-row" role="row">
			<div class="u-grid--12" role="grid">
				<label class="o-form__text" for="centrocusto"><fmt:message key="label.centro.custo"/></label>
				<select class="o-form__data has-validation" data-select="sl" data-url="slCadastro_Centro-de-custo_Json" id="centrocusto" name="parametrosWeb[11].parametroInicial"></select>
			</div>
		</div>
		<c:if test="${not empty FinDocumentoList}">
			<c:forEach var="finDocumento" items="${FinDocumentoList}" varStatus="list">
				<input aria-hidden="true" name="finDocumentoList[${list.index}].idcontabancaria.id" type="hidden" value="${finDocumento.idcontabancaria.id}">
				<input aria-hidden="true" name="finDocumentoList[${list.index}].iddefinicao.id" type="hidden" value="${finDocumento.iddefinicao.id}">
				<input aria-hidden="true" name="finDocumentoList[${list.index}].idtipooperacao.id" type="hidden" value="${finDocumento.idtipooperacao.id}">
				<input aria-hidden="true" name="finDocumentoList[${list.index}].numero" type="hidden" value="${finDocumento.numero}">
				<input aria-hidden="true" name="finDocumentoList[${list.index}].serie" type="hidden" value="${finDocumento.serie}">
				<input aria-hidden="true" name="finDocumentoList[${list.index}].desdobramento" type="hidden" value="${finDocumento.desdobramento}">
				<input aria-hidden="true" name="finDocumentoList[${list.index}].idtipodocumento.id" type="hidden" value="${finDocumento.idtipodocumento.id}">
				<input aria-hidden="true" name="finDocumentoList[${list.index}].idhistorico.id" type="hidden" value="${finDocumento.idhistorico.id}">
				<input aria-hidden="true" name="finDocumentoList[${list.index}].idformapagamento.id" type="hidden" value="${finDocumento.idformapagamento.id}">
				<input aria-hidden="true" name="finDocumentoList[${list.index}].valortotal" type="hidden" value="<fmt:formatNumber pattern="0.00" type="currency" value="${finDocumento.valortotal}"/>">
				<input aria-hidden="true" name="finDocumentoList[${list.index}].saldo" type="hidden" value="<fmt:formatNumber pattern="0.00" type="currency" value="${finDocumento.saldo}"/>">
				<input aria-hidden="true" name="finDocumentoList[${list.index}].dataemissao" type="hidden" value="<fmt:formatDate pattern="dd/MM/yyyy" type="date" value="${finDocumento.dataemissao.time}"/>">
				<input aria-hidden="true" name="finDocumentoList[${list.index}].datavencimento" type="hidden" value="<fmt:formatDate pattern="dd/MM/yyyy" type="date" value="${finDocumento.datavencimento.time}"/>">
				<input aria-hidden="true" name="finDocumentoList[${list.index}].datacreate" type="hidden" value="<fmt:formatDate pattern="dd/MM/yyyy" type="date" value="${finDocumento.datacreate.time}"/>">
				<input aria-hidden="true" name="finDocumentoList[${list.index}].dataupdate" type="hidden" value="<fmt:formatDate pattern="dd/MM/yyyy" type="date" value="${finDocumento.dataupdate.time}"/>">
			</c:forEach>
			<display:table class="c-table--lube c-table--hovered c-table--zebrered c-table--bordered" export="false" id="obj" name="${FinDocumentoList}" requestURI="/financeiro/documento">
				<display:column format="{0, date, dd/MM/yyyy}" headerScope="dataemissao" property="dataemissao.time" titleKey="displaytag.data.emissao"/>
				<display:column format="{0, date, dd/MM/yyyy}" headerScope="datavencimento" property="datavencimento.time" titleKey="displaytag.data.vencimento"/>
				<display:column headerScope="numero" property="numero" titleKey="displaytag.numero.documento"/>
				<display:column headerScope="serie" property="serie" titleKey="displaytag.serie"/>
				<display:column headerScope="desdobramento" property="desdobramento" titleKey="displaytag.desdobramento"/>
				<display:column headerScope="valortotal" property="valortotal" titleKey="displaytag.valor.total"/>
			</display:table>
		</c:if>
	</section>
	<menu class="o-toolbar--lube is-fixedBottomFull" role="menubar">
		<menuitem class="o-toolbar__item" role="menuitem"><a href="<c:url value="/financeiro/documento/parcelamento"/>" role="link" title="<fmt:message key="button.novo"/>"><i class="icon-plus"></i>&nbsp;<fmt:message key="button.novo"/></a></menuitem>
		<menuitem class="o-toolbar__item" role="menuitem"><button title="<fmt:message key="button.processar"/>" role="button" title="<fmt:message key="button.processar"/>" type="submit"><i class="icon-spin6"></i>&nbsp;<fmt:message key="button.processar"/></button></menuitem>
		<c:if test="${not empty FinDocumentoList}">
			<menuitem class="o-toolbar__item" role="menuitem"><button formaction="<c:url value="/financeiro/documento/parcelamento/confirmar"/>" role="button" title="<fmt:message key="button.confirmar"/>" type="submit"><i class="icon-thumbs-up"></i>&nbsp;<fmt:message key="button.confirmar"/></button></menuitem>
		</c:if>
	</menu>
</form>
<%@include file="/config/footer.jsp"%>