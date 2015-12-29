<%@include file="/config/header.jsp" %>
<div class="container-tie">
	<form action="<c:url value="/administrador/comercio"/>" class="form-block" id="formadmcomercio" method="post" name="formadmcomercio" role="form">
		<input type="hidden" name="obj.id" value="${obj.id}">
		<div class="container-header">
			<div class="row">
				<div class="col-xs-12-last col-sm-12-last col-md-12-last col-lg-12-last">
					<h2><fmt:message key="nav.sistema"/>&nbsp;<fmt:message key="label.barra"/>&nbsp;<fmt:message key="nav.sistema.comercio"/></h2>
				</div>
				<div class="col-xs-12-last col-sm-12-last col-md-3 col-lg-2">
					<button class="btn-md float-left m-right-5" title="<fmt:message key="button.salvar"/>" type="submit"><span class="icon-floppy-disk"></span>&nbsp;<fmt:message key="button.salvar"/></button>
					<a href="<c:url value="/administrador/comercio"/>" class="btn-md float-left m-right-5" title="<fmt:message key="button.pesquisar"/>"><span class="icon-search"></span>&nbsp;<fmt:message key="button.pesquisar"/></a>
				</div>
			</div>
		</div>
		<section aria-expanded="true" aria-hidden="false" class="clearfix" role="form">
			<div class="row" role="row">
				<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6" role="separator">
					<label><fmt:message key="label.razao.social"/></label>
					<input autofocus class="input-form" maxlength="60" name="obj.nomerazaosocial" pattern="letraNumeroEspacoPonto" required type="text" value="${obj.nomerazaosocial}">
				</div>
				<div class="col-xs-6-last col-sm-6-last col-md-6-last col-lg-6-last" role="separator">
					<label><fmt:message key="label.nome.fantasia"/></label>
					<input class="input-form full" maxlength="60" name="obj.nomefantasia" pattern="letraNumeroEspacoPonto" required type="text" value="${obj.nomefantasia}">
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
					<div class="row" role="row">
						<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6" role="separator">
							<label><fmt:message key="label.cnpj"/></label>
							<input class="input-form" maxlength="18" name="obj.documento.cpfcnpj" pattern="cpfCnpj" required type="text" value="${obj.documento.cpfcnpj}">
							<netsis:validationMessage name="obj.documento.cnpj"/>
						</div>
						<div class="col-xs-6-last col-sm-6-last col-md-6-last col-lg-6-last" role="separator">
							<label><fmt:message key="label.inscricao.estadual"/></label>
							<input class="input-form" maxlength="15" name="obj.documento.rginscricaoestadual" pattern="rgInscricao" required type="text" value="${obj.documento.rginscricaoestadual}">
							<netsis:validationMessage name="obj.documento.inscricaoestadual"/>
						</div>
					</div>
					<div class="row" role="row">
						<div class="col-xs-2 col-sm-2 col-md-2 col-lg-2" role="separator">
							<label class="align-left"><fmt:message key="label.ddd"/></label>
							<input class="input-form" maxlength="2" name="obj.contato.ddd" pattern="ddd" type="number" value="${obj.contato.ddd}">
							<netsis:validationMessage name="obj.contato.ddd"/>
						</div>
						<div class="col-xs-5 col-sm-5 col-md-5 col-lg-5" role="separator">
							<label class="align-left"><fmt:message key="label.telefone"/></label>
							<input class="input-form" maxlength="9" name="obj.contato.telefone" pattern="telefone" type="text" value="${obj.contato.telefone}">
							<netsis:validationMessage name="obj.contato.telefone"/>
						</div>
						<div class="col-xs-5-last col-sm-5-last col-md-5-last col-lg-5-last" role="separator">
							<label class="align-left"><fmt:message key="label.celular"/></label>
							<input class="input-form" maxlength="11" name="obj.contato.celular" pattern="celular" type="text" value="${obj.contato.celular}">
							<netsis:validationMessage name="obj.contato.celular"/>
						</div>
					</div>
					<div class="row" role="row">	
						<div class="col-xs-12-last col-sm-12-last col-md-12-last col-lg-12-last" role="separator">
							<label class="align-left"><fmt:message key="label.email"/></label>
							<input class="input-form" maxlength="255" name="obj.contato.email" type="email" value="${obj.contato.email}">
							<netsis:validationMessage name="obj.contato.email"/>
						</div>
					</div>
					<span class="band-lube" role="separator"><label><fmt:message key="titulo.endereco"/></label></span>
					<div class="row" role="row">
						<div class="col-xs-2 col-sm-2 col-md-2 col-lg-2" role="separator">
							<label><fmt:message key="label.cep"/></label>
							<input class="input-form" maxlength="12" name="obj.endereco.cep" pattern="cep" required type="text" value="${obj.endereco.cep}">
							<netsis:validationMessage name="obj.endereco.cep"/>
						</div>
						<div class="col-xs-10-last col-sm-10-last col-md-10-last col-lg-10-last" role="separator">
							<label><fmt:message key="label.rua"/></label>
							<input class="input-form" maxlength="60" name="obj.endereco.rua" pattern="letraNumeroEspaco" required type="text" value="${obj.endereco.rua}">
							<netsis:validationMessage name="obj.endereco.rua"/>
						</div>
					</div>
					<div class="row" role="row">
						<div class="col-xs-2 col-sm-2 col-md-2 col-lg-2" role="separator">
							<label><fmt:message key="label.numero"/></label>
							<input class="input-form" maxlength="12" name="obj.endereco.numero" pattern="numeroEndereco" required type="text" value="${obj.endereco.numero}">
							<netsis:validationMessage name="obj.endereco.numero"/>
						</div>
						<div class="col-xs-10-last col-sm-10-last col-md-10-last col-lg-10-last" role="separator">
							<label><fmt:message key="label.bairro"/></label>
							<input class="input-form" maxlength="60" name="obj.endereco.bairro" pattern="letraEspaco" required type="text" value="${obj.endereco.bairro}">
							<netsis:validationMessage name="obj.endereco.bairro"/>
						</div>
					</div>
					<div class="row" role="row">
						<div class="col-xs-12-last col-sm-12-last col-md-12-last col-lg-12-last" role="separator">
							<label><fmt:message key="label.complemento"/></label>
							<input class="input-form" maxlength="30" name="obj.endereco.complemento" pattern="letraEspaco" type="text" value="${obj.endereco.complemento}">
							<netsis:validationMessage name="obj.endereco.complemento"/>
						</div>
					</div>
					<div class="row" role="row">
						<div class="col-xs-2 col-sm-2 col-md-2 col-lg-2" role="separator">
							<label><fmt:message key="label.uf"/></label>
							<select class="select-form" data-class="slCadEstado" id="slCadastro_Estado_json_01" name="obj.endereco.idestado.id" required></select>
							<netsis:validationMessage name="obj.endereco.uf"/>
						</div>
						<div class="col-xs-10-last col-sm-10-last col-md-10-last col-lg-10-last" role="separator">
							<label><fmt:message key="label.cidade"/></label>
							<select class="select-form" data-class="slCadCidade" id="slCadastro_Cidade_json_01" name="obj.endereco.idcidade.id" required></select>
							<netsis:validationMessage name="obj.endereco.cidade"/>
						</div>
					</div>
					<div class="row" role="row">
						<div class="col-xs-12-last col-sm-12-last col-md-12-last col-lg-12-last" role="separator">
							<label><fmt:message key="label.pais"/></label>
							<select class="select-form" data-class="slCadPais" id="slCadastro_Pais_json_01" name="obj.endereco.idpais.id" required></select>
							<netsis:validationMessage name="obj.endereco.pais"/>
						</div>
					</div>
				</c:if>
			</div>
		</section>
	</form>
</div>
<%@include file="/config/footer.jsp"%>