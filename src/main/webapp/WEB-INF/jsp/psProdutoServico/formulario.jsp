<%@include file="/config/header.jsp" %>
<fieldset class="block-lube">
	<legend class="block-header">
		<h1 class="block-title"><label><fmt:message key="nav.cadastro"/>&nbsp;<fmt:message key="label.barra"/>&nbsp;<fmt:message key="nav.cadastro.produto.servico"/></label></h1>
	</legend>
	<form action="<c:url value="/produto-servico"/>" class="form-inline" id="formlistarpsprodutoservico" method="post" name="formlistarpsprodutoservico" role="form">
		<input type="hidden" name="openBoxSearch" value="psclasse">
		<input type="hidden" name="obj.idtipo.idaux" value="${obj.idtipo.id}">
		<input type="hidden" name="obj.idunidademedida.idaux" value="${obj.idunidademedida.id}">
		<nav class="clearfix nav-block" role="navigation">
			<div class="w-100">
				<button class="btn-md float-left m-right-5" title="<fmt:message key="button.salvar"/>" type="submit"><span class="icon-floppy-disk"></span>&nbsp;<fmt:message key="button.salvar"/></button>
				<a href="<c:url value="/produto-servico"/>" class="btn-md float-left m-right-5" title="<fmt:message key="button.pesquisar"/>"><span class="icon-search"></span>&nbsp;<fmt:message key="button.pesquisar"/></a>
			</div>
		</nav>
		<section aria-expanded="true" aria-hidden="false" class="block-body clearfix" role="form">
			<div class="row-input" role="row">
				<div class="w-25" role="separator">
					<label class="align-left"><fmt:message key="label.id.grupo"/></label>
					<input autofocus class="input-form" id="psclasse_idgrupo_id" maxlength="10" name="obj.idgrupo.id" pattern="numero0a9" required type="number" value="${obj.idgrupo.id}">
					<netsis:validationMessage name="obj.idgrupo.id"/>
				</div>
				<div class="w-25" role="separator">
					<label class="align-left"><fmt:message key="label.id.classe"/></label>
					<input class="input-form" data-toggle="modal" formaction="<c:url value="/produto-servico/classe/listarsl"/>" id="psclasse_id" maxlength="10" name="obj.idclasse.id" pattern="numero0a9" required type="search" value="${obj.idclasse.id}">
					<netsis:validationMessage name="obj.idclasse.id"/>
				</div>
				<div class="w-25" role="separator">
					<label class="align-left"><fmt:message key="label.id"/></label>
					<input class="input-form" maxlength="10" name="obj.id" pattern="numero0a9" readonly required type="number" value="${obj.id}">
					<netsis:validationMessage name="obj.id"/>
				</div>
				<div class="w-25" role="separator">
					<label class="align-left"><fmt:message key="label.tipo"/></label>
					<select class="select-form full-select" data-class="slPsTipo" id="slProduto-servico_tipo_json_1" name="obj.idtipo.id"></select>
					<netsis:validationMessage name="obj.id"/>
				</div>
			</div>
			<div class="row-input" role="row">
				<div class="w-80" role="separator">
					<label class="align-left"><fmt:message key="label.descricao"/></label>
					 <input class="input-form" maxlength="120" name="obj.descricao" pattern="letraNumeroEspaco" required type="text" value="${obj.descricao}">
					<netsis:validationMessage name="obj.descricao"/>
				</div>
				<div class="w-20" role="separator">
					<label class="align-left"><fmt:message key="label.unidade.medida"/></label>
					 <select class="select-form full-select" data-class="slPsUnidadeMedida" id="slProduto-Servico_Unidade-de-medida_json_1" name="obj.idunidademedida.id"></select>
					<netsis:validationMessage name="obj.idunidademedida.id"/>
				</div>
			</div>
			<div class="row-input" role="row">
				<div class="w-40" role="separator">
					<label class="align-left"><fmt:message key="label.marca"/></label>
					 <input class="input-form" maxlength="30" name="obj.marca" pattern="letraNumeroEspaco" type="text" value="${obj.marca}">
					<netsis:validationMessage name="obj.marca"/>
				</div>
				<div class="w-40" role="separator">
					<label class="align-left"><fmt:message key="label.codigo.barra"/></label>
					 <input class="input-form" maxlength="120" name="obj.codigobarra" pattern="letraNumero" type="text" value="${obj.codigobarra}">
					<netsis:validationMessage name="obj.codigobarra"/>
				</div>
				<div class="w-20" role="separator">
					<label class="align-left"><fmt:message key="label.aceita.desconto"/></label>
					 <input <c:if test="${obj.aceitadesconto.equals('T')}">checked</c:if> class="input-form full" name="obj.aceitadesconto" type="checkbox" value="T">
					<netsis:validationMessage name="obj.aceitadesconto"/>
				</div>
			</div>
			<div class="row-input" role="row">
				<div class="w-100" role="separator">
					<label class="align-left"><fmt:message key="label.inativo"/></label>
					 <input <c:if test="${obj.inativo.equals('T')}">checked</c:if> class="input-form full" name="obj.inativo" type="checkbox" value="T">
					<netsis:validationMessage name="obj.inativo"/>
				</div>
			</div>
			<c:if test="${obj.id != null}">
				<c:import url="tabs.jsp"/>
			</c:if>
		</section>
	</form>
</fieldset>
<%@include file="/config/footer.jsp"%>