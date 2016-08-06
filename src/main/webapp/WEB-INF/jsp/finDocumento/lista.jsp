<%@include file="/config/taglibraries.jsp"%>
<display:table class="table-default table-disabled" export="false" id="obj" name="${FinDocumentoList}" requestURI="/financeiro/documento">
	<display:column headerClass="checkAll" style="text-align: center;width: 15px;">
		<input class="form-data" name="obj[${obj_rowNum}].id" onclick="checkGrid(this);" style="margin-top: 0;" type="checkbox" value="${obj.id}">
	</display:column>
	<display:column headerScope="numero" property="numero" titleKey="displaytag.numero.documento"/>
	<display:column headerScope="idtipodocumento.descricao" property="idtipodocumento.descricao" titleKey="displaytag.tipo.documento"/>
	<display:column headerScope="idformapagamento.descricao" property="idformapagamento.descricao" titleKey="displaytag.forma.pagamento"/>
	<display:column headerScope="iddefinicao.idpessoa.nomerazaosocial" property="iddefinicao.idpessoa.nomerazaosocial" titleKey="displaytag.pessoa"/>
	<display:column headerScope="valortotal" property="valortotal" titleKey="displaytag.valor.total"/>
	<c:if test="${obj.iddocumento != null}">
		<display:column headerScope="valordesconto" property="valordesconto" titleKey="displaytag.valor.desconto"/>
		<display:column headerScope="valorjuros" property="valorjuros" titleKey="displaytag.valor.juros"/>
	</c:if>
	<display:column headerScope="saldo" property="saldo" titleKey="displaytag.saldo"/>
	<c:if test="${param.idTipoOperacao.equals('4')}"> <!-- 4 = BAIXA -->
		<display:column style="text-align: center;width: 330px;">
			<input class="form-data" disabled name="obj[${obj_rowNum}].valortotal" pattern="numeric10_2" placeholder="Valor" style="margin-top: 0;width: 100px;" type="text">
			<input class="form-data" disabled name="obj[${obj_rowNum}].valordesconto" pattern="numeric10_2" placeholder="Descontos" style="margin-top: 0;width: 100px;" type="text">
			<input class="form-data" disabled name="obj[${obj_rowNum}].valorjuros" pattern="numeric10_2" placeholder="Juros" style="margin-top: 0;width: 100px;" type="text">
		</display:column>
	</c:if>
	<display:caption>0 linha(s) selecionadas</display:caption>
</display:table>