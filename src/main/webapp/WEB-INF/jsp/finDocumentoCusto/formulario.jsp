<%@include file="/config/taglibraries.jsp" %>
<%@include file="/config/libraries-style.jsp" %>
<div class="container-tie">
	<form action="<c:url value="/financeiro/documento/custo"/>" class="form-block" id="formfindocumentocusto" method="post" name="formfindocumentocentrocusto" onsubmit="return enviarPost(this);" role="form">
		<input name="openBoxSearch" type="hidden" value="finhistorico">
		<input name="obj.id" type="hidden" value="${obj.id}">
		<input name="obj.iddocumento.id" type="hidden" value="${obj.iddocumento.id}">
		<div class="container-header">
			<div class="row">
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
					<h2><fmt:message key="nav.financeiro"/>&nbsp;<fmt:message key="label.barra"/>&nbsp;<fmt:message key="nav.operacional"/>&nbsp;<fmt:message key="label.barra"/>&nbsp;<fmt:message key="nav.financeiro.operacional.documento"/>&nbsp;<fmt:message key="label.barra"/>&nbsp;<fmt:message key="tab.custo"/></h2>
				</div>
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
					<button class="btn-md float-left m-right-5" title="<fmt:message key="button.salvar"/>" type="submit"><span class="icon-floppy-disk"></span>&nbsp;<fmt:message key="button.salvar"/></button>
				</div>
			</div>
		</div>
		<section aria-expanded="true" aria-hidden="false" class="clearfix" role="form">
			<div class="row" role="row">
				<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4" role="separator">
					<label><fmt:message key="label.numero"/></label>
					<input class="input-form" name="obj.iddocumento.numero" readonly type="number" value="${obj.iddocumento.numero}">
					<netsis:validationMessage name="obj.iddocumento.numero"/>
				</div>
				<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4" role="separator">
					<label><fmt:message key="label.serie"/></label>
					<input class="input-form" name="obj.iddocumento.serie" readonly type="number" value="${obj.iddocumento.serie}">
					<netsis:validationMessage name="obj.iddocumento.serie"/>
				</div>
				<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4" role="separator">
					<label><fmt:message key="label.desdobramento"/></label>
					<input class="input-form" name="obj.desdobramento" readonly required type="text" value="${obj.desdobramento}">
					<netsis:validationMessage name="obj.desdobramento"/>
				</div>
			</div>
			<div class="row" role="row">
				<div class="col-xs-3 col-sm-3 col-md-3 col-lg-3" role="separator">
					<label><fmt:message key="label.valor.total"/></label>
					<input class="input-form" name="obj.valortotal" readonly required type="text" value="${obj.valortotal}"/>
					<netsis:validationMessage name="obj.valortotal"/>
				</div>
				<div class="col-xs-3 col-sm-3 col-md-3 col-lg-3" role="separator">
					<label><fmt:message key="label.valor.desconto"/></label>
					<input class="input-form" maxlength="13" name="obj.valordesconto" pattern="numeric10_2" type="text" value="${obj.valordesconto}"/>
					<netsis:validationMessage name="obj.valordesconto"/>
				</div>
				<div class="col-xs-3 col-sm-3 col-md-3 col-lg-3" role="separator">
					<label><fmt:message key="label.valor.juros"/></label>
					<input class="input-form" maxlength="13" name="obj.valorjuros" pattern="numeric10_2" type="text" value="${obj.valorjuros}"/>
					<netsis:validationMessage name="obj.valorjuros"/>
				</div>
				<div class="col-xs-3 col-sm-3 col-md-3 col-lg-3" role="separator">
					<label><fmt:message key="label.saldo"/></label>
					<input class="input-form" name="obj.valordesconto" readonly required type="text" value="${obj.saldo}"/>
					<netsis:validationMessage name="obj.saldo"/>
				</div>
			</div>
			<div class="row" role="row">
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" role="separator">
					<label><fmt:message key="label.data.vencimento"/></label>
					<input class="input-form" name="obj.datavencimento" readonly required type="text" value="<fmt:formatDate pattern="dd/MM/yyyy" type="date" value="${obj.datavencimento.time}"/>">
					<netsis:validationMessage name="obj.obj.datavencimento"/>
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
		</section>
	</form>
</div>
<%@include file="/config/libraries-js.jsp" %>