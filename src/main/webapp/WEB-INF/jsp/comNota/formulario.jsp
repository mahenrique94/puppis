<%@include file="/config/header.jsp" %>
<c:set var="readOnly" value="${obj.id != null ? 'readonly' : ''}"/>
<c:set var="disabled" value="${obj.id != null ? 'disabled' : ''}"/>
<fieldset class="block-lube">
	<legend class="block-header">
		<h1 class="block-title"><label><fmt:message key="nav.comercio"/>&nbsp;<fmt:message key="label.barra"/>&nbsp;<fmt:message key="nav.comercio.operacional"/>&nbsp;<fmt:message key="label.barra"/>&nbsp;<fmt:message key="nav.comercio.operacional.compra.venda"/></label></h1>
	</legend>
	<form action="<c:url value="/nota"/>" class="form-inline" id="formlistarcadsetor" method="post" name="formlistarcadsetor" role="form">
		<input type= "hidden" name="openBoxSearch" value="pespessoa">
		<input type="hidden" name="obj.idfuncionario.id" value="${username.usuario.id}">
		<input type="hidden" name="obj.idtipooperacao.idaux" value="${obj.idtipooperacao.id}">
		<input type="hidden" name="obj.idtipooperacao.tipo" value="${obj.idtipooperacao.tipo}">
		<nav class="clearfix nav-block" role="navigation">
			<div class="w-100">
				<button class="btn-md float-left m-right-5" title="<fmt:message key="button.salvar"/>" type="submit"><span class="icon-floppy-disk"></span>&nbsp;<fmt:message key="button.salvar"/></button>
				<button class="btn-md float-left m-right-5" formaction="<c:url value="/nota/atualizar"/>" formmethod="post" title="<fmt:message key="button.atualizar"/>"><span class="icon-refresh"></span>&nbsp;<fmt:message key="button.atualizar"/></button>
				<a href="<c:url value="/nota"/>" class="btn-md float-left m-right-5" title="<fmt:message key="button.pesquisar"/>"><span class="icon-search"></span>&nbsp;<fmt:message key="button.pesquisar"/></a>
			</div>
		</nav>
		<section aria-expanded="true" aria-hidden="false" class="block-body clearfix" role="form">
			<div class="row-input" role="row">
				<div class="w-100" role="separator">
					<label class="align-left"><fmt:message key="label.operacao"/></label>
					<select class="select-form full-select" data-class="slSysTipoOperacao" id="slSystem_Tipo-de-operacao_json_1" name="obj.idtipooperacao.id" ${readOnly}></select>
					<netsis:validationMessage name="obj.operacao"/>
				</div>
			</div>
			<c:if test="${obj.id != null && obj.idtipooperacao.id == 1}">
				<div class="row-input" role="row">
					<div class="w-34" role="separator">
						<label class="align-left"><fmt:message key="label.data.create"/></label>
						<input class="input-form" maxlength="10" name="obj.datacreate" pattern="data" readonly type="text" value="<fmt:formatDate pattern="dd/MM/yyyy" value="${obj.datacreate.time}" type="date"/>">
						<netsis:validationMessage name="obj.datacreate"/>
					</div>
					<div class="w-33" role="separator">
						<label class="align-left"><fmt:message key="label.data.emissao"/></label>
						<input class="input-form" maxlength="10" name="obj.dataemissao" pattern="data" type="text" value="<fmt:formatDate pattern="dd/MM/yyyy" value="${obj.dataemissao.time}" type="date"/>">
						<netsis:validationMessage name="obj.dataemissao"/>
					</div>
					<div class="w-33" role="separator">
						<label class="align-left"><fmt:message key="label.data.entrada"/></label>
						<input class="input-form full" maxlength="10" name="obj.dataentrada" pattern="data" type="text" value="<fmt:formatDate pattern="dd/MM/yyyy" value="${obj.dataentrada.time}" type="date"/>">
						<netsis:validationMessage name="obj.dataentrada"/>
					</div>
				</div>
				<div class="row-input" role="row">
					<div class="w-20" role="separator">
						<label class="align-left"><fmt:message key="label.id"/></label>
						<input class="input-form" name="obj.id" readonly type="number" value="${obj.id}">
						<netsis:validationMessage name="obj.id"/>
					</div>
					<div class="w-20" role="separator">
						<label class="align-left"><fmt:message key="label.id.fornecedor"/></label>
						<input class="input-form" data-toggle="modal" formaction="<c:url value="/pessoa/listarsl"/>" id="pespessoa_id" name="obj.idfornecedor.id" required type="search" value="${obj.idfornecedor.id}">
						<netsis:validationMessage name="obj.idfornecedor.id"/>
					</div>
					<div class="w-60" role="separator">
						<label class="align-left"><fmt:message key="label.razao.social"/></label>
						<input class="input-form full" id="pespessoa_nomerazaosocial" readonly type="text" value="${obj.idfornecedor.nomerazaosocial}">
						<netsis:validationMessage name="obj.idfornecedor.nomerazaosocial"/>
					</div>
				</div>
				<div class="row-input" role="row">
					<div class="w-50" role="separator">
						<label class="align-left"><fmt:message key="label.numero.nota"/></label>
						<input class="input-form" name="obj.numeronota" type="number" value="${obj.numeronota}">
						<netsis:validationMessage name="obj.numeronota"/>
					</div>
					<div class="w-50" role="separator">
						<label class="align-left"><fmt:message key="label.serie.nota"/></label>
						<input class="input-form full" name="obj.serienota" type="number" value="${obj.serienota}">
						<netsis:validationMessage name="obj.serienota"/>
					</div>
				</div>
			</c:if>
			<c:if test="${obj.id != null && obj.idtipooperacao.id == 2}">
				<div class="row-input" role="row">
					<div class="w-50" role="separator">
						<label class="align-left"><fmt:message key="label.id"/></label>
						<input class="input-form" name="obj.id" readonly type="number" value="${obj.id}">
						<netsis:validationMessage name="obj.id"/>
					</div>
					<div class="w-50" role="separator">
						<label class="align-left"><fmt:message key="label.data.create"/></label>
						<input class="input-form full" name="obj.datacreate" readonly type="text" value="<fmt:formatDate pattern="dd/MM/yyyy" value="${obj.datacreate.time}" type="date"/>">
						<netsis:validationMessage name="obj.datacreate"/>
					</div>
				</div>
				<div class="row-input" role="row">
					<div class="w-20" role="separator">
						<label class="align-left"><fmt:message key="label.id.cliente"/></label>
						<input class="input-form" data-toggle="modal" formaction="<c:url value="/pessoa/listarsl"/>" id="pespessoa_id" maxlength="10" name="obj.idcliente.id" required type="search" value="${obj.idcliente.id}">
						<netsis:validationMessage name="obj.idcliente.id"/>
					</div>
					<div class="w-80" role="separator">
						<label class="align-left"><fmt:message key="label.nome"/></label>
						<input class="input-form full" id="pespessoa_nomerazaosocial" readonly type="text" value="${obj.idcliente.nomerazaosocial}">
						<netsis:validationMessage name="obj.idcliente.nome"/>
					</div>
				</div>
			</c:if>
			<c:if test="${obj.id != null}">
				<span class="band-lube no-margin" role="separator"><label><fmt:message key="titulo.itens"/></label></span>
				<input type="hidden" name="obj.custo.idformapagamento.idaux" value="${obj.custo.idformapagamento.id}">
				<nav class="nav-band">
					<a class="btn-xs" data-toggle="modal" href="<c:url value="/nota-itens/formulario/${obj.id}"/>"><span class="icon-plus"></span>&nbsp;<fmt:message key="button.novo"/></a>
				</nav>
				<div class="loadgrid" data-load="<c:url value="/nota-itens/loadgrid/${obj.id}"/>" id="notaitens1"></div>
				<span class="band-lube m-top-5" role="separator"><label><fmt:message key="titulo.custo"/></label></span>
				<input type="hidden" name="obj.custo.id" value="${obj.custo.id}">
				<input type="hidden" name="obj.custo.idnota.id" value="${obj.id}">
				<div class="row-input" role="row">
					<div class="w-100" role="separator">
						<label class="align-left"><fmt:message key="label.forma.pagamento"/></label>
						<select class="select-form full-select" data-class="slFinFormaPagamento" id="slFinanceiro_Forma-de-pagamento_json_1" name="obj.custo.idformapagamento.id"></select>
						<netsis:validationMessage name="obj.custo.idformapagamento.id"/>
					</div>
				</div>
				<div class="row-input" role="row">
					<div class="w-25" role="separator">
						<label class="align-left"><fmt:message key="label.porc.icms"/></label>
						<input class="input-form" maxlength="13" name="obj.custo.porcicms" pattern="numeric10_2" type="text" value="${obj.custo.porcicms}">
						<netsis:validationMessage name="obj.custo.porcicms"/>
					</div>
					<div class="w-25" role="separator">
						<label class="align-left"><fmt:message key="label.porc.ipi"/></label>
						<input class="input-form" maxlength="13" name="obj.custo.porcipi" pattern="numeric10_2" type="text" value="${obj.custo.porcipi}">
						<netsis:validationMessage name="obj.custo.porcipi"/>
					</div>
					<div class="w-25" role="separator">
						<label class="align-left"><fmt:message key="label.porc.desconto"/></label>
						<input class="input-form" maxlength="13" name="obj.custo.porcdesconto" pattern="numeric10_2" type="text" value="${obj.custo.porcdesconto}">
						<netsis:validationMessage name="obj.custo.porcdesconto"/>
					</div>
					<div class="w-25" role="separator">
						<label class="align-left"><fmt:message key="label.valor.total"/></label>
						<input class="input-form full" name="obj.custo.valortotal" readonly type="text" value="${obj.custo.valortotal}">
						<netsis:validationMessage name="obj.custo.valortotal"/>
					</div>
				</div>
			</c:if>
		</section>
	</form>
</fieldset>
<%@include file="/config/footer.jsp"%>