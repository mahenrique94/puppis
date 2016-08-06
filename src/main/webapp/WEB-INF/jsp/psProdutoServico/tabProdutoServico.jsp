<%@include file="/config/taglibraries.jsp"%>
<input name="obj.idtipo.idaux" type="hidden" value="${obj.idtipo.id}">
<input name="obj.idunidademedida.idaux" type="hidden" value="${obj.idunidademedida.id}">
<input name="obj.idclasse.idaux" type="hidden" value="${obj.idclasse.id}">
<section aria-expanded="true" aria-hidden="false" class="form-body" role="form">
	<div class="row" role="row">
		<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6" role="separator">
			<label><fmt:message key="label.grupo.classe"/></label>
			<select autofocus class="form-data ss validate" data-class="slPsClasse" id="slProduto-Servico_Classe_Json_01" name="obj.idclasse.id"></select>
			<netsis:validationMessage name="obj.idclasse.id"/>
		</div>
		<div class="col-xs-3 col-sm-3 col-md-3 col-lg-3" role="separator">
			<label><fmt:message key="label.id"/></label>
			<input class="form-data validate" maxlength="10" name="obj.id" pattern="numero0a9" readonly required type="number" value="${obj.id}">
			<netsis:validationMessage name="obj.id"/>
		</div>
		<div class="col-xs-3 col-sm-3 col-md-3 col-lg-3" role="separator">
			<label><fmt:message key="label.tipo"/></label>
			<select class="form-data validate" data-class="slPsTipo" id="slProduto-servico_tipo_json_1" name="obj.idtipo.id"></select>
			<netsis:validationMessage name="obj.id"/>
		</div>
	</div>
	<div class="row" role="row">
		<div class="col-xs-10 col-sm-10 col-md-10 col-lg-10" role="separator">
			<label><fmt:message key="label.descricao"/></label>
			 <input class="form-data validate" maxlength="120" name="obj.descricao" pattern="letraNumeroEspaco" required type="text" value="${obj.descricao}">
			<netsis:validationMessage name="obj.descricao"/>
		</div>
		<div class="col-xs-2 col-sm-2 col-md-2 col-lg-2" role="separator">
			<label><fmt:message key="label.unidade.medida"/></label>
			 <select class="form-data validate" data-class="slPsUnidadeMedida" id="slProduto-Servico_Unidade-de-medida_json_1" name="obj.idunidademedida.id"></select>
			<netsis:validationMessage name="obj.idunidademedida.id"/>
		</div>
	</div>
	<div class="row" role="row">
		<div class="col-xs-5 col-sm-5 col-md-5 col-lg-5" role="separator">
			<label><fmt:message key="label.marca"/></label>
			 <input class="form-data validate" maxlength="30" name="obj.marca" pattern="letraNumeroEspaco" type="text" value="${obj.marca}">
			<netsis:validationMessage name="obj.marca"/>
		</div>
		<div class="col-xs-5 col-sm-5 col-md-5 col-lg-5" role="separator">
			<label><fmt:message key="label.codigo.barra"/></label>
			 <input class="form-data validate" maxlength="120" name="obj.codigobarra" pattern="letraNumero" type="text" value="${obj.codigobarra}">
			<netsis:validationMessage name="obj.codigobarra"/>
		</div>
		<div class="col-xs-2 col-sm-2 col-md-2 col-lg-2" role="separator">
			<label><fmt:message key="label.aceita.desconto"/></label>
			<input <c:if test="${obj.aceitadesconto == true}">checked</c:if> class="form-data" name="obj.aceitadesconto" type="checkbox" value="true">
			<netsis:validationMessage name="obj.aceitadesconto"/>
		</div>
	</div>
	<div class="row" role="row">
		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" role="separator">
			<label><fmt:message key="label.inativo"/></label>
			 <input <c:if test="${obj.inativo == true}">checked</c:if> class="form-data" name="obj.inativo" type="checkbox" value="true">
			<netsis:validationMessage name="obj.inativo"/>
		</div>
	</div>
	<div class="row" role="row">
		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" role="separator">
			<label><fmt:message key="label.observacao"/></label>
			<textarea class="form-data validate" name="obj.observacao" pattern="textarea" rows="10">${obj.observacao}</textarea>
			<netsis:validationMessage name="obj.observacao"/>
		</div>
	</div>
</section>