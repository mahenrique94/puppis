<%@include file="/config/header.jsp" %>
<c:set var="readOnly" value="${obj.id != null ? 'readonly' : ''}"/>
<c:set var="disabled" value="${obj.id != null ? 'disabled' : ''}"/>
<form action="<c:url value="/comercio/nota"/>" class="form-modern" id="formcomnota" method="post" name="formcomnota" role="form">
	<nav class="band-nav-lube" role="complementary">
		<div class="row" role="row">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" role="separator">
				<label><a href="<c:url value="/dashboard/comercio"/>"><fmt:message key="nav.comercio"/></a>&nbsp;<i class="icon-right-open"></i>&nbsp;<fmt:message key="nav.comercio.nota"/></label>					
			</div>
		</div>
	</nav>
	<c:import url="tabs${obj.idtipooperacao.descricao.toLowerCase()}.jsp"/>
	<nav class="nav-group-tie nav-fixed-bottom" role="complementary">
		<ul>
			<li><button title="<fmt:message key="button.salvar"/>" type="submit"><i class="icon-floppy"></i>&nbsp;<fmt:message key="button.salvar"/></button></li>
			<li><a href="<c:url value="/comercio/nota"/>" title="<fmt:message key="button.pesquisar"/>"><i class="icon-search"></i>&nbsp;<fmt:message key="button.pesquisar"/></a></li>
			<c:if test="${obj.dataatualizacao != null}">
				<li><button formaction="<c:url value="/comercio/nota/estornar/${obj.id}"/>" title="<fmt:message key="button.estornar"/>" type="submit"><i class="icon-exchange"></i>&nbsp;<fmt:message key="button.estornar"/></button></li>
			</c:if>
			<c:if test="${obj.dataatualizacao == null}">
				<li><button formaction="<c:url value="/comercio/nota/calcular"/>" title="<fmt:message key="button.calcular"/>" type="submit"><i class="icon-calc"></i>&nbsp;<fmt:message key="button.calcular"/></button></li>
				<li><button formaction="<c:url value="/comercio/nota/atualizar"/>" title="<fmt:message key="button.processar"/>" type="submit"><i class="icon-arrows-cw"></i>&nbsp;<fmt:message key="button.atualizar"/></button></li>
			</c:if>
		</ul>
	</nav>
</form>
<%@include file="/config/footer.jsp"%>