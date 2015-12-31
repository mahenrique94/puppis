<%@include file="/config/header.jsp" %>
<div class="container-tie">
	<form action="<c:url value="/produto-servico"/>" class="form-block" id="formpsprodutoservico" method="post" name="formpsclasse" role="form">
		<input type="hidden" name="openBoxSearch" value="psclasse">
		<input type="hidden" name="obj.idtipo.idaux" value="${obj.idtipo.id}">
		<input type="hidden" name="obj.idunidademedida.idaux" value="${obj.idunidademedida.id}">
		<div class="container-header">
			<div class="row">
				<div class="col-xs-12-last col-sm-12-last col-md-12-last col-lg-12-last">
					<h2><fmt:message key="nav.cadastro"/>&nbsp;<fmt:message key="label.barra"/>&nbsp;<fmt:message key="nav.cadastro.produto.servico"/></h2>
				</div>
				<div class="col-xs-12-last col-sm-12-last col-md-12 col-lg-12">
					<button class="btn-md float-left m-right-5" title="<fmt:message key="button.salvar"/>" type="submit"><span class="icon-floppy-disk"></span>&nbsp;<fmt:message key="button.salvar"/></button>
					<a href="<c:url value="/produto-servico"/>" class="btn-md float-left m-right-5" title="<fmt:message key="button.pesquisar"/>"><span class="icon-search"></span>&nbsp;<fmt:message key="button.pesquisar"/></a>
				</div>
			</div>
		</div>
		<section aria-expanded="true" aria-hidden="false" class="clearfix" role="form">
			<div class="row" role="row">
				<div class="col-xs-3 col-sm-3 col-md-3 col-lg-3" role="separator">
					<label><fmt:message key="label.id.grupo"/></label>
					<input autofocus class="input-form" id="psclasse_idgrupo_id" maxlength="10" name="obj.idgrupo.id" pattern="numero0a9" required type="number" value="${obj.idgrupo.id}">
					<netsis:validationMessage name="obj.idgrupo.id"/>
				</div>
				<div class="col-xs-3 col-sm-3 col-md-3 col-lg-3" role="separator">
					<label><fmt:message key="label.id.classe"/></label>
					<input class="input-form" data-toggle="modal" formaction="<c:url value="/produto-servico/classe/listarsl"/>" id="psclasse_id" maxlength="10" name="obj.idclasse.id" pattern="numero0a9" required type="search" value="${obj.idclasse.id}">
					<netsis:validationMessage name="obj.idclasse.id"/>
				</div>
				<div class="col-xs-3 col-sm-3 col-md-3 col-lg-3" role="separator">
					<label><fmt:message key="label.id"/></label>
					<input class="input-form" maxlength="10" name="obj.id" pattern="numero0a9" readonly required type="number" value="${obj.id}">
					<netsis:validationMessage name="obj.id"/>
				</div>
				<div class="col-xs-3-last col-sm-3-last col-md-3-last col-lg-3-last" role="separator">
					<label><fmt:message key="label.tipo"/></label>
					<select class="select-form" data-class="slPsTipo" id="slProduto-servico_tipo_json_1" name="obj.idtipo.id"></select>
					<netsis:validationMessage name="obj.id"/>
				</div>
			</div>
			<div class="row" role="row">
				<div class="col-xs-10 col-sm-10 col-md-10 col-lg-10" role="separator">
					<label><fmt:message key="label.descricao"/></label>
					 <input class="input-form" maxlength="120" name="obj.descricao" pattern="letraNumeroEspaco" required type="text" value="${obj.descricao}">
					<netsis:validationMessage name="obj.descricao"/>
				</div>
				<div class="col-xs-2-last col-sm-2-last col-md-2-last col-lg-2-last" role="separator">
					<label><fmt:message key="label.unidade.medida"/></label>
					 <select class="select-form" data-class="slPsUnidadeMedida" id="slProduto-Servico_Unidade-de-medida_json_1" name="obj.idunidademedida.id"></select>
					<netsis:validationMessage name="obj.idunidademedida.id"/>
				</div>
			</div>
			<div class="row" role="row">
				<div class="col-xs-5 col-sm-5 col-md-5 col-lg-5" role="separator">
					<label><fmt:message key="label.marca"/></label>
					 <input class="input-form" maxlength="30" name="obj.marca" pattern="letraNumeroEspaco" type="text" value="${obj.marca}">
					<netsis:validationMessage name="obj.marca"/>
				</div>
				<div class="col-xs-5 col-sm-5 col-md-5 col-lg-5" role="separator">
					<label><fmt:message key="label.codigo.barra"/></label>
					 <input class="input-form" maxlength="120" name="obj.codigobarra" pattern="letraNumero" type="text" value="${obj.codigobarra}">
					<netsis:validationMessage name="obj.codigobarra"/>
				</div>
				<div class="col-xs-2-last col-sm-2-last col-md-2-last col-lg-2-last" role="separator">
					<label><fmt:message key="label.aceita.desconto"/></label>
					 <input <c:if test="${obj.aceitadesconto == true}">checked</c:if> class="input-form" name="obj.aceitadesconto" type="checkbox" value="T">
					<netsis:validationMessage name="obj.aceitadesconto"/>
				</div>
			</div>
			<div class="row" role="row">
				<div class="col-xs-12-last col-sm-12-last col-md-12-last col-lg-12-last" role="separator">
					<label><fmt:message key="label.inativo"/></label>
					 <input <c:if test="${obj.inativo == true}">checked</c:if> class="input-form" name="obj.inativo" type="checkbox" value="T">
					<netsis:validationMessage name="obj.inativo"/>
				</div>
			</div>
			<c:if test="${obj.id != null}">
				<c:import url="tabs.jsp"/>
			</c:if>
		</section>
	</form>
</div>
<%@include file="/config/footer.jsp"%>