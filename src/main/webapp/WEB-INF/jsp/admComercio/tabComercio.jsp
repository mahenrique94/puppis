<%@include file="/config/taglibraries.jsp"%>
<section aria-expanded="true" aria-hidden="false" class="form-body" role="form">
	<input name="obj.id" type="hidden" value="${obj.id}">
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
	<c:import url="../admPagamento/pagamento.jsp"/>
</section>