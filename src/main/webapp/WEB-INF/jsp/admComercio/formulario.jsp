<%@include file="/config/header.jsp" %>
<form action="<c:url value="/administrador/comercio"/>" class="form-modern" id="formadmcomercio" method="post" name="formadmcomercio" role="form">
	<input name="obj.id" type="hidden" value="${obj.id}">
	
	<nav class="band-nav-lube" role="complementary">
		<div class="row" role="row">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" role="separator">
				<label><a href="<c:url value="/dashboard/administrador"/>"><fmt:message key="nav.administrador"/></a>&nbsp;<i class="icon-right-open"></i>&nbsp;<fmt:message key="nav.administrador.comercio"/></label>					
			</div>
		</div>
	</nav>
	<section aria-expanded="true" aria-hidden="false" class="form-body" role="form">
		<div class="row" role="row">
			<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6" role="separator">
				<label><fmt:message key="label.nome.razao.social"/></label>
				<input autofocus class="form-data validate" maxlength="60" name="obj.nomerazaosocial" pattern="letraNumeroEspacoPontoTracoBarra" required type="text" value="${obj.nomerazaosocial}">
			</div>
			<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6" role="separator">
				<label><fmt:message key="label.nome.fantasia"/></label>
				<input class="form-data validate" maxlength="60" name="obj.nomefantasia" pattern="letraNumeroEspacoPontoTracoBarra" type="text" value="${obj.nomefantasia}">
			</div>
		</div>
		<c:import url="../admDocumento/documento.jsp"/>
		<c:import url="../admContato/contato.jsp"/>
		<c:import url="../admEndereco/endereco.jsp"/>
	</section>
</form>
<nav class="nav-group-tie nav-fixed-bottom" role="complementary">
	<ul>
		<li><button form="formadmcomercio" title="<fmt:message key="button.salvar"/>" type="submit"><i class="icon-floppy"></i>&nbsp;<fmt:message key="button.salvar"/></button></li>
		<li><a href="<c:url value="/administrador/comercio"/>" title="<fmt:message key="button.pesquisar"/>"><i class="icon-search"></i>&nbsp;<fmt:message key="button.pesquisar"/></a></li>
	</ul>
</nav>
<%@include file="/config/footer.jsp"%>