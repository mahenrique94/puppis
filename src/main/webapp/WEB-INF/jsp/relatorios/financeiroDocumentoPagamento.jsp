<%@include file="/config/header.jsp"%>
<form action="<c:url value="/relatorio/processar"/>" class="o-form" id="formrelatoriodocumentopagamento" method="post" name="formrelatoriodocumentopagamento" target="_blank">
	<input name="parametrosWeb[0].parametroInicial" type="hidden" value="IRFINDOCPAGAMENTO">
	<input aria-hidden="true" name="parametrosWeb[1].parametroInicial" type="hidden" value="PDF">
	<nav class="o-navbar--gary" role="complementary">
		<div class="o-breadcrumb--arrow">
			<span class="o-breadcrumb__link"><a href="<c:url value="/dashboard"/>" role="link" title="<fmt:message key="nav.dashboard"/>"><fmt:message key="nav.dashboard"/></a></span>
			<span class="o-breadcrumb__link"><a href="<c:url value="/dashboard/financeiro"/>" role="link" title="<fmt:message key="nav.financeiro"/>"><fmt:message key="nav.financeiro"/></a></span>
			<span class="o-breadcrumb__link"><a href="<c:url value="/dashboard/relatorios/financeiro"/>" role="link" title="<fmt:message key="nav.financeiro.relatorios"/>"><fmt:message key="nav.financeiro.relatorios"/></a></span>
			<span class="o-breadcrumb__link"><a class="is-inactive" href="<c:url value="/relatorios/financeiro/documento/pagamento"/>" role="link" title="<fmt:message key="nav.financeiro.relatorios.documento.pagamento"/>"><fmt:message key="nav.financeiro.relatorios.documento.pagamento"/></a></span>
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
								<label class="o-form__text" for="formapagamentoinicial"><fmt:message key="label.id.forma.pagamento"/></label>
								<div class="o-form__group">
									<input class="o-form__data has-validation" data-search="formapagamentoinicial" data-target="finformapagamento.id" id="formapagamentoinicial" min="0" name="parametrosWeb[2].parametroInicial" pattern="number0to9" step="1" type="number">
									<span class="o-form__groupElement"><a class="o-button--lube" href="<c:url value="/financeiro/forma-de-pagamento/listarsl?search=formapagamentoinicial"/>" onclick="ModalController.show(this, event);" role="link" title="<fmt:message key="button.pesquisar"/>"><i class="icon-search"></i></a></span>
								</div>
							</div>
						</div>
						<div class="l-row" role="row">
							<div class="u-grid--12" role="grid">
								<label class="o-form__text" for="dataemissaoinicial"><fmt:message key="label.data.emissao"/></label>
								<input class="o-form__data has-validation" id="dataemissaoinicial" max="31-12-2900" maxlength="10" min="01-01-1900" name="parametrosWeb[3].parametroInicial" onkeypress="checkMask(event);" onkeyup="mask(maskData, this, event);" pattern="data" type="text">
							</div>
						</div>
						<div class="l-row" role="row">
							<div class="u-grid--12" role="grid">
								<label class="o-form__text" for="datapagamentoinicial"><fmt:message key="label.data.pagamento"/></label>
								<input class="o-form__data has-validation" id="datapagamentoinicial" max="31-12-2900" maxlength="10" min="01-01-1900" name="parametrosWeb[4].parametroInicial" onkeypress="checkMask(event);" onkeyup="mask(maskData, this, event);" pattern="data" type="text">
							</div>
						</div>
						<div class="l-row" role="row">
							<div class="u-grid--12" role="grid">
								<label class="o-form__text" for="datavencimentoinicial"><fmt:message key="label.data.vencimento"/></label>
								<input class="o-form__data has-validation" id="datavencimentoinicial" max="31-12-2900" maxlength="10" min="01-01-1900" name="parametrosWeb[5].parametroInicial" onkeypress="checkMask(event);" onkeyup="mask(maskData, this, event);" pattern="data" type="text">
							</div>
						</div>
						<div class="l-row" role="row">
							<div class="u-grid--12" role="grid">
								<label class="o-form__text" for="baixado"><fmt:message key="label.baixado"/></label>
								<input class="o-mark__data--checkbox" id="baixado" name="parametrosWeb[6].parametroInicial" type="hidden" value="${parametrosWeb[6].parametroInicial}">
								<label class="o-mark__text"><span class="o-mark__element" data-marked="true" data-unmarked="false" onclick="MarkController.mark(this);"></span></label>
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
								<label class="o-form__text" for="formapagamentofinal"><fmt:message key="label.id.forma.pagamento"/></label>
								<div class="o-form__group">
									<input class="o-form__data has-validation" data-search="formapagamentofinal" data-target="finformapagamento.id" id="formapagamentofinal" min="0" name="parametrosWeb[2].parametroFinal" pattern="number0to9" step="1" type="number">
									<span class="o-form__groupElement"><a class="o-button--lube" href="<c:url value="/financeiro/forma-de-pagamento/listarsl?search=formapagamentofinal"/>" onclick="ModalController.show(this, event);" role="link" title="<fmt:message key="button.pesquisar"/>"><i class="icon-search"></i></a></span>
								</div>
							</div>
						</div>
						<div class="l-row" role="row">
							<div class="u-grid--12" role="grid">
								<label class="o-form__text" for="dataemissaofinal"><fmt:message key="label.data.emissao"/></label>
								<input class="o-form__data has-validation" id="dataemissaofinal" max="31-12-2900" maxlength="10" min="01-01-1900" name="parametrosWeb[3].parametroFinal" onkeypress="checkMask(event);" onkeyup="mask(maskData, this, event);" pattern="data" type="text">
							</div>
						</div>
						<div class="l-row" role="row">
							<div class="u-grid--12" role="grid">
								<label class="o-form__text" for="datapagamentofinal"><fmt:message key="label.data.pagamento"/></label>
								<input class="o-form__data has-validation" id="datapagamentofinal" max="31-12-2900" maxlength="10" min="01-01-1900" name="parametrosWeb[4].parametroFinal" onkeypress="checkMask(event);" onkeyup="mask(maskData, this, event);" pattern="data" type="text">
							</div>
						</div>
						<div class="l-row" role="row">
							<div class="u-grid--12" role="grid">
								<label class="o-form__text" for="datavencimentofinal"><fmt:message key="label.data.vencimento"/></label>
								<input class="o-form__data has-validation" id="datavencimentofinal" max="31-12-2900" maxlength="10" min="01-01-1900" name="parametrosWeb[5].parametroFinal" onkeypress="checkMask(event);" onkeyup="mask(maskData, this, event);" pattern="data" type="text">
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