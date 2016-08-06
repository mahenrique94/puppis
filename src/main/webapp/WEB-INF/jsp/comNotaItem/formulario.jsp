<%@include file="/config/taglibraries.jsp" %>
<c:set value="${param.operacao != null ? param.operacao.toLowerCase() : obj.idnota.idtipooperacao.descricao.toLowerCase()}" var="operacao"/>
<c:import url="form${operacao}.jsp"/>