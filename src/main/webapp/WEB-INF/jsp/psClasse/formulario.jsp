<%@include file="/config/header.jsp" %>
<div class="container-tie">
	<form action="<c:url value="/produto-servico/classe"/>" class="form-block" id="formpsclasse" method="post" name="formpsclasse" role="form">
		<input name="openBoxSearch" type="hidden" value="psgrupo">
		<div class="container-header">
			<div class="row">
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
					<h2><fmt:message key="nav.cadastro"/>&nbsp;<fmt:message key="label.barra"/>&nbsp;<fmt:message key="nav.cadastro.produto.servico"/>&nbsp;<fmt:message key="label.barra"/>&nbsp;<fmt:message key="nav.cadastro.produto.servico.classe"/></h2>
				</div>
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
					<button class="btn-md float-left m-right-5" title="<fmt:message key="button.salvar"/>" type="submit"><span class="icon-floppy-disk"></span>&nbsp;<fmt:message key="button.salvar"/></button>
					<a href="<c:url value="/produto-servico/classe"/>" class="btn-md float-left m-right-5" title="<fmt:message key="button.pesquisar"/>"><span class="icon-search"></span>&nbsp;<fmt:message key="button.pesquisar"/></a>
				</div>
			</div>
		</div>
		<section aria-expanded="true" aria-hidden="false" class="clearfix" role="form">
			<div class="row" role="row">
				<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6" role="separator">
					<label><fmt:message key="label.id.grupo"/></label>
					<input class="input-form" data-toggle="modal" formaction="<c:url value="/produto-servico/grupo/listarsl"/>" id="psgrupo_id" maxlength="10" name="obj.idgrupo.id" pattern="numero0a9" type="search" value="${obj.idgrupo.id}">
					<netsis:validationMessage name="obj.idgrupo.id"/>
				</div>
				<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6" role="separator">
					<label><fmt:message key="label.id"/></label>
					<input class="input-form" maxlength="10" name="obj.id" pattern="numero0a9" type="number" value="${obj.id}">
					<netsis:validationMessage name="obj.id"/>
				</div>
			</div>
			<div class="row" role="row">
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" role="separator">
					<label><fmt:message key="label.descricao"/></label>
					<input class="input-form" maxlength="30" name="obj.descricao" pattern="letraNumeroEspaco" required type="text" value="${obj.descricao}">
					<netsis:validationMessage name="obj.descricao"/>
				</div>
			</div>
		</section>
	</form>
</div>
<%@include file="/config/footer.jsp"%>