<%@include file="/config/taglibraries.jsp" %>
<%@include file="/config/libraries-style.jsp"%>
<form action="<c:url value="/tabela-de-preco/valor"/>" class="form-modern" id="formtblprecoitem" method="post" name="formtblprecoitem" onsubmit="return enviarPost(this);" role="form">
	<input name="obj.id" type="hidden" value="${obj.id}">
	<input name="obj.idtabelaprecopessoa.id" type="hidden" value="${obj.idtabelaprecopessoa.id}">
	<nav class="band-nav-lube" role="complementary">
		<div class="row" role="row">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" role="separator">
				<label><fmt:message key="nav.cadastro.tabela.preco.pessoa.item"/></label>					
			</div>
		</div>
	</nav>
	<section aria-expanded="true" aria-hidden="false" class="form-body" role="form">
		<div class="row" role="row">
			<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6" role="separator">
				<label><fmt:message key="label.data.vigencia.inicial"/></label>
				<input autofocus class="form-data validate" maxlength="16" name="obj.datavigenciainicial" onkeypress="format(this, event, maskDataHora);" pattern="dataHora" required type="text" value="<fmt:formatDate pattern="dd/MM/yyyy HH:mm" type="date" value="${obj.datavigenciainicial.time}"/>">
				<netsis:validationMessage name="obj.datavigenciainicial"/>
			</div>
			<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6" role="separator">
				<label><fmt:message key="label.data.vigencia.final"/></label>
				<input autofocus class="form-data validate" maxlength="16" name="obj.datavigenciafinal" onkeypress="format(this, event, maskDataHora);" pattern="dataHora" required type="text" value="<fmt:formatDate pattern="dd/MM/yyyy HH:mm" type="date" value="${obj.datavigenciafinal.time}"/>">
				<netsis:validationMessage name="obj.datavigenciafinal"/>
			</div>
		</div>
		<div class="row" role="row">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" role="separator">
				<label><fmt:message key="label.valor"/></label>
				<input class="form-data validate" maxlength="13" name="obj.valor" pattern="numeric10_2" required type="text" value="<fmt:formatNumber pattern="0.00" type="currency" value="${obj.valor}"/>"/>
				<netsis:validationMessage name="obj.valor"/>
			</div>
		</div>
		<div class="row" role="row">
			<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6" role="separator">
				<label><fmt:message key="label.valor.promocao"/></label>
				<input class="form-data validate" maxlength="13" name="obj.valorpromocao" pattern="numeric10_2" type="text" value="<fmt:formatNumber pattern="0.00" type="currency" value="${obj.valorpromocao}"/>"/>
				<netsis:validationMessage name="obj.valorpromocao"/>
			</div>
			<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6" role="separator">
				<label><fmt:message key="label.valor.desconto"/></label>
				<input class="form-data validate" maxlength="13" name="obj.valordesconto" pattern="numeric10_2" type="text" value="<fmt:formatNumber pattern="0.00" type="currency" value="${obj.valordesconto}"/>"/>
				<netsis:validationMessage name="obj.valordesconto"/>
			</div>
		</div>
		<div class="row" role="row">
			<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6" role="separator">
				<label><fmt:message key="label.valor.parcelamento"/></label>
				<input class="form-data validate" maxlength="13" name="obj.valorparcelamento" pattern="numeric10_2" type="text" value="<fmt:formatNumber pattern="0.00" type="currency" value="${obj.valorparcelamento}"/>"/>
				<netsis:validationMessage name="obj.valorparcelamento"/>
			</div>
			<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6" role="separator">
				<label><fmt:message key="label.valor.faturado"/></label>
				<input class="form-data validate" maxlength="13" name="obj.valorfaturado" pattern="numeric10_2" type="text" value="<fmt:formatNumber pattern="0.00" type="currency" value="${obj.valorfaturado}"/>"/>
				<netsis:validationMessage name="obj.valorfaturado"/>
			</div>
		</div>
		<div class="row" role="row">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" role="separator">
				<label><fmt:message key="label.inativo"/></label>
				<input <c:if test="${obj.inativo == true}">checked</c:if> class="form-data" name="obj.inativo" type="checkbox" value="true">
				<netsis:validationMessage name="obj.inativo"/>
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