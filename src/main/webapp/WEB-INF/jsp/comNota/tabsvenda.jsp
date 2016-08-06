<%@include file="/config/taglibraries.jsp"%>
<c:set value="${obj.id != null ? '' : 'disabled'}" var="disabled"/>
<ul aria-haspopup="true" class="tab-responsive-default">
	<li aria-controls="content-tab1" aria-labelledby="tab1" aria-selected="false" class="active" role="tab"><a href="#content-tab1" id="tab1" role="presentation"><i class="font-7x icon-doc-inv"></i>&nbsp;<fmt:message key="tab.nota"/></a></li>
	<li aria-controls="content-tab2" aria-labelledby="tab2" aria-selected="false" role="tab"><a ${disabled} href="#content-tab2" id="tab2" role="presentation"><i class="font-7x icon-box"></i>&nbsp;<fmt:message key="tab.item"/></a></li>
	<li aria-controls="content-tab3" aria-labelledby="tab3" aria-selected="false" role="tab"><a ${disabled} href="#content-tab3" id="tab3" role="presentation"><i class="font-7x icon-dollar"></i>&nbsp;<fmt:message key="tab.valor"/></a></li>
</ul>
<div class="no-border tab-group">
	<div aria-expanded="false" aria-hidden="true" aria-labelledby="tab1" class="no-padding" id="content-tab1" role="tabpanel">
		<c:import url="tabNotaVenda.jsp"/>
	</div>
	<div aria-expanded="false" aria-hidden="true" aria-labelledby="tab2" class="no-padding" id="content-tab2" role="tabpanel">
		<c:import url="../comNotaItem/item.jsp"/>
	</div>
	<div aria-expanded="false" aria-hidden="true" aria-labelledby="tab3" class="no-padding" id="content-tab3" role="tabpanel">
		<c:import url="../comNotaCusto/custoVenda.jsp"/>
	</div>
</div>