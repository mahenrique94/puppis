<%@include file="/config/taglibraries.jsp"%>
<h3 class="o-dashboard__user">
	<span><i class="icon-user"></i>&nbsp;${userName.usuario}&nbsp;-&nbsp;${userName.idComercio}</span>
	<span><a href="#" role="link" title="<fmt:message key="nav.sistema.alterar.senha"/>"><i class="icon-lock"></i>&nbsp;<fmt:message key="nav.sistema.alterar.senha"/></a></span>
	<span><a href="<c:url value="/login/logout"/>" role="link" title="<fmt:message key="nav.sistema.sair"/>"><i class="icon-off"></i>&nbsp;<fmt:message key="nav.sistema.sair"/></a></span>
</h3>