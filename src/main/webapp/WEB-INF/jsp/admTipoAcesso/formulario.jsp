<%@include file="/config/header.jsp" %>
<form action="<c:url value="/administrador/usuario/tipo-de-acesso"/>" class="form-modern" id="formadmusuariotipoacesso" method="post" name="formadmusuariotipoacesso" role="form">
	<%-- <input name="versao" type="hidden" value="${obj.versao}"> --%>
	<nav class="band-nav-lube" role="complementary">
		<div class="row" role="row">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" role="separator">
				<label><a href="<c:url value="/dashboard/administrador"/>"><fmt:message key="nav.administrador"/></a>&nbsp;<i class="icon-right-open"></i>&nbsp;<fmt:message key="nav.administrador.usuario.tipo.acesso"/></label>					
			</div>
		</div>
	</nav>
	<c:import url="tabs.jsp"/>
	<nav class="nav-group-tie nav-fixed-bottom" role="complementary">
		<ul>
			<li><button title="<fmt:message key="button.salvar"/>" type="submit"><i class="icon-floppy"></i>&nbsp;<fmt:message key="button.salvar"/></button></li>
			<li><a href="<c:url value="/administrador/usuario/tipo-de-acesso"/>" title="<fmt:message key="button.pesquisar"/>"><i class="icon-search"></i>&nbsp;<fmt:message key="button.pesquisar"/></a></li>
		</ul>
	</nav>
</form>
<%@include file="/config/footer.jsp"%>