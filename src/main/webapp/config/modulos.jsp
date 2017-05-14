<%@include file="taglibraries.jsp"%>
<c:set value="is-disabled" var="disabledAdministrador"/>
<c:set value="is-disabled" var="disabledCadastro"/>
<c:set value="is-disabled" var="disabledComercio"/>
<c:set value="is-disabled" var="disabledFinanceiro"/>
<c:set value="is-disabled" var="disabledRelatorio"/>
<c:forEach items="${userName.modulos}" var="modulo">
	<c:if test="${modulo.equals('ADMINISTRADOR')}">
		<c:set value="" var="disabledAdministrador"/>
	</c:if>
	<c:if test="${modulo.equals('CADASTRO')}">
		<c:set value="" var="disabledCadastro"/>
	</c:if>
	<c:if test="${modulo.equals('COMERCIO')}">
		<c:set value="" var="disabledComercio"/>
	</c:if>
	<c:if test="${modulo.equals('FINANCEIRO')}">
		<c:set value="" var="disabledFinanceiro"/>
	</c:if>
	<c:if test="${modulo.equals('RELATORIO')}">
		<c:set value="" var="disabledRelatorio"/>
	</c:if>
</c:forEach>