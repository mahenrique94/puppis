<%@include file="/config/header.jsp" %>
<form action="<c:url value="/produto-servico/classe"/>" class="form-modern" id="formpsclasse" method="post" name="formpsclasse" role="form">
	<input name="obj.idgrupo.idaux" type="hidden" value="${obj.idgrupo.id }">
	<nav class="band-nav-lube" role="complementary">
		<div class="row" role="row">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" role="separator">
				<label><a href="<c:url value="/dashboard/cadastro"/>"><fmt:message key="nav.cadastro"/></a>&nbsp;<i class="icon-right-open"></i>&nbsp;<a href="<c:url value="/dashboard/produtoServico"/>"><fmt:message key="nav.cadastro.produto.servico"/></a>&nbsp;<i class="icon-right-open"></i>&nbsp;<fmt:message key="nav.cadastro.produto.servico.classe"/></label>					
			</div>
		</div>
	</nav>
	<section aria-expanded="true" aria-hidden="false" class="form-body" role="form">
		<div class="row" role="row">
			<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6" role="separator">
				<label><fmt:message key="label.id.grupo"/></label>
				<select class="form-data ss validate" data-class="sl" id="slProduto-Servico_Grupo_Json_01" name="obj.idgrupo.id"></select>
				<netsis:validationMessage name="obj.idgrupo.id"/>
			</div>
			<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6" role="separator">
				<label><fmt:message key="label.id"/></label>
				<input class="form-data validate" maxlength="10" name="obj.id" pattern="numero0a9" type="number" value="${obj.id}">
				<netsis:validationMessage name="obj.id"/>
			</div>
		</div>
		<div class="row" role="row">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" role="separator">
				<label><fmt:message key="label.descricao"/></label>
				<input class="form-data validate" maxlength="30" name="obj.descricao" pattern="letraNumeroEspaco" required type="text" value="${obj.descricao}">
				<netsis:validationMessage name="obj.descricao"/>
			</div>
		</div>
	</section>
</form>
<nav class="nav-group-tie nav-fixed-bottom" role="complementary">
	<ul>
		<li><button form="formpsclasse" title="<fmt:message key="button.salvar"/>" type="submit"><i class="icon-floppy"></i>&nbsp;<fmt:message key="button.salvar"/></button></li>
		<li><a href="<c:url value="/produto-servico/classe"/>" title="<fmt:message key="button.pesquisar"/>"><i class="icon-search"></i>&nbsp;<fmt:message key="button.pesquisar"/></a></li>
	</ul>
</nav>
<%@include file="/config/footer.jsp"%>