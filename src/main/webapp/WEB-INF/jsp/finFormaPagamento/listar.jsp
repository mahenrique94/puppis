<%@include file="/config/header.jsp"%>
<form action="<c:url value="/financeiro/forma-de-pagamento"/>" class="form-modern" id="formlistarfinformapagamento" method="get" name="formlistarfinformapagamento" role="search">
	<nav class="band-nav-lube" role="complementary">
		<div class="row" role="row">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" role="separator">
				<label><fmt:message key="nav.financeiro"/>&nbsp;<fmt:message key="label.barra"/>&nbsp;<fmt:message key="nav.financeiro.forma.pagamento"/></label>					
			</div>
		</div>
		<div class="row" role="row">
			<div class="col-xs-3 col-sm-3 col-md-3 col-lg-3" role="separator">
				<select class="form-data" data-class="displaytagSelect" name="parametrosWeb[0].campo"></select>
			</div>
			<div class="col-xs-9 col-sm-9 col-md-9 col-lg-9" role="separator">
				<div class="form-data-group">
					<input autocomplete="off" class="form-data" name="parametrosWeb[0].parametro" pattern="letraNumeroEspacoPontoTracoBarra" type="text">
					<span class="form-data-group-btn"><button class="btn-default"><i class="icon-search"></i></button></span>
				</div>
			</div>
		</div>
	</nav>
</form>
<display:table class="table-default" export="false" id="obj" name="${FinFormaPagamentoList}" requestURI="/financeiro/forma-de-pagamento">
	<display:column headerScope="id" property="id" style="width: 50px;" titleKey="displaytag.id"/>
	<display:column property="descricao" headerScope="descricao" titleKey="displaytag.descricao"/>
	<display:column headerScope="quantidadeparcela" property="quantidadeparcela" style="width: 100px;text-align: center;" titleKey="displaytag.quantidade.parcela"/>
	<display:column headerScope="intervalor" property="intervalo" style="width: 50px;text-align: center;" titleKey="displaytag.intervalo"/>
</display:table>
<%@include file="/config/footer.jsp"%>