<%@include file="/config/taglibraries.jsp"%>
<c:set var="disabled" value="${obj.id != null ?  '' : 'is-inactive'}"/>
<div class="c-tabs">
	<ul class="c-tab--lube c-tab--full" role="tablist">
		<li><a aria-controls="c-tab__body--1" aria-selected="true" class="c-tab__item is-active" href="#c-tab__body--1" id="c-tab__item--1" onclick="TabController.toggle(this, event);" role="tab" title="<fmt:message key="tab.documento"/>"><i class="icon-doc-inv"></i>&nbsp;<fmt:message key="tab.documento"/></a></li>
		<li><a aria-controls="c-tab__body--2" aria-selected="false" class="c-tab__item ${disabled}" href="#c-tab__body--2" id="c-tab__item--2" onclick="TabController.toggle(this, event);" role="tab" title="<fmt:message key="tab.centro.custo"/>"><i class="icon-dollar"></i>&nbsp;<fmt:message key="tab.centro.custo"/></a></li>
	</ul>
	<section class="c-tab__group">
		<div aria-expanded="true" aria-hidden="false" aria-labelledby="c-tab__item--1" class="c-tab__body is-show" id="c-tab__body--1" role="tabpanel">
			<c:import url="tabDocumento.jsp"/>
		</div>
		<div aria-expanded="false" aria-hidden="true" aria-labelledby="c-tab__item--2" class="c-tab__body is-hide" id="c-tab__body--2" role="tabpanel">
			<c:import url="../finDocumentoCentroCusto/centroCusto.jsp"/>
		</div>
	</section>
</div>