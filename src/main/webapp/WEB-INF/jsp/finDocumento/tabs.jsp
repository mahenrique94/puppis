<%@include file="/config/taglibraries.jsp"%>
<ul aria-haspopup="true" class="tab-default">
	<li aria-controls="content-tab1" aria-labelledby="tab1" aria-selected="false" class="active" role="tab"><a href="#content-tab1" id="tab1" role="presentation"><fmt:message key="tab.custo"/></a></li>
	<li aria-controls="content-tab2" aria-labelledby="tab2" aria-selected="false" role="tab"><a href="#content-tab2" id="tab2" role="presentation"><fmt:message key="tab.centro.custo"/></a></li>
</ul>
<div class="tab-group m-bottom-10">
	<div aria-expanded="false" aria-hidden="true" aria-labelledby="tab1" class="no-padding" id="content-tab1" role="tabpanel">
		<nav class="nav-band">
			<a class="btn-xs" href="<c:url value="/financeiro/documento/calcular"/>"><span class="icon-usd"></span>&nbsp;<fmt:message key="button.calcular"/></a>
		</nav>
		<div class="loadgrid" data-load="<c:url value="/financeiro/documento/custo/loadgrid/${obj.id}"/>" id="findocumentocusto01"></div>
	</div>
	<div aria-expanded="false" aria-hidden="true" aria-labelledby="tab2" class="no-padding" id="content-tab2" role="tabpanel">
		<nav class="nav-band">
			<a class="btn-xs" data-toggle="modal" href="<c:url value="/financeiro/documento/centro-de-custo/formulario/${obj.id}"/>"><span class="icon-plus"></span>&nbsp;<fmt:message key="button.novo"/></a>
		</nav>
		<div class="loadgrid" data-load="<c:url value="/financeiro/documento/centro-de-custo/loadgrid/${obj.id}"/>" id="findocumentocentrocusto01"></div>
	</div>
</div>