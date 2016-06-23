<%@include file="/config/taglibraries.jsp"%>
<display:table class="table-default table-disabled" export="false" id="obj" name="${FinDocumentoList}" requestURI="/financeiro/documento">
	<display:column style="text-align: center;width: 15px;">
		<input class="form-data" name="obj[${obj_rowNum}].id" onclick="paintRow(this);" type="checkbox" value="${obj.id}">
	</display:column>
	<display:column headerScope="numero" property="numero" titleKey="displaytag.numero.documento"/>
	<display:column headerScope="serie" property="serie" titleKey="displaytag.serie"/>
	<display:column headerScope="idtipodocumento.descricao" property="idtipodocumento.descricao" titleKey="displaytag.tipo.documento"/>
	<display:column headerScope="idformapagamento.descricao" property="idformapagamento.descricao" titleKey="displaytag.forma.pagamento"/>
	<display:column headerScope="iddefinicao.idpessoa.nomerazaosocial" property="iddefinicao.idpessoa.nomerazaosocial" titleKey="displaytag.pessoa"/>
	<display:column headerScope="valortotal" property="valortotal" titleKey="displaytag.valor.total"/>
	<display:column headerScope="saldo" property="saldo" titleKey="displaytag.saldo"/>
	<display:column style="text-align: center;width: 110px;">
		<input class="form-data" disabled name="obj[${obj_rowNum}].valortotal" style="margin-top: 0;width: 100px;" type="text">
	</display:column>
</display:table>