<%@include file="/config/header.jsp" %>
<fieldset class="block-lube">
	<legend class="block-header">
		<h1 class="block-title"><label><fmt:message key="nav.cadastro"/>&nbsp;<fmt:message key="label.barra"/>&nbsp;<fmt:message key="nav.cadastro.pessoa"/>&nbsp;<fmt:message key="label.barra"/>&nbsp;<fmt:message key="nav.cadastro.pessoa.cliente"/></label></h1>
	</legend>
	<form action="<c:url value="/pessoa"/>" class="form-inline" id="formlistarpespessoa" method="post" name="formlistarpespessoa" role="form">
		<input type="hidden" name="obj.estadocivilaux" value="${obj.estadocivil}">
		<input type="hidden" name="obj.sexoaux" value="${obj.sexo}">
		<input type="hidden" name="obj.tipo.idaux" value="${obj.tipo.id}">
		<nav class="clearfix nav-block" role="navigation">
			<div class="w-100">
				<button class="btn-md float-left m-right-5" title="<fmt:message key="button.salvar"/>" type="submit"><span class="icon-floppy-disk"></span>&nbsp;<fmt:message key="button.salvar"/></button>
				<a href="<c:url value="/pessoa"/>" class="btn-md float-left m-right-5" title="<fmt:message key="button.pesquisar"/>"><span class="icon-search"></span>&nbsp;<fmt:message key="button.pesquisar"/></a>
			</div>
		</nav>
		<section aria-expanded="true" aria-hidden="false" class="block-body clearfix" role="form">
			<div class="row-input" role="row">
				<div class="w-100" role="separator">
					<label class="align-left"><fmt:message key="label.tipo"/></label>
					<select class="select-form full-select" data-class="slPesTipo" id="slPessoa_tipo_json_1" name="obj.tipo.id"></select>
					<netsis:validationMessage name="obj.tipo.id"/>
				</div>
			</div>
			<div class="row-input" role="row">
				<div class="w-50" role="separator">
					<label class="align-left"><fmt:message key="label.id"/></label>
					<input class="input-form" name="obj.id" readonly type="number" value="${obj.id}">
					<netsis:validationMessage name="obj.id"/>
				</div>							
				<div class="w-50" role="separator">
					<label class="align-left"><fmt:message key="label.data.create"/></label>
					<input class="input-form full" maxlength="10" readonly type="text" value="<fmt:formatDate pattern="dd/MM/yyyy" value="${obj.datacreate.time}" type="date"/>"/>
					<netsis:validationMessage name="obj.datacreate"/>
				</div>							
			</div>
			<div class="row-input" role="row">
				<div class="w-100" role="separator">
					<label class="align-left"><fmt:message key="label.nome.razao.social"/></label>
					<input autofocus class="input-form full" maxlength="60" name="obj.nomerazaosocial" pattern="letraNumeroEspacoPonto" required type="text" value="${obj.nomerazaosocial}">
					<netsis:validationMessage name="obj.nomerazaosocial"/>
				</div>
			</div>
			<div class="row-input" role="row">
				<div class="w-100" role="separator">
					<label class="align-left"><fmt:message key="label.nome.fantasia"/></label>
					<input class="input-form full" maxlength="60" name="obj.nomefantasia" pattern="letraNumeroEspacoPonto" type="text" value="${obj.nomefantasia}">
					<netsis:validationMessage name="obj.nomefantasia"/>
				</div>
			</div>
			<div class="row-input" role="row">
				<div class="w-30" role="separator">
					<label class="align-left"><fmt:message key="label.sexo"/></label>
					<select class="select-form" data-class="slSysSexo" id="slSexo_json_1" name="obj.sexo"></select>
					<netsis:validationMessage name="obj.sexo"/>
				</div>
				<div class="w-30" role="separator">
					<label class="align-left"><fmt:message key="label.estado.civil"/></label>
					<select class="select-form" data-class="slSysEstadoCivil" id="slEstado-civil_json_1" name="obj.estadocivil"></select>
					<netsis:validationMessage name="obj.estadocivil"/>
				</div>							
				<div class="w-40" role="separator">
					<label class="align-left"><fmt:message key="label.apelido"/></label>
					<input class="input-form full" maxlength="30" name="obj.apelido" pattern="letraNumeroEspaco" type="text" value="${obj.apelido}">
					<netsis:validationMessage name="obj.apelido"/>
				</div>
			</div>
			<div class="row-input" role="row">
				<div class="w-100" role="separator">
					<label class="align-left"><fmt:message key="label.inativo"/></label>
					<input <c:if test="${obj.inativo.equals('T')}">checked</c:if> name="obj.inativo" type="checkbox" value="T">
					<netsis:validationMessage name="obj.inativo"/>
				</div>
			</div>
			<div class="row-input">
				<div class="w-100">
					<label class="align-top"><fmt:message key="label.observacao"/></label>
					<textarea class="textarea-form" name="obj.observacao" pattern="[A-Z0-9\s]*" rows="5">${obj.observacao}</textarea>
				</div>
			</div>
			<c:if test="${obj.id != null}">
				<c:import url="tabs.jsp"/>
			</c:if>
		</section>
	</form>
</fieldset>
<%@include file="/config/footer.jsp"%>