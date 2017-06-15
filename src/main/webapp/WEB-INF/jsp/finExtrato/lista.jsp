<%@include file="/config/taglibraries.jsp"%>
<display:table class="c-table--lube c-table--hovered c-table--zebrered c-table--bordered" export="false" id="obj" name="${FinExtratoList}" requestURI="/financeiro/extrato">
	<c:if test="${obj.creditodebito.equals('C')}"><c:set var="colorText" value="l-color--ren"/></c:if>
	<c:if test="${obj.creditodebito.equals('D')}"><c:set var="colorText" value="l-color--der"/></c:if>
	<display:column class="${colorText}" format="{0, date, dd/MM/yyyy}" headerScope="datacreate" property="datacreate.time" titleKey="displaytag.data"/>
	<display:column class="${colorText}" headerScope="numerodocumento" property="numerodocumento" titleKey="displaytag.numero.documento"/>
	<display:column class="${colorText}" headerScope="iddefinicao.idpessoa.nomerazaosocial" property="iddefinicao.idpessoa.nomerazaosocial" titleKey="displaytag.pessoa"/>
	<display:column class="${colorText}" headerScope="idtipooperacao.descricao" property="idtipooperacao.descricao" titleKey="displaytag.operacao"/>
	<display:column class="${colorText}" headerScope="creditodebito" property="creditodebito" titleKey="displaytag.tipo"/>
	<display:column class="${colorText}" headerScope="historico" property="historico" titleKey="displaytag.historico"/>
	<display:column class="${colorText}" headerScope="valor" property="valor" titleKey="displaytag.valor"/>
	<display:column headerScope="saldo" property="saldo" titleKey="displaytag.saldo"/>
</display:table>