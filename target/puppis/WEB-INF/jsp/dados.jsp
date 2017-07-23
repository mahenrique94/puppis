<%@include file="/config/taglibraries.jsp"%>
<div class="l-row" role="row">
	<div class="u-grid--6" role="grid">
		<label class="o-form__text" for="nomerazaosocial"><fmt:message key="label.nome.razao.social"/><validate:validationMessage name="obj.nomerazaosocial"/></label>
		<input aria-required="true" class="o-form__data has-validation" data-cnpj="nomerazaosocial" id="nomerazaosocial" maxlength="60" name="obj.nomerazaosocial" pattern="espacoLetraNumeroBarraPontoTraco" required type="text" value="${obj.nomerazaosocial}">
	</div>
	<div class="u-grid--6" role="grid">
		<label class="o-form__text" for="nomefantasia"><fmt:message key="label.nome.fantasia"/><validate:validationMessage name="obj.nomefantasia"/></label>
		<input class="o-form__data has-validation" id="nomefantasia" data-cnpj="nomefantasia" maxlength="60" name="obj.nomefantasia" pattern="espacoLetraNumeroBarraPontoTraco" type="text" value="${obj.nomefantasia}">
	</div>
</div>