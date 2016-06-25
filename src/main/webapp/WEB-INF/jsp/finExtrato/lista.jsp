<%@include file="/config/taglibraries.jsp"%>
<display:table class="table-default" export="false" id="obj" name="${FinExtratoList}" requestURI="/financeiro/extrato">
	<display:column format="{0, date, dd/MM/yyyy}" headerScope="datacreate" property="datacreate.time" titleKey="displaytag.data"/>
	<display:column headerScope="iddocumento.numero" property="iddocumento.numero" titleKey="displaytag.numero.documento"/>
	<display:column headerScope="iddocumento.iddefinicao.idpessoa.nomerazaosocial" property="iddocumento.iddefinicao.idpessoa.nomerazaosocial" titleKey="displaytag.pessoa"/>
	<display:column headerScope="iddocumento.idtipooperacao.descricao" property="idtipooperacao.descricao" titleKey="displaytag.operacao"/>
	<display:column headerScope="creditodebito" property="creditodebito" titleKey="displaytag.tipo"/>
	<display:column headerScope="valor" property="valor" titleKey="displaytag.valor"/>
</display:table>