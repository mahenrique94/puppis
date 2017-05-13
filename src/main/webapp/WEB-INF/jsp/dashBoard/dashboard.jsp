<%@include file="/config/header-dashboard.jsp"%>
<%@include file="/config/modulos.jsp"%>
<section class="o-dashboard">
	<div class="o-dashboard__breadcrumb">
		<div class="o-breadcrumb--arrow">
			<span class="o-breadcrumb__link"><a class="is-inactive" href="#" role="link" title="<fmt:message key="nav.dashboard"/>"><fmt:message key="nav.dashboard"/></a></span>
			<c:import url="loginInfo.jsp"/>
		</div>
	</div>
	<div class="o-dashboard__content">
		<header class="o-dashboard__header has-background">
			<hgroup>
				<h1 class="o-dashboard__title" style="color: #595959"><fmt:message key="titulo.dashboard"/></h1>
				<h2 class="o-dashboard__subtitle" style="color: #595959"><fmt:message key="subtitulo.dashboard"/></h2>
			</hgroup>
		</header>
		<nav class="c-square--gary" role="navigation">
			<menu aria-haspopup="true" class="c-square__menu" role="menubar">
				<menuitem class="c-square__item ${disabledAdministrador}" role="menuitem"><a href="<c:url value="/dashboard/administrador"/>" role="link" title="<fmt:message key="nav.administrador"/>"><i class="icon-address-book"></i><fmt:message key="nav.administrador"/></a></menuitem>
				<menuitem class="c-square__item ${disabledCadastro}" role="menuitem"><a href="<c:url value="/dashboard/cadastro"/>" role="link" title="<fmt:message key="nav.cadastro"/>"><i class="icon-address-book"></i><fmt:message key="nav.cadastro"/></a></menuitem>
				<menuitem class="c-square__item ${disabledComercio}" role="menuitem"><a href="<c:url value="/dashboard/comercio"/>" role="link" title="<fmt:message key="nav.comercio"/>"><i class="icon-address-book"></i><fmt:message key="nav.comercio"/></a></menuitem>
				<menuitem class="c-square__item ${disabledFinanceiro}" role="menuitem"><a href="<c:url value="/dashboard/financeiro"/>" role="link" title="<fmt:message key="nav.financeiro"/>"><i class="icon-address-book"></i><fmt:message key="nav.financeiro"/></a></menuitem>
			</menu>
		</nav>
	</div>
</section>
<%@include file="/config/footer-dashboard.jsp"%>
<script>
	let main = document.body.children[0];
	let section = document.body.children[0].children[0];
	main.style.background = 'url(/puppis/assets/img/dashboard/dashboard.jpg)  no-repeat center / cover';
	section.style.padding = '0';
</script>