<%@include file="/config/header.jsp"%>
<form action="<c:url value="/relatorio/processar"/>" class="o-form" id="formrelatorioprodutoservicoclasse" method="post" name="formrelatorioprodutoservicoclasse" target="_blank">
	<input name="parametrosWeb[0].parametroInicial" type="hidden" value="IRPRODCLASSE">
	<input aria-hidden="true" name="parametrosWeb[1].parametroInicial" type="hidden" value="PDF">
	<nav class="o-navbar--gary" role="complementary">
		<div class="o-breadcrumb--arrow">
			<span class="o-breadcrumb__link"><a href="<c:url value="/dashboard"/>" role="link" title="<fmt:message key="nav.dashboard"/>"><fmt:message key="nav.dashboard"/></a></span>
			<span class="o-breadcrumb__link"><a href="<c:url value="/dashboard/cadastro"/>" role="link" title="<fmt:message key="nav.cadastro"/>"><fmt:message key="nav.cadastro"/></a></span>
			<span class="o-breadcrumb__link"><a href="<c:url value="/dashboard/cadastro/relatorios"/>" role="link" title="<fmt:message key="nav.cadastro.relatorios"/>"><fmt:message key="nav.cadastro.relatorios"/></a></span>
			<span class="o-breadcrumb__link"><a class="is-inactive" href="<c:url value="/relatorios/produto/classe"/>" role="link" title="<fmt:message key="nav.cadastro.relatorios.produto.servico.classe"/>"><fmt:message key="nav.cadastro.relatorios.produto.servico.classe"/></a></span>
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
								<label class="o-form__text" for="idinicial"><fmt:message key="label.id"/></label>
								<div class="o-form__group">
									<input class="o-form__data has-validation" data-search="classeinicial" data-target="psclasse.id" id="idinicial" min="0" name="parametrosWeb[2].parametroInicial" pattern="number0to9" step="1" type="number">
									<span class="o-form__groupElement"><a class="o-button--lube" href="<c:url value="/produto-servico/classe/listarsl?search=classeinicial"/>" onclick="ModalController.show(this, event);" role="link" title="<fmt:message key="button.pesquisar"/>"><i class="icon-search"></i></a></span>
								</div>
							</div>
						</div>
						<div class="l-row" role="row">
							<div class="u-grid--12" role="grid">
								<label class="o-form__text" for="datacadastroinicial"><fmt:message key="label.data.cadastro"/></label>
								<input class="o-form__data has-validation" id="datacadastroinicial" max="31-12-2900" maxlength="10" min="01-01-1900" name="parametrosWeb[3].parametroInicial" onkeypress="checkMask(event);" onkeyup="mask(maskData, this, event);" pattern="data" placeholder="<fmt:message key="placeholder.data"/>" type="text">
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
								<label class="o-form__text" for="idfinal"><fmt:message key="label.id"/></label>
								<div class="o-form__group">
									<input class="o-form__data has-validation" data-search="classefinal" data-target="psclasse.id" id="idfinal" min="0" name="parametrosWeb[2].parametroFinal" pattern="number0to9" step="1" type="number">
									<span class="o-form__groupElement"><a class="o-button--lube" href="<c:url value="/produto-servico/classe/listarsl?search=classefinal"/>" onclick="ModalController.show(this, event);" role="link" title="<fmt:message key="button.pesquisar"/>"><i class="icon-search"></i></a></span>
								</div>
							</div>
						</div>
						<div class="l-row" role="row">
							<div class="u-grid--12" role="grid">
								<label class="o-form__text" for="datacadastrofinal"><fmt:message key="label.data.cadastro"/></label>
								<input class="o-form__data has-validation" id="datacadastrofinal" max="31-12-2900" maxlength="10" min="01-01-1900" name="parametrosWeb[3].parametroFinal" onkeypress="checkMask(event);" onkeyup="mask(maskData, this, event);" pattern="data" placeholder="<fmt:message key="placeholder.data"/>" type="text">
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