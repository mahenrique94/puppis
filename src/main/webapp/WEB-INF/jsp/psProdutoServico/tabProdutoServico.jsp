<%@include file="/config/taglibraries.jsp"%>
<c:set var="autoFocus" value="${obj.id != null ? '' : 'autofocus'}"/>
<section class="o-form__body o-form__body--padding">
	<div class="l-row" role="row">
		<div class="u-grid--6" role="grid">
			<label class="o-form__text" for="grupoclasse"><fmt:message key="label.grupo.classe"/><validate:validationMessage name="obj.idclasse.id"/></label>
			<select aria-required="true" ${autoFocus} class="o-form__data has-validation" data-select="slPsGrupoClasse" data-url="slProduto-Servico_Classe_Json" id="grupoclasse" name="obj.idclasse.id" required></select>
		</div>
		<div class="u-grid--3" role="grid">
			<label class="o-form__text" for="id"><fmt:message key="label.id"/><validate:validationMessage name="obj.id"/></label>
			<input aria-readonly="true" aria-required="true" class="o-form__data has-validation" id="id" maxlength="10" name="obj.id" pattern="number0to9" readonly required step="1" type="number" value="${obj.id}">
		</div>
		<div class="u-grid--3" role="grid">
			<label class="o-form__text" for="tipo"><fmt:message key="label.tipo"/><validate:validationMessage name="obj.id"/></label>
			<select aria-required="true" class="o-form__data has-validation" data-select="slPsTipo" data-url="slProduto-servico_tipo_Json" id="tipo" name="obj.idtipo.id" required></select>
		</div>
	</div>
	<div class="l-row" role="row">
		<div class="u-grid--10" role="grid">
			<label class="o-form__text" for="descricao"><fmt:message key="label.descricao"/><validate:validationMessage name="obj.descricao"/></label>
			<input aria-required="true" class="o-form__data has-validation" id="descricao" maxlength="120" name="obj.descricao" pattern="espacoLetraNumero" required type="text" value="${obj.descricao}">
			
		</div>
		<div class="u-grid--2" role="grid">
			<label class="o-form__text" for="unidademedida"><fmt:message key="label.unidade.medida"/><validate:validationMessage name="obj.idunidademedida.id"/></label>
			<select aria-required="true" class="o-form__data has-validation" data-select="slPsUnidadeMedida" data-url="slProduto-Servico_Unidade-de-medida_Json" id="unidademedida" name="obj.idunidademedida.id" required></select>
		</div>
	</div>
	<div class="l-row" role="row">
		<div class="u-grid--5" role="grid">
			<label class="o-form__text" for="marca"><fmt:message key="label.marca"/><validate:validationMessage name="obj.marca"/></label>
			<input class="o-form__data has-validation" id="marca" maxlength="30" name="obj.marca" pattern="espacoLetraNumero" type="text" value="${obj.marca}">
		</div>
		<div class="u-grid--5" role="grid">
			<label class="o-form__text" for="codigobarra"><fmt:message key="label.codigo.barra"/><validate:validationMessage name="obj.codigobarra"/></label>
			<input class="o-form__data has-validation" id="codigobarra" maxlength="120" name="obj.codigobarra" pattern="letraNumero" type="text" value="${obj.codigobarra}">
		</div>
		<div class="u-grid--2" role="grid">
			<label class="o-form__text" for="aceitadesconto"><fmt:message key="label.aceita.desconto"/><validate:validationMessage name="obj.aceitadesconto"/></label>
			<input <c:if test="${obj.aceitadesconto == true}">checked</c:if> class="o-mark__data--checkbox" id="inativo" name="obj.aceitadesconto" type="hidden" value="${obj.aceitadesconto}">
			<label class="o-mark__text"><span class="o-mark__element" data-marked="true" data-unmarked="false" onclick="MarkController.mark(this);"></span></label>
		</div>
	</div>
	<div class="l-row" role="row">
		<div class="u-grid--12" role="grid">
			<label class="o-form__text" for="inativo"><fmt:message key="label.inativo"/><validate:validationMessage name="obj.inativo"/></label>
			<input <c:if test="${obj.inativo == true}">checked</c:if> class="o-mark__data--checkbox" id="inativo" name="obj.inativo" type="hidden" value="${obj.inativo}">
			<label class="o-mark__text"><span class="o-mark__element" data-marked="true" data-unmarked="false" onclick="MarkController.mark(this);"></span></label>
		</div>
	</div>
	<div class="l-row" role="row">
		<div class="u-grid--12" role="grid">
			<label class="o-form__text" for="observacao"><fmt:message key="label.observacao"/><validate:validationMessage name="obj.observacao"/></label>
			<textarea class="o-form__data has-validation" id="observacao" name="obj.observacao" pattern="textarea">${obj.observacao}</textarea>
		</div>
	</div>
</section>