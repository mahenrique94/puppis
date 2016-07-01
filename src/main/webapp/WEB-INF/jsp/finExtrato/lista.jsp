<%@include file="/config/taglibraries.jsp"%>
<display:table class="table-default" export="false" id="obj" name="${FinExtratoList}" requestURI="/financeiro/extrato">
	<c:if test="${obj.creditodebito.equals('C')}"><c:set var="colorText" value="color-success"/></c:if>
	<c:if test="${obj.creditodebito.equals('D')}"><c:set var="colorText" value="color-error"/></c:if>
	<display:column class="${colorText}" format="{0, date, dd/MM/yyyy}" headerScope="datacreate" property="datacreate.time" titleKey="displaytag.data"/>
	<display:column class="${colorText}" headerScope="iddocumento.numero" property="iddocumento.numero" titleKey="displaytag.numero.documento"/>
	<display:column class="${colorText}" headerScope="iddocumento.iddefinicao.idpessoa.nomerazaosocial" property="iddocumento.iddefinicao.idpessoa.nomerazaosocial" titleKey="displaytag.pessoa"/>
	<display:column class="${colorText}" headerScope="iddocumento.idtipooperacao.descricao" property="idtipooperacao.descricao" titleKey="displaytag.operacao"/>
	<display:column class="${colorText}" headerScope="creditodebito" property="creditodebito" titleKey="displaytag.tipo"/>
	<display:column class="${colorText} total-${obj.creditodebito}" headerScope="valor" property="valor" titleKey="displaytag.valor"/>
	<display:footer><tr><td colspan="5" style="border-left: 1px solid #DCDCDC;"></td><td id="total"></td></tr></display:footer>
</display:table>
<script>
	NodeList.prototype.forEach = Array.prototype.forEach; 
	HTMLCollection.prototype.forEach = Array.prototype.forEach;
	let p = document.getElementById('total');
	let total = 0.0;
	let totalCredito = 0.0;
	let totalDebito = 0.0;
	document.getElementsByClassName('total-C').forEach(td => totalCredito += parseFloat(td.innerText));
	document.getElementsByClassName('total-D').forEach(td => totalDebito += parseFloat(td.innerText));
	total = totalCredito - totalDebito;
	p.innerText = total.toFixed(2);
</script>