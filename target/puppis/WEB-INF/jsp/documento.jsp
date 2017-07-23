<%@include file="/config/taglibraries.jsp"%>
<c:set var="autoFocus" value="${obj.id != null ? '' : 'autofocus'}"/>
<div class="l-row" role="row">
		<div class="u-grid--6" role="grid">
		<label class="o-form__text" for="cpfcnpj"><fmt:message key="label.cpf.cnpj"/><span class="o-form__feedback"></span><validate:validationMessage name="obj.documento.cnpj"/></label>
		<div class="o-form__iconed">
			<input aria-required="true" ${autoFocus} class="o-form__data has-validation" data-cnpj="cnpj" data-cpf="cpf" id="cpfcnpj" maxlength="18" name="obj.documento.cpfcnpj" onblur="checkDocument('CPFCNPJ', this);" onkeypress="checkMask(event);" onkeyup="mask(maskCpfCnpj, this, event);" pattern="cpfCnpj" required type="text" value="${obj.documento.cpfcnpj}">
			<span class="o-form__icon is-hide"><i class="icon-spin3"></i></span>
		</div>
	</div>
	<div class="u-grid--6" role="grid">
		<label class="o-form__text" for="inscricaoestadual"><fmt:message key="label.rg.inscricao.estadual"/><validate:validationMessage name="obj.documento.inscricaoestadual"/></label>
		<input aria-required="true" class="o-form__data has-validation" id="inscricaoestadual" maxlength="15" name="obj.documento.rginscricaoestadual" pattern="letraNumeroPontoTraco" required type="text" value="${obj.documento.rginscricaoestadual}">
	</div>
</div>