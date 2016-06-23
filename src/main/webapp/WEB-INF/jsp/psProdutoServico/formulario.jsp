<%@include file="/config/header.jsp" %>
<form action="<c:url value="/produto-servico"/>" class="form-modern" id="formpsprodutoservico" method="post" name="formpsprodutoservico" role="form">
	<nav class="band-nav-lube" role="complementary">
		<div class="row" role="row">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" role="separator">
				<label><a href="<c:url value="/dashboard/cadastro"/>"><fmt:message key="nav.cadastro"/></a>&nbsp;<i class="icon-right-open"></i>&nbsp;<a href="<c:url value="/dashboard/produtoServico"/>"><fmt:message key="nav.cadastro.produto.servico"/></a>&nbsp;<i class="icon-right-open"></i>&nbsp;<fmt:message key="nav.cadastro.produto.servico"/></label>					
			</div>
		</div>
	</nav>
	<c:import url="tabs.jsp"/>
</form>
<nav class="nav-group-tie nav-fixed-bottom" role="complementary">
	<ul>
		<li><button form="formpsprodutoservico" title="<fmt:message key="button.salvar"/>" type="submit"><i class="icon-floppy"></i>&nbsp;<fmt:message key="button.salvar"/></button></li>
		<li><a href="<c:url value="/produto-servico"/>" title="<fmt:message key="button.pesquisar"/>"><i class="icon-search"></i>&nbsp;<fmt:message key="button.pesquisar"/></a></li>
	</ul>
</nav>
<%@include file="/config/footer.jsp"%>