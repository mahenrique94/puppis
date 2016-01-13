<%@include file="/config/header.jsp"%>
<div class="container-tie">
	<div class="container-header">
		<form action="<c:url value="/financeiro/documento"/>" class="form-search" id="formlistarfindocumento" method="get" name="formlistarfindocumento" role="search">
			<div class="row">
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
					<h2><fmt:message key="nav.financeiro"/>&nbsp;<fmt:message key="label.barra"/>&nbsp;<fmt:message key="nav.operacional"/>&nbsp;<fmt:message key="label.barra"/>&nbsp;<fmt:message key="nav.financeiro.operacional.documento"/></h2>					
				</div>
				<div class="col-xs-12 col-sm-12 col-md-2 col-lg-1">
					<a class="btn-md float-left" href="<c:url value="/financeiro/documento/formulario"/>" title="<fmt:message key="button.novo"/>"><span class="icon-plus"></span>&nbsp;<fmt:message key="button.novo"/></a>
				</div>
				<div class="col-xs-4 col-sm-4 col-md-3 col-lg-2">
					<select class="select-search" data-class="displaytagSelect" name="parametrosWeb[0].campo"></select>
				</div>
				<div class="col-xs-8 col-sm-8 col-md-7 col-lg-9">
					<input autocomplete="off" class="input-search" name="parametrosWeb[0].parametro" pattern="letraNumeroEspacoPontoTracoBarra" type="search">
				</div>
			</div>
		</form>
	</div>
	<display:table class="table-default" export="false" id="obj" name="${FinDocumentoList}" requestURI="/financeiro/documento">
		<display:column headerScope="idtipooperacao.descricao" property="idtipooperacao.descricao" titleKey="displaytag.operacao"/>
		<display:column headerScope="numero" property="numero" titleKey="displaytag.numero.documento"/>
		<display:column headerScope="serie" property="serie" titleKey="displaytag.serie"/>
		<display:column headerScope="idtipodocumento.descricao" property="idtipodocumento.descricao" titleKey="displaytag.tipo.documento"/>
		<display:column headerScope="idformapagamento.descricao" property="idformapagamento.descricao" titleKey="displaytag.forma.pagamento"/>
		<display:column headerScope="valortotal" property="valortotal" titleKey="displaytag.valor.total"/>
		<display:column style="width: 150px;text-align: center;">
			<a class="btn-xs" href="<c:url value="/financeiro/documento/${obj.id}"/>"><span class="icon-pencil"></span>&nbsp;<fmt:message key="button.editar"/></a>
			<a class="btn-xs" href="<c:url value="/financeiro/documento/${obj.id}"/>" onclick="deletar(this);"><span class="icon-trash"></span>&nbsp;<fmt:message key="button.deletar"/></a>
		</display:column>
	</display:table>
</div>
<%@include file="/config/footer.jsp"%>