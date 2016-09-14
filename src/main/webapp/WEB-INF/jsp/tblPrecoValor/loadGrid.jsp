<%@include file="/config/taglibraries.jsp"%>
<display:table class="table-default" export="false" id="obj" name="${TblPrecoValorList}" requestURI="/tabela-de-preco/valor">
	<display:column headerScope="id" property="id" style="width: 50px;" titleKey="displaytag.id"/>
	<display:column format="{0, date, dd/MM/yyyy HH:mm}" headerScope="datavigenciainicial" property="datavigenciainicial.time" titleKey="displaytag.data.vigencia.inicial"/>
	<display:column format="{0, date, dd/MM/yyyy HH:mm}" headerScope="datavigenciafinal" property="datavigenciafinal.time" titleKey="displaytag.data.vigencia.final"/>
	<display:column headerScope="valor" property="valor" titleKey="displaytag.valor"/>
	<display:column headerScope="valorpromocao" property="valorpromocao" titleKey="displaytag.valor.promocao"/>
	<display:column headerScope="valordesconto" property="valordesconto" titleKey="displaytag.valor.desconto"/>
	<display:column headerScope="valorparcelamento" property="valorparcelamento" titleKey="displaytag.valor.parcelamento"/>
	<display:column headerScope="valorfaturado" property="valorfaturado" titleKey="displaytag.valor.faturado"/>
	<display:column style="text-align: center;width: 50px;" titleKey="displaytag.inativo">
		<c:if test="${obj.inativo == false}"><i class="color-red icon-cancel"></i></c:if>
		<c:if test="${obj.inativo == true}"><i class="color-green-dark icon-ok"></i></c:if>
	</display:column>
	<display:column style="text-align: center;width: 165px;">
		<a class="btn-lower btn-xs" href="<c:url value="/tabela-de-preco/valor/${obj.id}"/>" onclick="ModalController.show(this, event);"><i class="icon-pencil"></i>&nbsp;<fmt:message key="button.editar"/></a>
		<button class="btn-der btn-xs" formaction="<c:url value="/tabela-de-preco/valor?obj.id=${obj.id}"/>" onclick="deletar(this);" type="button"><span class="icon-trash"></span>&nbsp;<fmt:message key="button.deletar"/></button>
	</display:column>
</display:table>