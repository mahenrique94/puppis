<%@include file="/config/header.jsp" %>
<fieldset class="block-lube">
	<legend class="block-header">
		<h1 class="block-title"><label><fmt:message key="nav.sistema"/>&nbsp;<fmt:message key="label.barra"/>&nbsp;<fmt:message key="nav.sistema.comercio"/></label></h1>
	</legend>
	<form action="<c:url value="/comercio"/>" class="form-inline" id="formlistaradmcomercio" method="post" name="formlistaradmcomercio" role="form">
		<input type="hidden" name="obj.id" value="${obj.id}">
		<nav class="clearfix nav-block" role="navigation">
			<div class="w-100">
				<button class="btn-md float-left m-right-5" title="<fmt:message key="button.salvar"/>" type="submit"><span class="icon-floppy-disk"></span>&nbsp;<fmt:message key="button.salvar"/></button>
				<a href="<c:url value="/comercio"/>" class="btn-md float-left m-right-5" title="<fmt:message key="button.pesquisar"/>"><span class="icon-search"></span>&nbsp;<fmt:message key="button.pesquisar"/></a>
			</div>
		</nav>
		<section aria-expanded="true" aria-hidden="false" class="block-body clearfix" role="form">
			<div class="row-input" role="row">
				<div class="w-50" role="separator">
					<label class="align-left"><fmt:message key="label.razao.social"/></label>
					<input autofocus class="input-form" maxlength="60" name="obj.razaosocial" pattern="letraNumeroEspacoPonto" required type="text" value="${obj.razaosocial}">
				</div>
				<div class="w-50" role="separator">
					<label class="align-left"><fmt:message key="label.nome.fantasia"/></label>
					<input class="input-form full" maxlength="60" name="obj.nomefantasia" pattern="letraNumeroEspacoPonto" required type="text" value="${obj.nomefantasia}">
				</div>
			</div>
			<c:if test="${obj.id != null}">
				<input type="hidden" name="obj.documento.id" value="${obj.documento.id}">
				<input type="hidden" name="obj.documento.idcomercio.id" value="${obj.documento.idcomercio.id}">
				<input type="hidden" name="obj.contato.id" value="${obj.contato.id}">
				<input type="hidden" name="obj.contato.idcomercio.id" value="${obj.contato.idcomercio.id}">
				<input type="hidden" name="obj.endereco.id" value="${obj.endereco.id}">
				<input type="hidden" name="obj.endereco.idcomercio.id" value="${obj.endereco.idcomercio.id}">
				<input type="hidden" name="obj.endereco.idestado.idaux" value="${obj.endereco.idestado.id}">
				<input type="hidden" name="obj.endereco.idcidade.idaux" value="${obj.endereco.idcidade.id}">
				<input type="hidden" name="obj.endereco.idpais.idaux" value="${obj.endereco.idpais.id}">
				<div class="row-input" role="row">
					<div class="w-50" role="separator">
						<label class="align-left"><fmt:message key="label.cnpj"/></label>
						<input class="input-form" maxlength="18" name="obj.documento.cnpj" pattern="cpfCnpj" required type="text" value="${obj.documento.cnpj}">
						<netsis:validationMessage name="obj.documento.cnpj"/>
					</div>
					<div class="w-50" role="separator">
						<label class="align-left"><fmt:message key="label.inscricao.estadual"/></label>
						<input class="input-form full" maxlength="15" name="obj.documento.inscricaoestadual" pattern="rgInscricao" required type="text" value="${obj.documento.inscricaoestadual}">
						<netsis:validationMessage name="obj.documento.inscricaoestadual"/>
					</div>
				</div>
				<div class="row-input" role="row">
					<div class="w-25" role="separator">
						<label class="align-left"><fmt:message key="label.ddd"/></label>
						<input class="input-form" maxlength="2" name="obj.contato.ddd" pattern="ddd" type="number" value="${obj.contato.ddd}">
						<netsis:validationMessage name="obj.contato.ddd"/>
					</div>
					<div class="w-75" role="separator">
						<label class="align-left"><fmt:message key="label.telefone"/></label>
						<input class="input-form full" maxlength="9" name="obj.contato.telefone" pattern="telefone" type="text" value="${obj.contato.telefone}">
						<netsis:validationMessage name="obj.contato.telefone"/>
					</div>
				</div>
				<div class="row-input" role="row">	
					<div class="w-100" role="separator">
						<label class="align-left"><fmt:message key="label.email"/></label>
						<input class="input-form full" maxlength="255" name="obj.contato.email" type="email" value="${obj.contato.email}">
						<netsis:validationMessage name="obj.contato.email"/>
					</div>
				</div>
				<span class="band-lube" role="separator"><label><fmt:message key="titulo.endereco"/></label></span>
				<div class="row-input" role="row">
					<div class="w-25" role="separator">
						<label class="align-left"><fmt:message key="label.cep"/></label>
						<input class="input-form" maxlength="12" name="obj.endereco.cep" pattern="cep" required type="text" value="${obj.endereco.cep}">
						<netsis:validationMessage name="obj.endereco.cep"/>
					</div>
					<div class="w-75" role="separator">
						<label class="align-left"><fmt:message key="label.rua"/></label>
						<input class="input-form full" maxlength="60" name="obj.endereco.rua" pattern="letraNumeroEspaco" required type="text" value="${obj.endereco.rua}">
						<netsis:validationMessage name="obj.endereco.rua"/>
					</div>
				</div>
				<div class="row-input" role="row">
					<div class="w-25" role="separator">
						<label class="align-left"><fmt:message key="label.numero"/></label>
						<input class="input-form" maxlength="12" name="obj.endereco.numero" pattern="numeroEndereco" required type="text" value="${obj.endereco.numero}">
						<netsis:validationMessage name="obj.endereco.numero"/>
					</div>
					<div class="w-75" role="separator">
						<label class="align-left"><fmt:message key="label.bairro"/></label>
						<input class="input-form full" maxlength="60" name="obj.endereco.bairro" pattern="letraEspaco" required type="text" value="${obj.endereco.bairro}">
						<netsis:validationMessage name="obj.endereco.bairro"/>
					</div>
				</div>
				<div class="row-input" role="row">
					<div class="w-100" role="separator">
						<label class="align-left"><fmt:message key="label.complemento"/></label>
						<input class="input-form full" maxlength="30" name="obj.endereco.complemento" pattern="letraEspaco" type="text" value="${obj.endereco.complemento}">
						<netsis:validationMessage name="obj.endereco.complemento"/>
					</div>
				</div>
				<div class="row-input" role="row">
					<div class="w-25" role="separator">
						<label class="align-left"><fmt:message key="label.uf"/></label>
						<select class="select-form" data-class="slCadEstado" id="slEstado_json_01" name="obj.endereco.idestado.id" required></select>
						<netsis:validationMessage name="obj.endereco.uf"/>
					</div>
					<div class="w-75" role="separator">
						<label class="align-left"><fmt:message key="label.cidade"/></label>
						<select class="select-form full-select" data-class="slCadCidade" id="slCidade_json_01" name="obj.endereco.idcidade.id" required></select>
						<netsis:validationMessage name="obj.endereco.cidade"/>
					</div>
				</div>
				<div class="row-input" role="row">
					<div class="w-100" role="separator">
						<label class="align-left"><fmt:message key="label.pais"/></label>
						<select class="select-form full-select" data-class="slCadPais" id="slPais_json_01" name="obj.endereco.idpais.id" required></select>
						<netsis:validationMessage name="obj.endereco.pais"/>
					</div>
				</div>
			</c:if>
		</section>
	</form>
</fieldset>
<%@include file="/config/footer.jsp"%>