<%@include file="/config/taglibraries.jsp"%>
<display:table class="table-default table-disabled" export="false" id="obj" name="${FinDocumentoList}" requestURI="/financeiro/documento">
	<display:column style="text-align: center;width: 15px;">
		<input form="formfindocumento" name="obj[${obj_rowNum}].id" onclick="paintRow(this);" type="checkbox" value="${obj.id}">
	</display:column>
	<display:column headerScope="numero" property="numero" titleKey="displaytag.numero.documento"/>
	<display:column headerScope="serie" property="serie" titleKey="displaytag.serie"/>
	<display:column headerScope="idtipodocumento.descricao" property="idtipodocumento.descricao" titleKey="displaytag.tipo.documento"/>
	<display:column headerScope="idformapagamento.descricao" property="idformapagamento.descricao" titleKey="displaytag.forma.pagamento"/>
	<display:column headerScope="iddefinicao.idpessoa.nomerazaosocial" property="iddefinicao.idpessoa.nomerazaosocial" titleKey="displaytag.pessoa"/>
	<display:column headerScope="valortotal" property="valortotal" titleKey="displaytag.valor.total"/>
	<display:column headerScope="saldo" property="saldo" titleKey="displaytag.saldo"/>
	<display:column style="text-align: center;width: 270px;">
		<select class="form-data validate" data-class="slSysTipoOperacao" data-fields="idmodulo.id" data-parameters="2" disabled id="slSystem_Tipo-de-operacao_Json_01" name="obj[${obj_rowNum}].idtipooperacao.id" required style="width: 150px;"></select>
		<input class="form-data" disabled name="obj[${obj_rowNum}].valor" style="width: 100px;" type="text">
	</display:column>
</display:table>