<%@include file="/config/header.jsp" %>
<form action="<c:url value="/cadastro/centro-de-custo"/>" class="form-modern" id="formcadcentrocusto" method="post" name="formcadcentrocusto" role="form">
	<input name="obj.id" type="hidden" value="${obj.id}">
	<input name="obj.idcentrocustomaster.idaux" type="hidden" value="${obj.idcentrocustomaster.id}">
	<nav class="band-nav-lube" role="complementary">
		<div class="row" role="row">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" role="separator">
				<label><a href="<c:url value="/dashboard/cadastro"/>"><fmt:message key="nav.cadastro"/></a>&nbsp;<i class="icon-right-open"></i>&nbsp;<fmt:message key="nav.cadastro.centro.custo"/></label>					
			</div>
		</div>
	</nav>
	<section aria-expanded="true" aria-hidden="false" class="form-body" role="form">
		<div class="row" role="row">
			<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6" role="separator">
				<label><fmt:message key="label.descricao"/></label>
				<input autofocus class="form-data validate" maxlength="60" name="obj.descricao" pattern="letraEspaco" required type="text" value="${obj.descricao}">
				<netsis:validationMessage name="obj.descricao"/>
			</div>
			<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6" role="separator">
				<label><fmt:message key="label.descricao.master"/></label>
				<select class="form-data ss validate" data-class="sl" id="slCadastro_Centro-de-Custo_Json_01" required name="obj.idcentrocustomaster.id"></select>
				<netsis:validationMessage name="obj.idcentrocustomaster.id"/>
			</div>
		</div>
	</section>
</form>
<nav class="nav-group-tie nav-fixed-bottom" role="complementary">
	<ul>
		<li><button form="formcadcentrocusto" title="<fmt:message key="button.salvar"/>" type="submit"><i class="icon-floppy"></i>&nbsp;<fmt:message key="button.salvar"/></button></li>
		<li><a href="<c:url value="/cadastro/centro-de-custo"/>" title="<fmt:message key="button.pesquisar"/>"><i class="icon-search"></i>&nbsp;<fmt:message key="button.pesquisar"/></a></li>
	</ul>
</nav>
<%@include file="/config/footer.jsp"%>