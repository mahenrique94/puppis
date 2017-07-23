<%@include file="/config/header.jsp"%>
<form action="<c:url value="/relatorio/processar"/>" class="o-form" id="formrelatorioextrato" method="post" name="formrelatorioextrato" target="_blank">
	<input name="parametrosWeb[0].parametroInicial" type="hidden" value="IREXTRATO">
	<input aria-hidden="true" name="parametrosWeb[1].parametroInicial" type="hidden" value="PDF">
	<nav class="o-navbar--gary" role="complementary">
		<div class="o-breadcrumb--arrow">
			<span class="o-breadcrumb__link"><a href="<c:url value="/dashboard"/>" role="link" title="<fmt:message key="nav.dashboard"/>"><fmt:message key="nav.dashboard"/></a></span>
			<span class="o-breadcrumb__link"><a href="<c:url value="/dashboard/financeiro"/>" role="link" title="<fmt:message key="nav.financeiro"/>"><fmt:message key="nav.financeiro"/></a></span>
			<span class="o-breadcrumb__link"><a href="<c:url value="/dashboard/relatorios/financeiro"/>" role="link" title="<fmt:message key="nav.financeiro.relatorios"/>"><fmt:message key="nav.financeiro.relatorios"/></a></span>
			<span class="o-breadcrumb__link"><a class="is-inactive" href="<c:url value="/relatorios/financeiro/extrato"/>" role="link" title="<fmt:message key="nav.financeiro.relatorios.extrato"/>"><fmt:message key="nav.financeiro.relatorios.extrato"/></a></span>
		</div>
	</nav>
	<section class="o-form__body o-form__body--padding">		  			
		<div class="l-row" role="row">
			<div class="u-grid--6" role="grid">
				<fieldset class="c-block--lube">
					<legend class="c-block__header"><label class="c-block__title"><fmt:message key="titulo.inicial"/></label></legend>
					<section class="c-block__body c-block__body--padding">
						<div class="l-row" role="row">
							<div class="u-grid--12" role="grid">
								<label class="o-form__text" for="datainicial"><fmt:message key="label.data"/></label>
								<input class="o-form__data has-validation" id="datainicial" max="31-12-2900" maxlength="10" min="01-01-1900" name="parametrosWeb[2].parametroInicial" onkeypress="checkMask(event);" onkeyup="mask(maskData, this, event);" pattern="data" type="text">
							</div>
						</div>
						<div class="l-row" role="row">
							<div class="u-grid--12" role="grid">
								<input aria-hidden="true" aria-required="true" class="o-mark__data--radio" id="tipo" name="parametrosWeb[3].parametroInicial" required type="hidden">
								<label class="o-mark__text" for="tipo">
									<span class="o-mark__element" data-marked="D" onclick="MarkController.mark(this);"></span>
									<fmt:message key="label.credito"/>
								</label>
								<label class="o-mark__text" for="regiao">
									<span class="o-mark__element" data-marked="C" onclick="MarkController.mark(this);"></span>
									<fmt:message key="label.debito"/>
								</label>
								<label class="o-mark__text" for="regiao">
									<span class="o-mark__element" data-marked="X" onclick="MarkController.mark(this);"></span>
									<fmt:message key="label.todos"/>
								</label>
							</div>
						</div>
					</section>
				</fieldset>
			</div>
			<div class="u-grid--6" role="grid">
				<fieldset class="c-block--lube">
					<legend class="c-block__header"><label class="c-block__title"><fmt:message key="titulo.final"/></label></legend>
					<section class="c-block__body c-block__body--padding">
						<div class="l-row" role="row">
							<div class="u-grid--12" role="grid">
								<label class="o-form__text" for="datafinal"><fmt:message key="label.data"/></label>
								<input class="o-form__data has-validation" id="datafinal" max="31-12-2900" maxlength="10" min="01-01-1900" name="parametrosWeb[2].parametroFinal" onkeypress="checkMask(event);" onkeyup="mask(maskData, this, event);" pattern="data" type="text">
							</div>
						</div>
					</section>
				</fieldset>
			</div>
		</div>
	</section>
	<menu class="o-toolbar--lube is-fixedBottomFull" role="menubar">
		<menuitem class="o-toolbar__item" role="menuitem"><button role="button" title="<fmt:message key="button.visualizar"/>" type="submit"><i class="icon-eye"></i>&nbsp;<fmt:message key="button.visualizar"/></button></menuitem>
	</menu> 
</form>
<%@include file="/config/footer.jsp"%>