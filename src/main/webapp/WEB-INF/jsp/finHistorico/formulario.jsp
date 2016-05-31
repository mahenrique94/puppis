<%@include file="/config/header.jsp" %>
<form action="<c:url value="/financeiro/historico"/>" class="form-modern" id="formfinhistorico" method="post" name="formfinhistorico" role="form">
	<input name="obj.id" type="hidden" value="${obj.id}">
	<nav class="band-nav-lube" role="complementary">
		<div class="row" role="row">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" role="separator">
				<label><a href="<c:url value="/dashboard/cadastro"/>"><fmt:message key="nav.financeiro"/></a>&nbsp;<i class="icon-right-open"></i>&nbsp;<fmt:message key="nav.cadastro.historico"/></label>					
			</div>
		</div>
	</nav>
	<section aria-expanded="true" aria-hidden="false" class="form-body" role="form">
			<div class="row-input" role="row">
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" role="separator">
					<label><fmt:message key="label.historico"/></label>
					<textarea autofocus class="form-data validate" name="obj.descricao" pattern="textarea" required rows="10">${obj.descricao}</textarea>
					<netsis:validationMessage name="obj.descricao"/>
				</div>
			</div>
		</section>
</form>
<nav class="nav-group-lube nav-fixed-bottom" role="complementary">
	<ul>
		<li><button form="formfinhistorico" title="<fmt:message key="button.salvar"/>" type="submit"><i class="icon-floppy"></i>&nbsp;<fmt:message key="button.salvar"/></button></li>
		<li><a href="<c:url value="/financeiro/historico"/>" title="<fmt:message key="button.pesquisar"/>"><i class="icon-search"></i>&nbsp;<fmt:message key="button.pesquisar"/></a></li>
	</ul>
</nav>
<%@include file="/config/footer.jsp"%>