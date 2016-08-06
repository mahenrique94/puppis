<%@include file="/config/taglibraries.jsp"%>
<c:set value="${obj.id != null ? '' : 'disabled'}" var="disabled"/>
<ul aria-haspopup="true" class="tab-responsive-default">
	<li aria-controls="content-tab1" aria-labelledby="tab1" aria-selected="false" class="active" role="tab"><a href="#content-tab1" id="tab1" role="presentation"><i class="font-7x icon-user"></i>&nbsp;<fmt:message key="tab.usuario"/></a></li>
	<li aria-controls="content-tab2" aria-labelledby="tab2" aria-selected="false" role="tab"><a ${disabled} href="#content-tab2" id="tab2" role="presentation"><i class="font-7x icon-building"></i>&nbsp;<fmt:message key="tab.comercio"/></a></li>
</ul>
<div class="no-border tab-group">
	<div aria-expanded="false" aria-hidden="true" aria-labelledby="tab1" class="no-padding" id="content-tab1" role="tabpanel">
		<c:import url="tabUsuario.jsp"/>
	</div>
	<div aria-expanded="false" aria-hidden="true" aria-labelledby="tab2" class="no-padding" id="content-tab2" role="tabpanel">
		<c:import url="../admUsuarioComercio/usuarioComercio.jsp"></c:import>
	</div>
</div>