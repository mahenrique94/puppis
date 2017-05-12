<%@include file="/config/taglibraries.jsp"%>
<c:set var="autoFocus" value="${obj.id != null ? '' : 'autofocus'}"/>
<section class="o-form__body o-form__body--padding">
	<div class="l-row" role="row">
		<div class="u-grid--12" role="grid">
			<label class="o-form__text" for="nome"><fmt:message key="label.nome"/><validate:validationMessage name="obj.nome"/></label>
			<input aria-required="true" ${autoFocus} class="o-form__data has-validation" id="nome" maxlength="60" name="obj.nome" pattern="espacoLetraNumero" required type="text" value="${obj.nome}">			
		</div>
	</div>
	<div class="l-row" role="row">
		<div class="u-grid--6" role="grid">
			<label class="o-form__text" for="usuario"><fmt:message key="label.usuario"/><validate:validationMessage name="obj.usuario"/></label>
			<input aria-required="true" class="o-form__data has-validation" id="usuario" maxlength="30" name="obj.usuario" pattern="letraNumero" required type="text" value="${obj.usuario}">
		</div>
		<div class="u-grid--6" role="grid">
			<label class="o-form__text" for="senha"><fmt:message key="label.senha"/><validate:validationMessage name="obj.senha"/></label>
			<div class="o-form__tooltip">
				<input aria-required="true" class="o-form__data has-validation" id="senha" maxlength="8" minlength="8" name="obj.senha" pattern="letraNumeroMin8Max8" required type="password" value="${obj.senha}">
				<span class="o-tooltip--gary"></span>
			</div>
		</div>
	</div>
	<div class="l-row" role="row">
		<div class="u-grid--6" role="grid">
			<label class="o-form__text" for="grupo"><fmt:message key="label.grupo"/><validate:validationMessage name="obj.idgrupo.id"/></label>
			<select aria-required="true" class="o-form__data has-validation" data-select="sl" data-url="slAdministrador_Usuario_Grupo_Json" id="grupo" name="obj.idgrupo.id" required></select>
		</div>
		<div class="u-grid--6" role="grid">
				<label class="o-form__text" for="tipoacesso"><fmt:message key="label.tipo.acesso"/><validate:validationMessage name="obj.idtipoacesso.id"/></label>
				<select aria-required="true" class="o-form__data has-validation" data-select="slAdmTipoAcesso" data-url="slAdministrador_Usuario_Tipo-de-acesso_Json" id="tipoacesso" name="obj.idtipoacesso.id" required></select>
			</div>
	</div>
	<div class="l-row" role="row">
		<div class="u-grid--12" role="grid">
			<label class="o-form__text" for="inativo"><fmt:message key="label.inativo"/></label>
			<input <c:if test="${obj.inativo == true}">checked</c:if> class="o-mark__data--checkbox" id="inativo" name="obj.inativo" type="hidden" value="${obj.inativo}">
			<label class="o-mark__text"><span class="o-mark__element" data-marked="true" data-unmarked="false" onclick="MarkController.mark(this);"></span></label>
		</div>
	</div>
</section>