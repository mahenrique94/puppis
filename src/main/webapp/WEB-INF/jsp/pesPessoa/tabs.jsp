<%@include file="/config/taglibraries.jsp"%>
<ul aria-haspopup="true" class="tab-default">
	<li aria-controls="content-tab1" aria-labelledby="tab1" aria-selected="false" role="tab"><a href="#content-tab1" id="tab1" role="presentation"><fmt:message key="tab.contato"/></a></li>
	<li aria-controls="content-tab2" aria-labelledby="tab2" aria-selected="false" role="tab"><a href="#content-tab2" id="tab2" role="presentation"><fmt:message key="tab.documento"/></a></li>
	<li aria-controls="content-tab3" aria-labelledby="tab3" aria-selected="false" class="active" role="tab"><a href="#content-tab3" id="tab3" role="presentation"><fmt:message key="tab.endereco"/></a></li>
	<c:if test="${obj.tipo.id != 1}">
		<li aria-controls="content-tab4" aria-labelledby="tab4" aria-selected="false" role="tab"><a href="#content-tab4" id="tab4" role="presentation"><fmt:message key="tab.informacoes"/></a></li>
		<li aria-controls="content-tab5" aria-labelledby="tab5" aria-selected="false" role="tab"><a href="#content-tab5" id="tab5" role="presentation"><fmt:message key="tab.informacoes.bancarias"/></a></li>
	</c:if>
</ul>
<div class="tab-group m-bottom-10">
	<div aria-expanded="false" aria-hidden="true" aria-labelledby="tab1" class="no-margin" id="content-tab1" role="tabpanel">
		<nav class="nav-band">
			<a class="btn-xs" data-toggle="modal" href="<c:url value="/contato/formulario/${obj.id}"/>"><span class="icon-plus"></span>&nbsp;<fmt:message key="button.novo"/></a>
		</nav>
		<div class="loadgrid" data-load="<c:url value="/contato/loadgrid/${obj.id}"/>" id="pescontato01"></div>
	</div>
	<div aria-expanded="false" aria-hidden="true" aria-labelledby="tab2" id="content-tab2" role="tabpanel">
		<c:import url="tabDocumento.jsp"/>
	</div>
	<div aria-expanded="false" aria-hidden="true" aria-labelledby="tab3" id="content-tab3" role="tabpanel">
		<c:import url="tabEndereco.jsp"/>
	</div>
	<div aria-expanded="false" aria-hidden="true" aria-labelledby="tab4" id="content-tab4" role="tabpanel">
		<c:import url="tabInformacoes.jsp"/>
	</div>
	<div aria-expanded="false" aria-hidden="true" aria-labelledby="tab5" id="content-tab5" role="tabpanel">
		<c:import url="tabInformacoesBancarias.jsp"/>
	</div>
</div>