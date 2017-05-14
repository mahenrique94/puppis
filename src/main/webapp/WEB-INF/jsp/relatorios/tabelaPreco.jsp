<%@include file="/config/header.jsp"%>
<form action="<c:url value="/relatorio/processar"/>" class="o-form" id="formrelatoriotabelapreco" method="post" name="formrelatoriotabelapreco" target="_blank">
	<input name="parametrosWeb[0].parametroInicial" type="hidden" value="IRTABELAPRECO">
	<input aria-hidden="true" name="parametrosWeb[1].parametroInicial" type="hidden" value="PDF">
	<nav class="o-navbar--gary" role="complementary">
		<div class="o-breadcrumb--arrow">
			<span class="o-breadcrumb__link"><a href="<c:url value="/dashboard"/>" role="link" title="<fmt:message key="nav.dashboard"/>"><fmt:message key="nav.dashboard"/></a></span>
			<span class="o-breadcrumb__link"><a href="<c:url value="/dashboard/cadastro"/>" role="link" title="<fmt:message key="nav.cadastro"/>"><fmt:message key="nav.cadastro"/></a></span>
			<span class="o-breadcrumb__link"><a href="<c:url value="/dashboard/cadastro/relatorios"/>" role="link" title="<fmt:message key="nav.cadastro.relatorios"/>"><fmt:message key="nav.cadastro.relatorios"/></a></span>
			<span class="o-breadcrumb__link"><a class="is-inactive" href="<c:url value="/relatorios/tabela/preco"/>" role="link" title="<fmt:message key="nav.cadastro.relatorios.tabela.preco"/>"><fmt:message key="nav.cadastro.relatorios.tabela.preco"/></a></span>
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
								<label class="o-form__text" for="idprodutoservicoinicial"><fmt:message key="label.id.produto.servico"/></label>
								<div class="o-form__group">
									<input class="o-form__data has-validation" data-search="produtoservicoinicial" data-target="psprodutoservico.id" id="idprodutoservicoinicial" min="0" name="parametrosWeb[2].parametroInicial" pattern="number0to9" step="1" type="number">
									<span class="o-form__groupElement"><a class="o-button--lube" href="<c:url value="/produto-servico/listarsl?search=produtoservicoinicial"/>" onclick="ModalController.show(this, event);" role="link" title="<fmt:message key="button.pesquisar"/>"><i class="icon-search"></i></a></span>
								</div>
							</div>
						</div>
						<div class="l-row" role="row">
							<div class="u-grid--12" role="grid">
								<label class="o-form__text" for="idpessoainicial"><fmt:message key="label.id.pessoa"/></label>
								<div class="o-form__group">
									<input class="o-form__data has-validation" data-search="pessoainicial" data-target="pespessoa.id" id="idpessoainicial" min="0" name="parametrosWeb[3].parametroInicial" pattern="number0to9" step="1" type="number">
									<span class="o-form__groupElement"><a class="o-button--lube" href="<c:url value="/pessoa/listarsl?search=pessoainicial"/>" onclick="ModalController.show(this, event);" role="link" title="<fmt:message key="button.pesquisar"/>"><i class="icon-search"></i></a></span>
								</div>
							</div>
						</div>
						<div class="l-row" role="row">
							<div class="u-grid--12" role="grid">
								<label class="o-form__text" for="datacadastroinicial"><fmt:message key="label.data.cadastro"/></label>
								<input class="o-form__data has-validation" id="datacadastroinicial" max="31-12-2900" maxlength="10" min="01-01-1900" name="parametrosWeb[4].parametroInicial" onkeypress="checkMask(event);" onkeyup="mask(maskData, this, event);" pattern="data" placeholder="<fmt:message key="placeholder.data"/>" type="text">
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
								<label class="o-form__text" for="idprodutoservicofinal"><fmt:message key="label.id.produto.servico"/></label>
								<div class="o-form__group">
									<input class="o-form__data has-validation" data-search="produtoservicofinal" data-target="psprodutoservico.id" id="idprodutoservicofinal" min="0" name="parametrosWeb[2].parametroFinal" pattern="number0to9" step="1" type="number">
									<span class="o-form__groupElement"><a class="o-button--lube" href="<c:url value="/produto-servico/listarsl?search=produtoservicofinal"/>" onclick="ModalController.show(this, event);" role="link" title="<fmt:message key="button.pesquisar"/>"><i class="icon-search"></i></a></span>
								</div>
							</div>
						</div>
						<div class="l-row" role="row">
							<div class="u-grid--12" role="grid">
								<label class="o-form__text" for="idpessoafinal"><fmt:message key="label.id.pessoa"/></label>
								<div class="o-form__group">
									<input class="o-form__data has-validation" data-search="pessoafinal" data-target="pespessoa.id" id="idpessoafinal" min="0" name="parametrosWeb[3].parametroFinal" pattern="number0to9" step="1" type="number">
									<span class="o-form__groupElement"><a class="o-button--lube" href="<c:url value="/pessoa/listarsl?search=pessoafinal"/>" onclick="ModalController.show(this, event);" role="link" title="<fmt:message key="button.pesquisar"/>"><i class="icon-search"></i></a></span>
								</div>
							</div>
						</div>
						<div class="l-row" role="row">
							<div class="u-grid--12" role="grid">
								<label class="o-form__text" for="datacadastrofinal"><fmt:message key="label.data.cadastro"/></label>
								<input class="o-form__data has-validation" id="datacadastrofinal" max="31-12-2900" maxlength="10" min="01-01-1900" name="parametrosWeb[4].parametroFinal" onkeypress="checkMask(event);" onkeyup="mask(maskData, this, event);" pattern="data" placeholder="<fmt:message key="placeholder.data"/>" type="text">
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