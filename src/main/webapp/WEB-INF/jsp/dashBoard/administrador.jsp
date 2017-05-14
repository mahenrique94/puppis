<%@include file="/config/header-dashboard.jsp"%>
<%@include file="/config/modulos.jsp"%>
<section class="o-dashboard">
	<div class="o-dashboard__breadcrumb">
		<div class="o-breadcrumb--arrow">
			<span class="o-breadcrumb__link"><a href="<c:url value="/dashboard"/>" role="link" title="<fmt:message key="nav.dashboard"/>"><fmt:message key="nav.dashboard"/></a></span>
			<span class="o-breadcrumb__link"><a class="is-inactive" href="#" role="link" title="<fmt:message key="nav.administrador"/>"><fmt:message key="nav.administrador"/></a></span>
			<c:import url="loginInfo.jsp"/>
		</div>
	</div>
	<div class="o-dashboard__content">
		<nav class="c-square--gary" role="navigation">
			<menu aria-haspopup="true" class="c-square__menu" role="menubar">
				<menuitem class="c-square__item" role="menuitem"><a class="${disabledAdministrador}" href="<c:url value="/administrador/comercio"/>" role="link" title="<fmt:message key="nav.administrador.comercio"/>"><i class="icon-vcard"></i><fmt:message key="nav.administrador.comercio"/></a></menuitem>
				<menuitem class="c-square__item" role="menuitem"><a class="${disabledAdministrador}" href="<c:url value="/administrador/usuario/grupo"/>" role="link" title="<fmt:message key="nav.administrador.usuario.grupo"/>"><i class="icon-users"></i><fmt:message key="nav.administrador.usuario.grupo"/></a></menuitem>
				<menuitem class="c-square__item" role="menuitem"><a class="${disabledAdministrador}" href="<c:url value="/administrador/usuario/tipo-de-acesso"/>" role="link" title="<fmt:message key="nav.administrador.usuario.tipo.acesso"/>"><i class="icon-lock"></i><fmt:message key="nav.administrador.usuario.tipo.acesso"/></a></menuitem>
				<menuitem class="c-square__item" role="menuitem"><a class="${disabledAdministrador}" href="<c:url value="/administrador/usuario"/>" role="link" title="<fmt:message key="nav.administrador.usuario"/>"><i class="icon-user"></i><fmt:message key="nav.administrador.usuario"/></a></menuitem>
			</menu>
		</nav>
	</div>
</section>
<%@include file="/config/footer-dashboard.jsp"%>
<script>
	let main = document.body.children[0];
	let section = document.body.children[0].children[0];
	main.style.background = 'url(/puppis/assets/img/dashboard/dashboard-administrador.jpg) no-repeat center / cover';
	section.style.padding = '0';
</script>