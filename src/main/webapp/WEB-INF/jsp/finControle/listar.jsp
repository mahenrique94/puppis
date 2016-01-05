<%@include file="/config/header.jsp"%>
<div class="container-tie">
	<div class="container-header">
		<form action="<c:url value="/financeiro/controle"/>" class="form-search" id="formlistarfincontrole" method="get" name="formlistarfincontrole" role="search">
			<div class="row">
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
					<h2><fmt:message key="nav.financeiro"/>&nbsp;<fmt:message key="label.barra"/>&nbsp;<fmt:message key="nav.financeiro.controle"/></h2>					
				</div>
				<div class="col-xs-12 col-sm-12 col-md-2 col-lg-1">
					<a href="<c:url value="/financeiro/controle/formulario"/>" class="btn-md float-left" title="<fmt:message key="button.novo"/>"><span class="icon-plus"></span>&nbsp;<fmt:message key="button.novo"/></a>
				</div>
				<div class="col-xs-4 col-sm-4 col-md-3 col-lg-2">
					<select class="select-search" data-class="displaytagSelect" name="parametrosWeb[0].campo"></select>
				</div>
				<div class="col-xs-8 col-sm-8 col-md-7 col-lg-9">
					<input autocomplete="off" class="input-search" name="parametrosWeb[0].parametro" pattern="letraNumeroEspacoPontoTracoBarra" type="search">
				</div>
			</div>
		</form>
	</div>
	<display:table class="table-default" export="false" id="obj" name="${FinControleList}" requestURI="/financeiro/controle">
		<display:column headerScope="idcontabancaria.idbanco.descricao" property="idcontabancaria.idbanco.descricao" titleKey="displaytag.banco"/>
		<display:column headerScope="idcontabancaria.nometitular" property="idcontabancaria.nometitular" titleKey="displaytag.nome.titular"/>
		<display:column headerScope="rendamensal" property="rendamensal" titleKey="displaytag.renda.mensal"/>
		<display:column headerScope="saldo" property="saldo" titleKey="displaytag.saldo"/>
		<display:column style="width: 150px;text-align: center;">
			<a class="btn-xs" href="<c:url value="/financeiro/controle/${obj.id}"/>"><span class="icon-pencil"></span>&nbsp;<fmt:message key="button.editar"/></a>
			<a class="btn-xs" href="<c:url value="/financeiro/controle/${obj.id}"/>" onclick="deletar(this);"><span class="icon-trash"></span>&nbsp;<fmt:message key="button.deletar"/></a>
		</display:column>
	</display:table>
</div>
<%@include file="/config/footer.jsp"%>