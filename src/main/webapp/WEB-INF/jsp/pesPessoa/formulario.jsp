<%@include file="/config/header.jsp" %>
<div class="container-tie">
	<form action="<c:url value="/pessoa"/>" class="form-block" id="formpespessoa" method="post" name="formpespessoa" role="form">
		<input type="hidden" name="obj.idestadocivil.idaux" value="${obj.idestadocivil.id}">
		<input type="hidden" name="obj.idsexo.idaux" value="${obj.idsexo.id}">
		<input type="hidden" name="obj.idtipo.idaux" value="${obj.idtipo.id}">
		<div class="container-header">
			<div class="row">
				<div class="col-xs-12-last col-sm-12-last col-md-12-last col-lg-12-last">
					<h2><fmt:message key="nav.cadastro"/>&nbsp;<fmt:message key="label.barra"/>&nbsp;<fmt:message key="nav.cadastro.pessoa"/></h2>
				</div>
				<div class="col-xs-12-last col-sm-12-last col-md-12 col-lg-12">
					<button class="btn-md float-left m-right-5" title="<fmt:message key="button.salvar"/>" type="submit"><span class="icon-floppy-disk"></span>&nbsp;<fmt:message key="button.salvar"/></button>
					<a href="<c:url value="/pessoa"/>" class="btn-md float-left m-right-5" title="<fmt:message key="button.pesquisar"/>"><span class="icon-search"></span>&nbsp;<fmt:message key="button.pesquisar"/></a>
				</div>
			</div>
		</div>
		<section aria-expanded="true" aria-hidden="false" class="clearfix" role="form">
			<div class="row" role="row">
				<div class="col-xs-12-last col-sm-12-last col-md-12-last col-lg-12-last" role="separator">
					<label><fmt:message key="label.tipo"/></label>
					<select class="select-form" data-class="slPesTipo" id="slPessoa_Tipo_json_01" name="obj.idtipo.id"></select>
					<netsis:validationMessage name="obj.tipo.id"/>
				</div>
			</div>
			<div class="row" role="row">
				<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6" role="separator">
					<label><fmt:message key="label.id"/></label>
					<input class="input-form" name="obj.id" readonly type="number" value="${obj.id}">
					<netsis:validationMessage name="obj.id"/>
				</div>							
				<div class="col-xs-6-last col-sm-6-last col-md-6-last col-lg-6-last" role="separator">
					<label><fmt:message key="label.data.create"/></label>
					<input class="input-form" maxlength="10" readonly type="text" value="<fmt:formatDate pattern="dd/MM/yyyy" value="${obj.datacreate.time}" type="date"/>"/>
					<netsis:validationMessage name="obj.datacreate"/>
				</div>							
			</div>
			<div class="row" role="row">
				<div class="col-xs-12-last col-sm-12-last col-md-12-last col-lg-12-last" role="separator">
					<label><fmt:message key="label.nome.razao.social"/></label>
					<input autofocus class="input-form" maxlength="60" name="obj.nomerazaosocial" pattern="letraNumeroEspacoPonto" required type="text" value="${obj.nomerazaosocial}">
					<netsis:validationMessage name="obj.nomerazaosocial"/>
				</div>
			</div>
			<div class="row" role="row">
				<div class="col-xs-12-last col-sm-12-last col-md-12-last col-lg-12-last" role="separator">
					<label><fmt:message key="label.nome.fantasia"/></label>
					<input class="input-form" maxlength="60" name="obj.nomefantasia" pattern="letraNumeroEspacoPonto" type="text" value="${obj.nomefantasia}">
					<netsis:validationMessage name="obj.nomefantasia"/>
				</div>
			</div>
			<div class="row" role="row">
				<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4" role="separator">
					<label><fmt:message key="label.sexo"/></label>
					<select class="select-form" data-class="slPesSexo" id="slPessoa_Sexo_json_01" name="obj.idsexo.id"></select>
					<netsis:validationMessage name="obj.idsexo.id"/>
				</div>
				<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4" role="separator">
					<label><fmt:message key="label.estado.civil"/></label>
					<select class="select-form" data-class="slPesEstadoCivil" id="slPessoa_Estado-civil_json_01" name="obj.idestadocivil.id"></select>
					<netsis:validationMessage name="obj.idestadocivil.id"/>
				</div>							
				<div class="col-xs-4-last col-sm-4-last col-md-4-last col-lg-4-last" role="separator">
					<label><fmt:message key="label.apelido"/></label>
					<input class="input-form" maxlength="30" name="obj.apelido" pattern="letraNumeroEspaco" type="text" value="${obj.apelido}">
					<netsis:validationMessage name="obj.apelido"/>
				</div>
			</div>
			<div class="row" role="row">
				<div class="col-xs-12-last col-sm-12-last col-md-12-last col-lg-12-last" role="separator">
					<label><fmt:message key="label.inativo"/></label>
					<input <c:if test="${obj.inativo == true}">checked</c:if> name="obj.inativo" type="checkbox" value="true">
					<netsis:validationMessage name="obj.inativo"/>
				</div>
			</div>
			<div class="row">
				<div class="col-xs-12-last col-sm-12-last col-md-12-last col-lg-12-last">
					<label><fmt:message key="label.observacao"/></label>
					<textarea class="textarea-form" name="obj.observacao" pattern="textarea" rows="5">${obj.observacao}</textarea>
				</div>
			</div>
			<c:if test="${obj.id != null}">
				<c:import url="tabs.jsp"/>
			</c:if>
		</section>
	</form>
</div>
<%@include file="/config/footer.jsp"%>