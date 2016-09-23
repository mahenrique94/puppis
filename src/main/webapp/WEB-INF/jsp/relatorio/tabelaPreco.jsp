<%@include file="/config/header.jsp" %>
<form action="<c:url value="/relatorio/processar"/>" class="form-modern" data-controller="ModalController" id="relatorio" method="post" name="relatorio" role="form" target="_blank">
	<input name="parametrosWeb[0].parametroInicial" type="hidden" value="IRTABELAPRECO">
	<input name="parametrosWeb[1].parametroInicial" type="hidden" value="PDF">
	<nav class="band-nav-lube" role="complementary">
		<div class="row" role="row">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" role="separator">
				<label><a href="<c:url value="/dashboard/cadastro"/>"><fmt:message key="nav.cadastro"/></a>&nbsp;<i class="icon-right-open"></i>&nbsp;<a href="<c:url value="/dashboard/relatorios/cadastro"/>"><fmt:message key="nav.cadastro.relatorios"/></a>&nbsp;<i class="icon-right-open"></i>&nbsp;<fmt:message key="nav.cadastro.relatorios.pessoa"/></label>					
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
							<label><fmt:message key="label.id.produto.servico"/></label>
							<div class="form-data-group">
								<input autocomplete="off" class="form-data validate" id="produtoinicial_id" min="0" name="parametrosWeb[2].parametroInicial" step="1" type="number">
								<span class="form-data-group-btn"><a class="btn-default" href="<c:url value="/produto-servico/listarsl?search=produtoinicial"/>" onclick="ModalController.show(this, event);"><i class="icon-search"></i></a></span>
							</div>
						</div>
					</div>
					<div class="row" role="row">
						<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" role="separator">
							<label><fmt:message key="label.id.pessoa"/></label>
							<div class="form-data-group">
								<input autocomplete="off" class="form-data validate" id="pessoainicial_id" min="0" name="parametrosWeb[3].parametroInicial" step="1" type="number">
								<span class="form-data-group-btn"><a class="btn-default" href="<c:url value="/pessoa/definicao/listarsl?search=pessoainicial"/>" onclick="ModalController.show(this, event);"><i class="icon-search"></i></a></span>
							</div>
						</div>
					</div>
					<div class="row" role="row">
						<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" role="separator">
							<label><fmt:message key="label.data.cadastro"/></label>
							<input autocomplete="off" class="form-data validate" maxlength="10" name="parametrosWeb[4].parametroInicial" onkeypress="format(this, event, maskData);" pattern="data" placeholder="<fmt:message key="placeholder.data"/>" type="text">
						</div>
					</div>
				</section>
			</fieldset>
			<fieldset class="block-lube">
				<legend class="block-header"><label class="block-title"><fmt:message key="titulo.final"/></label></legend>
				<section class="block-body block-body-padding">
					<div class="row" role="row">
						<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" role="separator">
							<label><fmt:message key="label.id.produto.servico"/></label>
							<div class="form-data-group">
								<input autocomplete="off" class="form-data validate" id="produtofinal_id" min="0" name="parametrosWeb[2].parametroFinal" step="1" type="number">
								<span class="form-data-group-btn"><a class="btn-default" href="<c:url value="/produto-servico/listarsl?search=produtofinal"/>" onclick="ModalController.show(this, event);"><i class="icon-search"></i></a></span>
							</div>
						</div>
					</div>
					<div class="row" role="row">
						<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" role="separator">
							<label><fmt:message key="label.id.pessoa"/></label>
							<div class="form-data-group">
								<input autocomplete="off" class="form-data validate" id="pessoafinal_id" min="0" name="parametrosWeb[3].parametroFinal" step="1" type="number">
								<span class="form-data-group-btn"><a class="btn-default" href="<c:url value="/pessoa/definicao/listarsl?search=pessoafinal"/>" onclick="ModalController.show(this, event);"><i class="icon-search"></i></a></span>
							</div>
						</div>
					</div>
					<div class="row" role="row">
						<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" role="separator">
							<label><fmt:message key="label.data.cadastro"/></label>
							<input autocomplete="off" class="form-data validate" maxlength="10" name="parametrosWeb[4].parametroFinal" onkeypress="format(this, event, maskData);" pattern="data" placeholder="<fmt:message key="placeholder.data"/>" type="text">
						</div>
					</div>
				</section>
			</fieldset>
		</section>
		<%-- <fieldset class="block-lube m-top-15">
			<legend class="block-header"><label class="block-title"><fmt:message key="titulo.tipo.arquivo"/></label></legend>
			<section class="block-body block-body-padding">
				<div class="row" role="row">
					<div class="col-12" role="separator">
						<label></label>
						<label class="color-green-dark">
							<input class="form-data" name="parametrosweb[1].parametroinicial" type="radio" value="XLS">
							<i class="icon-file-excel icon-md"></i>&nbsp;<fmt:message key="label.excel"/>
						</label>
						<label class="color-blue">
							<input class="form-data" name="parametrosweb[1].parametroinicial" type="radio" value="HTML"/>
							<i class="icon-file-code icon-md"></i>&nbsp;<fmt:message key="label.html"/>
						</label>							
						<label class="color-red">
							<input checked class="form-data" name="parametrosweb[1].parametroinicial" type="radio" value="PDF"/>
							<i class="icon-file-pdf icon-md"></i>&nbsp;<fmt:message key="label.pdf"/>
						</label>
						<label class="color-gray-dark">
							<input class="form-data" name="parametrosweb[1].parametroinicial" type="radio" value="TXT"/>
							<i class="icon-doc-text icon-md"></i>&nbsp;<fmt:message key="label.txt"/>
						</label>
						<label class="color-lube">
							<input class="form-data" name="parametrosweb[1].parametroinicial" type="radio" value="WORD"/>
							<i class="icon-file-word icon-md"></i>&nbsp;<fmt:message key="label.word"/>
						</label>
					</div>
				</div>
			</section>
		</fieldset> --%>
	</section>
	<nav class="nav-group-tie nav-fixed-bottom" role="complementary">
		<ul>
			<li><button title="<fmt:message key="button.visualizar"/>" type="submit"><i class="icon-eye"></i>&nbsp;<fmt:message key="button.visualizar"/></button></li>
		</ul>
	</nav>
</form>
<%@include file="/config/footer.jsp"%>