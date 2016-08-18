<%@include file="/config/header.jsp" %>
<form action="<c:url value="/relatorio/processar"/>" class="form-modern" data-controller="ModalController" id="relatorio" method="post" name="relatorio" role="form" target="_blank">
	<input name="parametrosWeb[0].parametroInicial" type="hidden" value="IRFINDOCPAGAMENTO">
	<input name="parametrosWeb[1].parametroInicial" type="hidden" value="PDF">
	<nav class="band-nav-lube" role="complementary">
		<div class="row" role="row">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" role="separator">
				<label><a href="<c:url value="/dashboard/financeiro"/>"><fmt:message key="nav.financeiro"/></a>&nbsp;<i class="icon-right-open"></i>&nbsp;<a href="<c:url value="/dashboard/relatorios/financeiro"/>"><fmt:message key="nav.financeiro.relatorios"/></a>&nbsp;<i class="icon-right-open"></i>&nbsp;<fmt:message key="nav.financeiro.relatorios.documento.pagamento"/></label>					
			</div>
		</div>
	</nav>
	<section aria-expanded="true" aria-hidden="false" class="form-body" role="form">
		<section class="two-column">
			<fieldset class="block-lube">
				<legend class="block-header"><label class="block-title"><fmt:message key="titulo.inicial"/></label></legend>
				<section class="block-body block-body-padding">
					<div class="row" role="row">
						<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" role="separator">
							<label><fmt:message key="label.id.forma.pagamento"/></label>
							<div class="form-data-group">
								<input autocomplete="off" class="form-data validate" min="0" name="parametrosWeb[2].parametroInicial" step="1" type="number">
								<span class="form-data-group-btn"><a class="btn-default" href="<c:url value="/financeiro/forma-de-pagamento/listarsl"/>" onclick="ModalController.show(this, event);"><i class="icon-search"></i></a></span>
							</div>
						</div>
					</div>
					<div class="row" role="row">
						<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" role="separator">
							<label><fmt:message key="label.data.emissao"/></label>
							<input autocomplete="off" class="form-data validate" maxlength="10" name="parametrosWeb[3].parametroInicial" onkeypress="format(this, event, maskData);" pattern="data" type="text">
						</div>
					</div>
					<div class="row" role="row">
						<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" role="separator">
							<label><fmt:message key="label.data.pagamento"/></label>
							<input autocomplete="off" class="form-data validate" maxlength="10" name="parametrosWeb[4].parametroInicial" onkeypress="format(this, event, maskData);" pattern="data" type="text">
						</div>
					</div>
					<div class="row" role="row">
						<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" role="separator">
							<label><fmt:message key="label.data.vencimento"/></label>
							<input autocomplete="off" class="form-data validate" maxlength="10" name="parametrosWeb[5].parametroInicial" onkeypress="format(this, event, maskData);" pattern="data" type="text">
						</div>
					</div>
				</section>
			</fieldset>
			<fieldset class="block-lube">
				<legend class="block-header"><label class="block-title"><fmt:message key="titulo.final"/></label></legend>
				<section class="block-body block-body-padding">
					<div class="row" role="row">
						<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" role="separator">
							<label><fmt:message key="label.id.forma.pagamento"/></label>
							<div class="form-data-group">
								<input autocomplete="off" class="form-data validate" min="0" name="parametrosWeb[2].parametroFinal" step="1" type="number">
								<span class="form-data-group-btn"><a class="btn-default" href="<c:url value="/financeiro/forma-de-pagamento/listarsl"/>" onclick="ModalController.show(this, event);"><i class="icon-search"></i></a></span>
							</div>
						</div>
					</div>
					<div class="row" role="row">
						<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" role="separator">
							<label><fmt:message key="label.data.emissao"/></label>
							<input autocomplete="off" class="form-data validate" maxlength="10" name="parametrosWeb[3].parametroFinal" onkeypress="format(this, event, maskData);" pattern="data" type="text">
						</div>
					</div>
					<div class="row" role="row">
						<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" role="separator">
							<label><fmt:message key="label.data.pagamento"/></label>
							<input autocomplete="off" class="form-data validate" maxlength="10" name="parametrosWeb[4].parametroFinal" onkeypress="format(this, event, maskData);" pattern="data" type="text">
						</div>
					</div>
					<div class="row" role="row">
						<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" role="separator">
							<label><fmt:message key="label.data.vencimento"/></label>
							<input autocomplete="off" class="form-data validate" maxlength="10" name="parametrosWeb[5].parametroFinal" onkeypress="format(this, event, maskData);" pattern="data" type="text">
						</div>
					</div>
				</section>
			</fieldset>
		</section>
	</section>
	<nav class="nav-group-tie nav-fixed-bottom" role="complementary">
		<ul>
			<li><button title="<fmt:message key="button.visualizar"/>" type="submit"><i class="icon-eye"></i>&nbsp;<fmt:message key="button.visualizar"/></button></li>
		</ul>
	</nav>
</form>
<%@include file="/config/footer.jsp"%>