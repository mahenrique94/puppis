<%@include file="/config/header.jsp"%>
<div class="container-tie">
	<div class="container-header">
		<form action="<c:url value="/financeiro/extrato"/>" class="form-search" id="formlistarfinextrato" method="get" name="formlistarfinextrato" role="search">
			<div class="row">
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
					<h2><fmt:message key="nav.financeiro"/>&nbsp;<fmt:message key="label.barra"/>&nbsp;<fmt:message key="nav.operacional"/>&nbsp;<fmt:message key="label.barra"/>&nbsp;<fmt:message key="nav.financeiro.operacional.extrato"/></h2>					
				</div>
				<div class="col-xs-4 col-sm-4 col-md-3 col-lg-2">
					<select class="select-search" data-class="displaytagSelect" name="parametrosWeb[0].campo"></select>
				</div>
				<div class="col-xs-8 col-sm-8 col-md-9 col-lg-10">
					<input autocomplete="off" class="input-search" name="parametrosWeb[0].parametro" pattern="letraNumeroEspacoPontoTracoBarra" type="search">
				</div>
			</div>
		</form>
	</div>
	<display:table class="table-default" export="false" id="obj" name="${FinExtratoList}" requestURI="/financeiro/extrato">
		<display:column format="{0, date, dd/MM/yyyy}" headerScope="datacreate" property="datacreate.time" titleKey="displaytag.data.entrada"/>
		<display:column format="{0, date, dd/MM/yyyy}" headerScope="iddocumentocusto.datavencimento" property="iddocumentocusto.datavencimento.time" titleKey="displaytag.data.vencimento"/>
		<display:column headerScope="iddocumentocusto.iddocumento.numero" property="iddocumentocusto.iddocumento.numero" titleKey="displaytag.numero.documento"/>
		<display:column headerScope="iddocumentocusto.iddocumento.idcontabancaria.idbanco.descricao" property="iddocumentocusto.iddocumento.idcontabancaria.idbanco.descricao" titleKey="displaytag.banco"/>
		<display:column headerScope="iddocumentocusto.iddocumento.idcontabancaria.numeroconta" property="iddocumentocusto.iddocumento.idcontabancaria.numeroconta" titleKey="displaytag.conta"/>
		<display:column headerScope="iddocumentocusto.iddocumento.idpessoa.nomerazaosocial" property="iddocumentocusto.iddocumento.idpessoa.nomerazaosocial" titleKey="displaytag.pessoa"/>
		<display:column headerScope="idtipooperacao.descricao" property="idtipooperacao.descricao" titleKey="displaytag.operacao"/>
		<display:column headerScope="creditodebito" property="creditodebito" titleKey="displaytag.tipo"/>
		<display:column headerScope="valor" property="valor" titleKey="displaytag.valor"/>
	</display:table>
</div>
<%@include file="/config/footer.jsp"%>