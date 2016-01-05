<%@include file="/config/header.jsp" %>
<c:set var="readOnly" value="${obj.id != null ? 'readonly' : ''}"/>
<c:set var="disabled" value="${obj.id != null ? 'disabled' : ''}"/>
<div class="container-tie">
	<form action="<c:url value="/comercio/nota"/>" class="form-block" id="formcomnota" method="post" name="formcomnota" role="form">
		<input name="openBoxSearch" type= "hidden" value="pespessoa">
		<input name="obj.idfuncionario.id" type="hidden" value="${username.usuario.id}">
		<input name="obj.idtipooperacao.idaux" type="hidden" value="${obj.idtipooperacao.id}">
		<input name="obj.idtipooperacao.tipo" type="hidden" value="${obj.idtipooperacao.tipo}">
		<div class="container-header">
			<div class="row">
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
					<h2><fmt:message key="nav.comercio"/>&nbsp;<fmt:message key="label.barra"/>&nbsp;<fmt:message key="nav.operacional"/>&nbsp;<fmt:message key="label.barra"/>&nbsp;<fmt:message key="nav.comercio.operacional.compra.venda"/></h2>
				</div>
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
					<button class="btn-md float-left m-right-5" title="<fmt:message key="button.salvar"/>" type="submit"><span class="icon-floppy-disk"></span>&nbsp;<fmt:message key="button.salvar"/></button>
					<a href="<c:url value="/comercio/nota"/>" class="btn-md float-left m-right-5" title="<fmt:message key="button.pesquisar"/>"><span class="icon-search"></span>&nbsp;<fmt:message key="button.pesquisar"/></a>
					<button class="btn-md float-left m-right-5" formaction="<c:url value="/comercio/nota/atualizar"/>" formmethod="post" title="<fmt:message key="button.atualizar"/>" type="submit"><span class="icon-refresh"></span>&nbsp;<fmt:message key="button.atualizar"/></button>
				</div>
			</div>
		</div>
		<section aria-expanded="true" aria-hidden="false" class="clearfix" role="form">
			<div class="row" role="row">
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" role="separator">
					<label><fmt:message key="label.operacao"/></label>
					<select class="select-form" data-class="slSysTipoOperacao" data-fields="idmodulo.id" data-parameters="1" id="slSystem_Tipo-de-operacao_json_1" name="obj.idtipooperacao.id" ${readOnly}></select>
					<netsis:validationMessage name="obj.operacao"/>
				</div>
			</div>
			<c:if test="${obj.id != null && obj.idtipooperacao.id == 1}">
				<div class="row" role="row">
					<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4" role="separator">
						<label><fmt:message key="label.data.create"/></label>
						<input class="input-form" maxlength="10" name="obj.datacreate" pattern="data" readonly type="text" value="<fmt:formatDate pattern="dd/MM/yyyy" value="${obj.datacreate.time}" type="date"/>">
						<netsis:validationMessage name="obj.datacreate"/>
					</div>
					<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4" role="separator">
						<label><fmt:message key="label.data.emissao"/></label>
						<input class="input-form" maxlength="10" name="obj.dataemissao" pattern="data" type="text" value="<fmt:formatDate pattern="dd/MM/yyyy" value="${obj.dataemissao.time}" type="date"/>">
						<netsis:validationMessage name="obj.dataemissao"/>
					</div>
					<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4" role="separator">
						<label><fmt:message key="label.data.entrada"/></label>
						<input class="input-form" maxlength="10" name="obj.dataentrada" pattern="data" type="text" value="<fmt:formatDate pattern="dd/MM/yyyy" value="${obj.dataentrada.time}" type="date"/>">
						<netsis:validationMessage name="obj.dataentrada"/>
					</div>
				</div>
				<div class="row" role="row">
					<div class="col-xs-2 col-sm-2 col-md-2 col-lg-2" role="separator">
						<label><fmt:message key="label.id"/></label>
						<input class="input-form" name="obj.id" readonly type="number" value="${obj.id}">
						<netsis:validationMessage name="obj.id"/>
					</div>
					<div class="col-xs-2 col-sm-2 col-md-2 col-lg-2" role="separator">
						<label><fmt:message key="label.id.fornecedor"/></label>
						<input class="input-form" data-toggle="modal" formaction="<c:url value="/pessoa/listarsl"/>" id="pespessoa_id" name="obj.idfornecedor.id" required type="search" value="${obj.idfornecedor.id}">
						<netsis:validationMessage name="obj.idfornecedor.id"/>
					</div>
					<div class="col-xs-8 col-sm-8 col-md-8 col-lg-8" role="separator">
						<label><fmt:message key="label.razao.social"/></label>
						<input class="input-form" id="pespessoa_nomerazaosocial" readonly type="text" value="${obj.idfornecedor.nomerazaosocial}">
						<netsis:validationMessage name="obj.idfornecedor.nomerazaosocial"/>
					</div>
				</div>
				<div class="row" role="row">
					<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6" role="separator">
						<label><fmt:message key="label.numero.nota"/></label>
						<input class="input-form" name="obj.numeronota" type="number" value="${obj.numeronota}">
						<netsis:validationMessage name="obj.numeronota"/>
					</div>
					<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6" role="separator">
						<label><fmt:message key="label.serie.nota"/></label>
						<input class="input-form full" name="obj.serienota" type="number" value="${obj.serienota}">
						<netsis:validationMessage name="obj.serienota"/>
					</div>
				</div>
			</c:if>
			<c:if test="${obj.id != null && obj.idtipooperacao.id == 2}">
				<div class="row" role="row">
					<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6" role="separator">
						<label><fmt:message key="label.id"/></label>
						<input class="input-form" name="obj.id" readonly type="number" value="${obj.id}">
						<netsis:validationMessage name="obj.id"/>
					</div>
					<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6" role="separator">
						<label><fmt:message key="label.data.create"/></label>
						<input class="input-form" name="obj.datacreate" readonly type="text" value="<fmt:formatDate pattern="dd/MM/yyyy" value="${obj.datacreate.time}" type="date"/>">
						<netsis:validationMessage name="obj.datacreate"/>
					</div>
				</div>
				<div class="row" role="row">
					<div class="col-xs-2 col-sm-2 col-md-2 col-lg-2" role="separator">
						<label><fmt:message key="label.id.cliente"/></label>
						<input class="input-form" data-toggle="modal" formaction="<c:url value="/pessoa/listarsl"/>" id="pespessoa_id" maxlength="10" name="obj.idcliente.id" required type="search" value="${obj.idcliente.id}">
						<netsis:validationMessage name="obj.idcliente.id"/>
					</div>
					<div class="col-xs-10 col-sm-10 col-md-10 col-lg-10" role="separator">
						<label><fmt:message key="label.nome"/></label>
						<input class="input-form" id="pespessoa_nomerazaosocial" readonly type="text" value="${obj.idcliente.nomerazaosocial}">
						<netsis:validationMessage name="obj.idcliente.nome"/>
					</div>
				</div>
			</c:if>
			<c:if test="${obj.id != null}">
				<span class="band-lube no-margin" role="separator"><label><fmt:message key="titulo.itens"/></label></span>
				<input type="hidden" name="obj.custo.idformapagamento.idaux" value="${obj.custo.idformapagamento.id}">
				<nav class="nav-band">
					<a class="btn-xs" data-toggle="modal" href="<c:url value="/comercio/nota-itens/formulario/${obj.id}"/>"><span class="icon-plus"></span>&nbsp;<fmt:message key="button.novo"/></a>
				</nav>
				<div class="loadgrid" data-load="<c:url value="/comercio/nota-itens/loadgrid/${obj.id}"/>" id="notaitens1"></div>
				<span class="band-lube m-top-5" role="separator"><label><fmt:message key="titulo.custo"/></label></span>
				<input type="hidden" name="obj.custo.id" value="${obj.custo.id}">
				<input type="hidden" name="obj.custo.idnota.id" value="${obj.id}">
				<div class="row" role="row">
					<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" role="separator">
						<label><fmt:message key="label.forma.pagamento"/></label>
						<select class="select-form" data-class="slFinFormaPagamento" id="slFinanceiro_Forma-de-pagamento_json_1" name="obj.custo.idformapagamento.id"></select>
						<netsis:validationMessage name="obj.custo.idformapagamento.id"/>
					</div>
				</div>
				<div class="row" role="row">
					<div class="col-xs-3 col-sm-3 col-md-3 col-lg-3" role="separator">
						<label><fmt:message key="label.porc.icms"/></label>
						<input class="input-form" maxlength="13" name="obj.custo.porcicms" pattern="numeric10_2" type="text" value="${obj.custo.porcicms}">
						<netsis:validationMessage name="obj.custo.porcicms"/>
					</div>
					<div class="col-xs-3 col-sm-3 col-md-3 col-lg-3" role="separator">
						<label><fmt:message key="label.porc.ipi"/></label>
						<input class="input-form" maxlength="13" name="obj.custo.porcipi" pattern="numeric10_2" type="text" value="${obj.custo.porcipi}">
						<netsis:validationMessage name="obj.custo.porcipi"/>
					</div>
					<div class="col-xs-3 col-sm-3 col-md-3 col-lg-3" role="separator">
						<label><fmt:message key="label.porc.desconto"/></label>
						<input class="input-form" maxlength="13" name="obj.custo.porcdesconto" pattern="numeric10_2" type="text" value="${obj.custo.porcdesconto}">
						<netsis:validationMessage name="obj.custo.porcdesconto"/>
					</div>
					<div class="col-xs-3 col-sm-3 col-md-3 col-lg-3" role="separator">
						<label><fmt:message key="label.valor.total"/></label>
						<input class="input-form" name="obj.custo.valortotal" readonly type="text" value="${obj.custo.valortotal}">
						<netsis:validationMessage name="obj.custo.valortotal"/>
					</div>
				</div>
			</c:if>
		</section>
	</form>
</div>
<%@include file="/config/footer.jsp"%>