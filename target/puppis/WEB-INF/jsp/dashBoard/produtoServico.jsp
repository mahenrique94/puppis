<%@include file="/config/header-dashboard.jsp"%>
<%@include file="/config/modulos.jsp"%>
<section class="o-dashboard">
	<div class="o-dashboard__breadcrumb">
		<div class="o-breadcrumb--arrow">
			<span class="o-breadcrumb__link"><a href="<c:url value="/dashboard"/>" role="link" title="<fmt:message key="nav.dashboard"/>"><fmt:message key="nav.dashboard"/></a></span>
			<span class="o-breadcrumb__link"><a href="<c:url value="/dashboard/cadastro"/>" role="link" title="<fmt:message key="nav.cadastro"/>"><fmt:message key="nav.cadastro"/></a></span>
			<span class="o-breadcrumb__link"><a class="is-inactive" href="#" role="link" title="<fmt:message key="nav.cadastro.produto.servico"/>"><fmt:message key="nav.cadastro.produto.servico"/></a></span>
			<c:import url="loginInfo.jsp"/>
		</div>
	</div>
	<div class="o-dashboard__content">
		<nav class="c-square--gary" role="navigation">
			<menu aria-haspopup="true" class="c-square__menu" role="menubar">
				<menuitem class="c-square__item" role="menuitem"><a class="${disabledCadastro}" href="<c:url value="/produto-servico/grupo"/>" role="link" title="<fmt:message key="nav.cadastro.produto.servico.grupo"/>"><i class="icon-cubes"></i><fmt:message key="nav.cadastro.produto.servico.grupo"/></a></menuitem>
				<menuitem class="c-square__item" role="menuitem"><a class="${disabledCadastro}" href="<c:url value="/produto-servico/classe"/>" role="link" title="<fmt:message key="nav.cadastro.produto.servico.classe"/>"><i class="icon-cube"></i><fmt:message key="nav.cadastro.produto.servico.classe"/></a></menuitem>
				<menuitem class="c-square__item" role="menuitem"><a class="${disabledCadastro}" href="<c:url value="/produto-servico"/>" role="link" title="<fmt:message key="nav.cadastro.produto.servico"/>"><i class="icon-box"></i><fmt:message key="nav.cadastro.produto.servico"/></a></menuitem>
			</menu>
		</nav>
	</div>
</section>
<%@include file="/config/footer-dashboard.jsp"%>
<script>
	let main = document.body.children[0];
	let section = document.body.children[0].children[0];
	main.style.background = 'url(/puppis/assets/img/dashboard/dashboard-produto.jpg) no-repeat center / cover';
	section.style.padding = '0';
</script>