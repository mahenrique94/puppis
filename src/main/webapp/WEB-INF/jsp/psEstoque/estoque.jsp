<%@include file="/config/taglibraries.jsp"%>
<section class="o-form__body o-form__body--padding">
	<div class="l-row" role="row">
		<div class="u-grid--6" role="grid">
			<label class="o-form__text" for="quantidademin"><fmt:message key="label.quantidade.min"/><validate:validationMessage name="obj.estoque.quantidademin"/></label>
			<input class="o-form__data has-validation" id="quantidademin" maxlength="13" name="obj.estoque.quantidademin" pattern="numeric10-2" type="text" value="<fmt:formatNumber pattern="0.00" type="currency" value="${obj.estoque.quantidademin}"/>"/>
		</div>
		<div class="u-grid--6" role="grid">
			<label class="o-form__text" for="quantidademax"><fmt:message key="label.quantidade.max"/><validate:validationMessage name="obj.estoque.quantidademax"/></label>
			<input class="o-form__data has-validation" id="quantidademax" maxlength="13" name="obj.estoque.quantidademax" pattern="numeric10-2" type="text" value="<fmt:formatNumber pattern="0.00" type="currency" value="${obj.estoque.quantidademax}"/>"/>
		</div>
	</div>
	<div class="l-row" role="row">
		<div class="u-grid--12" role="grid">
			<label class="o-form__text" for="quantidadeestoque"><fmt:message key="label.quantidade.estoque"/><validate:validationMessage name="obj.estoque.quantidade"/></label>
			<input aria-readonly="true" aria-required="true" class="o-form__data has-validation" id="quantidadeestoque" maxlength="13" name="obj.estoque.quantidade" pattern="numeric10-2" readonly required type="text" value="<fmt:formatNumber pattern="0.00" type="currency" value="${obj.estoque.quantidade}"/>"/>
		</div>
	</div>
</section>