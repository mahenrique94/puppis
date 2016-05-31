<%@include file="/config/taglibraries.jsp"%>
<input name="obj.idestadocivil.idaux" type="hidden" value="${obj.idestadocivil.id}">
<input name="obj.idsexo.idaux" type="hidden" value="${obj.idsexo.id}">
<section aria-expanded="true" aria-hidden="false" class="form-body" role="form">
	<div class="row" role="row">
		<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6" role="separator">
			<label><fmt:message key="label.id"/></label>
			<input class="form-data validate" name="obj.id" readonly type="number" value="${obj.id}">
			<netsis:validationMessage name="obj.id"/>
		</div>							
		<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6" role="separator">
			<label><fmt:message key="label.data.create"/></label>
			<input class="form-data validate" maxlength="10" readonly type="text" value="<fmt:formatDate pattern="dd/MM/yyyy" value="${obj.datacreate.time}" type="date"/>"/>
			<netsis:validationMessage name="obj.datacreate"/>
		</div>							
	</div>
	<div class="row" role="row">
		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" role="separator">
			<label><fmt:message key="label.nome.razao.social"/></label>
			<input autofocus class="form-data validate" maxlength="60" name="obj.nomerazaosocial" pattern="letraNumeroEspacoPonto" required type="text" value="${obj.nomerazaosocial}">
			<netsis:validationMessage name="obj.nomerazaosocial"/>
		</div>
	</div>
	<div class="row" role="row">
		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" role="separator">
			<label><fmt:message key="label.nome.fantasia"/></label>
			<input class="form-data validate" maxlength="60" name="obj.nomefantasia" pattern="letraNumeroEspacoPonto" type="text" value="${obj.nomefantasia}">
			<netsis:validationMessage name="obj.nomefantasia"/>
		</div>
	</div>
	<div class="row" role="row">
		<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4" role="separator">
			<label><fmt:message key="label.sexo"/></label>
			<select class="form-data validate" data-class="slPesSexo" id="slPessoa_Sexo_json_01" name="obj.idsexo.id"></select>
			<netsis:validationMessage name="obj.idsexo.id"/>
		</div>
		<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4" role="separator">
			<label><fmt:message key="label.estado.civil"/></label>
			<select class="form-data validate" data-class="slPesEstadoCivil" id="slPessoa_Estado-civil_json_01" name="obj.idestadocivil.id"></select>
			<netsis:validationMessage name="obj.idestadocivil.id"/>
		</div>							
		<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4" role="separator">
			<label><fmt:message key="label.apelido"/></label>
			<input class="form-data validate" maxlength="30" name="obj.apelido" pattern="letraNumeroEspaco" type="text" value="${obj.apelido}">
			<netsis:validationMessage name="obj.apelido"/>
		</div>
	</div>
	<div class="row" role="row">
		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" role="separator">
			<label><fmt:message key="label.inativo"/></label>
			<input class="form-data" <c:if test="${obj.inativo == true}">checked</c:if> name="obj.inativo" type="checkbox" value="true">
			<netsis:validationMessage name="obj.inativo"/>
		</div>
	</div>
	<c:import url="../pesDocumento/documento.jsp"/>
	<c:import url="../pesEndereco/endereco.jsp"/>
	<div class="row" role="row">
		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" role="separator">
			<label><fmt:message key="label.observacao"/></label>
			<textarea class="form-data validate" name="obj.observacao" pattern="textarea" rows="10">${obj.observacao}</textarea>
		</div>
	</div>
</section>