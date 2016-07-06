<%@include file="/config/header.jsp" %>
<form action="<c:url value="/financeiro/forma-de-pagamento"/>" class="form-modern" id="formfinformapagamento" method="post" name="formfinformapagamento" role="form">
	<input name="obj.id" type="hidden" value="${obj.id}">
	<nav class="band-nav-lube" role="complementary">
		<div class="row" role="row">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" role="separator">
				<label><a href="<c:url value="/dashboard/cadastro"/>"><fmt:message key="nav.cadastro"/></a>&nbsp;<i class="icon-right-open"></i>&nbsp;<fmt:message key="nav.cadastro.forma.pagamento"/></label>					
			</div>
		</div>
	</nav>
	<section aria-expanded="true" aria-hidden="false" class="form-body" role="form">
		<div class="row-input" role="row">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" role="separator">
				<label><fmt:message key="label.descricao"/></label>
				<input autofocus class="form-data validate" maxlength="30" name="obj.descricao" pattern="letraNumeroEspaco" required type="text" value="${obj.descricao}">
				<netsis:validationMessage name="obj.descricao"/>
			</div>
		</div>
		<div class="row-input" role="row">
			<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6" role="separator">
				<label><fmt:message key="label.quantidade.parcela"/></label>
				<input class="form-data validate" min="0" name="obj.quantidadeparcela" pattern="numero0a9" required type="number" value="${obj.quantidadeparcela}">
				<netsis:validationMessage name="obj.quantidadeparcela"/>
			</div>
			<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6" role="separator">
				<label><fmt:message key="label.intervalo"/></label>
				<input class="form-data validate" min="0" name="obj.intervalo" pattern="numero0a9" required type="number" value="${obj.intervalo}">
				<netsis:validationMessage name="obj.intervalo"/>
			</div>
		</div>
	</section>
	<nav class="nav-group-tie nav-fixed-bottom" role="complementary">
		<ul>
			<li><button title="<fmt:message key="button.salvar"/>" type="submit"><i class="icon-floppy"></i>&nbsp;<fmt:message key="button.salvar"/></button></li>
			<li><a href="<c:url value="/financeiro/forma-de-pagamento"/>" title="<fmt:message key="button.pesquisar"/>"><i class="icon-search"></i>&nbsp;<fmt:message key="button.pesquisar"/></a></li>
		</ul>
	</nav>
</form>
<%@include file="/config/footer.jsp"%>