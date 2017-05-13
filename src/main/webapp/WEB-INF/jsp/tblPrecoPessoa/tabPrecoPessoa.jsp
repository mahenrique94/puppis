<%@include file="/config/taglibraries.jsp" %>
<c:set var="autoFocus" value="${obj.id != null ? '' : 'autofocus'}"/>
<section class="o-form__body o-form__body--padding">
	<div class="l-row" role="row">
		<div class="u-grid-" role="grid">
			<label class="o-form__text" for="pessoa"><fmt:message key="label.pessoa"/><validate:validationMessage name="obj.iddefinicao.id"/></label>
			<select aria-required="true" ${autoFocus} class="o-form__data has-validation" data-select="slPesDefinicao" data-url="slPessoa_Definicao_Json" id="pessoa" name="obj.iddefinicao.id" required></select>
		</div>
	</div>
</section>