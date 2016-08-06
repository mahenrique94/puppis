<%@include file="/config/header.jsp"%>
<form action="<c:url value="/financeiro/documento"/>" class="form-modern" id="formlistarfindocumento" method="get" name="formlistarfindocumento" role="search">
	<nav class="band-nav-lube" role="complementary">
		<div class="row" role="row">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" role="separator">
				<label><a href="<c:url value="/dashboard/financeiro"/>"><fmt:message key="nav.financeiro"/></a>&nbsp;<i class="icon-right-open"></i>&nbsp;<fmt:message key="nav.financeiro.documento"/></label>					
			</div>
		</div>
		<div class="row" role="row">
			<div class="col-xs-2 col-sm-2 col-md-2 col-lg-2" role="separator">
				<div class="form-data-group">
					<span class="form-data-group-text"><fmt:message key="label.de"/></span>
					<input class="form-data" maxlength="10" min="01-01-1970" name="parametrosWeb[1].parametroInicial" onkeypress="format(this, event, dataMask);" pattern="data" type="text" value="${parametrosWeb[1].parametroInicial}">
				</div>
			</div>
			<div class="col-xs-2 col-sm-2 col-md-2 col-lg-2" role="separator">
				<div class="form-data-group">
					<span class="form-data-group-text"><fmt:message key="label.ate"/></span>
					<input class="form-data" maxlength="10" min="01-01-1970" name="parametrosWeb[1].parametroFinal" onkeypress="format(this, event, dataMask);" pattern="data" type="text" value="${parametrosWeb[1].parametroFinal}">
				</div>
			</div>
			<div class="col-xs-2 col-sm-2 col-md-2 col-lg-2" role="separator">
				<select class="form-data" data-class="displaytagSelect" name="parametrosWeb[0].campo"></select>
			</div>
			<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4" role="separator">
				<div class="form-data-group">
					<input autocomplete="off" class="form-data" name="parametrosWeb[0].parametroInicial" pattern="letraNumeroEspacoPontoTracoBarra" type="text">
					<span class="form-data-group-btn"><button class="btn-default"><i class="icon-search"></i></button></span>
				</div>
			</div>
			<div class="col-xs-2 col-sm-2 col-md-2 col-lg-2" role="separator">
				<label class="no-margin"><fmt:message key="label.baixados"/></label>
				<input <c:if test="${parametrosWeb[2].operador.equals('is not null')}">checked</c:if> class="form-data" name="parametrosWeb[2].operador" type="checkbox" value="is not null">
			</div>
		</div>
	</nav>
</form>
<display:table class="table-default" export="false" id="obj" name="${FinDocumentoList}" requestURI="/financeiro/documento">
	<display:column headerScope="numero" property="numero" titleKey="displaytag.numero.documento"/>
	<display:column headerScope="serie" property="serie" titleKey="displaytag.serie"/>
	<display:column headerScope="idtipodocumento.descricao" property="idtipodocumento.descricao" titleKey="displaytag.tipo.documento"/>
	<display:column headerScope="idformapagamento.descricao" property="idformapagamento.descricao" titleKey="displaytag.forma.pagamento"/>
	<display:column headerScope="iddefinicao.idpessoa.nomerazaosocial" property="iddefinicao.idpessoa.nomerazaosocial" titleKey="displaytag.pessoa"/>
	<display:column headerScope="valortotal" property="valortotal" titleKey="displaytag.valor.total"/>
	<display:column style="text-align: center;width: 165px;">
		<a class="btn-lower btn-xs" href="<c:url value="/financeiro/documento/${obj.id}"/>"><span class="icon-pencil"></span>&nbsp;<fmt:message key="button.editar"/></a>
		<button class="btn-der btn-xs" formaction="<c:url value="/financeiro/documento?obj.id=${obj.id}"/>" onclick="deletar(this);" type="button"><span class="icon-trash"></span>&nbsp;<fmt:message key="button.deletar"/></button>
	</display:column>
</display:table>
<nav class="nav-group-tie nav-fixed-bottom" role="complementary">
	<ul>
		<li><a href="<c:url value="/financeiro/documento/formulario"/>"><i class="icon-plus"></i>&nbsp;<fmt:message key="button.novo"/></a></li>
	</ul>
</nav>
<%@include file="/config/footer.jsp"%>