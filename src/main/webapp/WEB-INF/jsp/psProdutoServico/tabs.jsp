<%@include file="/config/taglibraries.jsp"%>
<ul aria-haspopup="true" class="tab-default">
	<li aria-controls="content-tab1" aria-labelledby="tab1" aria-selected="false" role="tab"><a href="#content-tab1" id="tab1" role="presentation"><fmt:message key="tab.custo"/></a></li>
	<li aria-controls="content-tab2" aria-labelledby="tab2" aria-selected="false" class="active" role="tab"><a href="#content-tab2" id="tab2" role="presentation"><fmt:message key="tab.estoque"/></a></li>
</ul>
<div class="tab-group m-bottom-10">
	<div aria-expanded="false" aria-hidden="true" aria-labelledby="tab1" id="content-tab1" role="tabpanel">
		<c:import url="tabCusto.jsp"/>
	</div>
	<div aria-expanded="false" aria-hidden="true" aria-labelledby="tab2" id="content-tab2" role="tabpanel">
		<c:import url="tabEstoque.jsp"/>
	</div>
</div>