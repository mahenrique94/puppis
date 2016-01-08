<%@include file="/config/header.jsp" %>
<div class="container-tie">
	<form action="<c:url value="/financeiro/documento"/>" class="form-block" id="formfindocumento" method="post" name="formfindocumento" role="form">
		<input name="openBoxSearch" type="hidden" value="pespessoa finhistorico">
		<input name="obj.id" type="hidden" value="${obj.id}">
		<input name="obj.idtipooperacao.idaux" type="hidden" value="${obj.idtipooperacao.id}">
		<input name="obj.idtipooperacao.descricao" type="hidden" value="${obj.idtipooperacao.descricao}">
		<input name="obj.idcontabancaria.idaux" type="hidden" value="${obj.idcontabancaria.id}">
		<input name="obj.idtipodocumento.idaux" type="hidden" value="${obj.idtipodocumento.id}">
		<input name="obj.idformapagamento.idaux" type="hidden" value="${obj.idformapagamento.id}">
		<input name="obj.idformapagamento.descricao" type="hidden" value="${obj.idformapagamento.descricao}">
		<input name="obj.idformapagamento.intervalo" type="hidden" value="${obj.idformapagamento.intervalo}">
		<input name="obj.idformapagamento.quantidadeparcela" type="hidden" value="${obj.idformapagamento.quantidadeparcela}">
		<div class="container-header">
			<div class="row">
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
					<h2><fmt:message key="nav.financeiro"/>&nbsp;<fmt:message key="label.barra"/>&nbsp;<fmt:message key="nav.operacional"/>&nbsp;<fmt:message key="label.barra"/>&nbsp;<fmt:message key="nav.financeiro.operacional.documento"/></h2>
				</div>
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
					<button class="btn-md float-left m-right-5" title="<fmt:message key="button.salvar"/>" type="submit"><span class="icon-floppy-disk"></span>&nbsp;<fmt:message key="button.salvar"/></button>
					<button class="btn-md float-left m-right-5" formaction="<c:url value="/financeiro/documento/atualizar"/>" title="<fmt:message key="button.atualizar"/>" type="submit"><span class="icon-refresh"></span>&nbsp;<fmt:message key="button.atualizar"/></button>
					<a href="<c:url value="/financeiro/documento"/>" class="btn-md float-left m-right-5" title="<fmt:message key="button.pesquisar"/>"><span class="icon-search"></span>&nbsp;<fmt:message key="button.pesquisar"/></a>
				</div>
			</div>
		</div>
		<section aria-expanded="true" aria-hidden="false" class="clearfix" role="form">
			<div class="row-input" role="row">
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
					<label><fmt:message key="label.operacao"/></label>
					<select class="select-form" data-class="slSysTipoOperacao" data-fields="idmodulo.id" data-parameters="2" id="slSystem_Tipo-de-operacao_Json_01" name="obj.idtipooperacao.id" required></select>
					<netsis:validationMessage name="obj.idtipooperacao.id"/>
				</div>
			</div>
			<div class="row" role="row">
				<div class="col-xs-2 col-sm-2 col-md-2 col-lg-2" role="separator">
					<label><fmt:message key="label.id.pessoa"/></label>
					<input class="input-form" data-toggle="modal" formaction="<c:url value="/pessoa/listarsl"/>" id="pespessoa_id" name="obj.idpessoa.id" required type="search" value="${obj.idpessoa.id}">
					<netsis:validationMessage name="obj.idpessoa.id"/>
				</div>
				<div class="col-xs-10 col-sm-10 col-md-10 col-lg-10" role="separator">
					<label><fmt:message key="label.nome.razao.social"/></label>
					<input class="input-form" id="pespessoa_nomerazaosocial" readonly type="text" value="${obj.idpessoa.nomerazaosocial}">
					<netsis:validationMessage name="obj.idpessoa.nomerazaosocial"/>
				</div>
			</div>
			<div class="row" role="row">
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" role="separator">
					<label><fmt:message key="label.conta"/></label>
					<select class="select-form" data-class="slFinContaBancaria" id="slFinanceiro_Conta-bancaria_Json_01" name="obj.idcontabancaria.id" required></select>
					<netsis:validationMessage name="obj.idcontabancaria.id"/>
				</div>
			</div>
			<div class="row" role="row">
				<div class="col-xs-3 col-sm-3 col-md-3 col-lg-3" role="separator">
					<label><fmt:message key="label.numero"/></label>
					<input class="input-form" min="0" name="obj.numero" pattern="numero0a9" required type="number" value="${obj.numero}">
					<netsis:validationMessage name="obj.numero"/>
				</div>
				<div class="col-xs-3 col-sm-3 col-md-3 col-lg-3" role="separator">
					<label><fmt:message key="label.serie"/></label>
					<input class="input-form" min="0" name="obj.serie" pattern="numero0a9" type="number" value="${obj.serie}">
					<netsis:validationMessage name="obj.serie"/>
				</div>
				<div class="col-xs-3 col-sm-3 col-md-3 col-lg-3" role="separator">
					<label><fmt:message key="label.tipo.documento"/></label>
					<select class="select-form" data-class="slFinTipoDocumento" id="slFinanceiro_Tipo-de-documento_Json_01" name="obj.idtipodocumento.id"></select>
					<netsis:validationMessage name="obj.idtipodocumento.id"/>
				</div>
				<div class="col-xs-3 col-sm-3 col-md-3 col-lg-3" role="separator">
					<label><fmt:message key="label.data.emissao"/></label>
					<input class="input-form" data-mask="data" maxlength="10" min="01-01-1970" name="obj.dataemissao" pattern="data" required type="text" value="<fmt:formatDate pattern="dd/MM/yyyy" type="date" value="${obj.dataemissao.time}"/>">
					<netsis:validationMessage name="obj.dataemissao"/>
				</div>
			</div>
			<div class="row" role="row">
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" role="separator">
					<label><fmt:message key="label.valor.total"/></label>
					<input class="input-form" maxlength="13" name="obj.valortotal" pattern="numeric10_2" required type="text" value="${obj.valortotal}"/>
					<netsis:validationMessage name="obj.valortotal"/>
				</div>
			</div>
			<div class="row" role="row">
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" role="separator">
					<label><fmt:message key="label.forma.pagamento"/></label>
					<select class="select-form" data-class="slFinFormaPagamento" id="slFinanceiro_Forma-de-pagamento_Json_01" name="obj.idformapagamento.id"></select>
				</div>
			</div>
			<div class="row" role="row">
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" role="separator">
					<label><fmt:message key="label.codigo.barra"/></label>
					<input class="input-form" maxlength="120" name="obj.codigobarra" pattern="letraNumero" type="text" value="${obj.codigobarra}">
					<netsis:validationMessage name="obj.codigobarra"/>
				</div>
			</div>
			<div class="row" role="row">
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" role="separator">
					<label><fmt:message key="label.id.historico"/></label>
					<input class="input-form" data-toggle="modal" formaction="<c:url value="/financeiro/historico/listarsl"/>" id="finhistorico_id" min="0" name="obj.idhistorico.id" pattern="numero0a9" type="search" value="${obj.idhistorico.id}">
					<netsis:validationMessage name="obj.idhistorico.id"/>
				</div>
			</div>
			<div class="row" role="row">
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" role="separator">
					<label><fmt:message key="label.historico"/></label>
					<textarea class="textarea-form" id="finhistorico_descricao" readonly rows="5">${obj.idhistorico.descricao}</textarea>
					<netsis:validationMessage name="obj.idhistorico.descricao"/>
				</div>
			</div>
			<c:import url="tabs.jsp"/>
		</section>
	</form>
</div>
<%@include file="/config/footer.jsp"%>