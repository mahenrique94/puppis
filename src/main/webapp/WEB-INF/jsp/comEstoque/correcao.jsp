<%@include file="/config/header.jsp" %>
<form action="<c:url value="/comercio/estoque/correcao"/>" class="form-modern" id="formcomestoque" method="post" name="formcomestoque" role="form">
	<nav class="band-nav-lube" role="complementary">
		<div class="row" role="row">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" role="separator">
				<label><a href="<c:url value="/dashboard/comercio"/>"><fmt:message key="nav.comercio"/></a>&nbsp;<i class="icon-right-open"></i>&nbsp;<fmt:message key="nav.comercio.correcao.estoque"/></label>					
			</div>
		</div>
	</nav>
	<section aria-expanded="true" aria-hidden="false" class="form-body" role="form">
		<div class="row" role="row">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" role="separator">
				<label><fmt:message key="label.movimento.tipo"/></label>
				<select class="form-data ss validate" data-class="sl" id="slProduto-Servico_Movimento_Tipo_json_01" required name="idMovimento"></select>
			</div>
		</div>
		<div class="row" role="row">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" role="separator">
				<label><fmt:message key="label.produto.servico"/></label>
				<select class="form-data ss validate" data-class="sl" id="slProduto-Servico_json_01" required name="idProduto"></select>
			</div>
		</div>
		<div class="row" role="row">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" role="separator">
				<label><fmt:message key="label.quantidade"/></label>
				<input class="form-data validate" maxlength="10" name="quantidade" pattern="numeric10_2" required type="text">
			</div>
		</div>
	</section>
	<nav class="nav-group-tie nav-fixed-bottom" role="complementary">
		<ul>
			<li><button title="<fmt:message key="button.processar"/>" type="submit"><i class="icon-spin6"></i>&nbsp;<fmt:message key="button.processar"/></button></li>
		</ul>
	</nav>
</form>
<%@include file="/config/footer.jsp"%>