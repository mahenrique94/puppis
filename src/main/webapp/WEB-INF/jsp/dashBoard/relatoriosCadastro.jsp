<%@include file="/config/header-dashboard.jsp"%>
<%@include file="/config/modulos.jsp"%>
<section class="o-dashboard">
	<div class="o-dashboard__breadcrumb">
		<div class="o-breadcrumb--arrow">
			<span class="o-breadcrumb__link"><a href="<c:url value="/dashboard"/>" role="link" title="<fmt:message key="nav.dashboard"/>"><fmt:message key="nav.dashboard"/></a></span>
			<span class="o-breadcrumb__link"><a href="<c:url value="/dashboard/cadastro"/>" role="link" title="<fmt:message key="nav.cadastro"/>"><fmt:message key="nav.cadastro"/></a></span>
			<span class="o-breadcrumb__link"><a class="is-inactive" href="#" role="link" title="<fmt:message key="nav.cadastro.relatorios"/>"><fmt:message key="nav.cadastro.relatorios"/></a></span>
			<c:import url="loginInfo.jsp"/>
		</div>
	</div>
	<div class="o-dashboard__content">
		<nav class="c-square--gary" role="navigation">
			<menu aria-haspopup="true" class="c-square__menu" role="menubar">
				<menuitem class="c-square__item ${disabledCadastro}" role="menuitem"><a href="<c:url value="/relatorio/centro/custo"/>" role="link" title="<fmt:message key="nav.cadastro.relatorios.centro.custo"/>"><i class="icon-dollar"></i><fmt:message key="nav.cadastro.relatorios.centro.custo"/></a></menuitem>
				<menuitem class="c-square__item ${disabledCadastro}" role="menuitem"><a href="<c:url value="/relatorio/produto/classe"/>" role="link" title="<fmt:message key="nav.cadastro.relatorios.produto.classe"/>"><i class="icon-cube"></i><fmt:message key="nav.cadastro.relatorios.produto.classe"/></a></menuitem>
				<menuitem class="c-square__item ${disabledCadastro}" role="menuitem"><a href="<c:url value="/relatorio/produto/grupo"/>" role="link" title="<fmt:message key="nav.cadastro.relatorios.produto.grupo"/>"><i class="icon-cubes"></i><fmt:message key="nav.cadastro.relatorios.produto.grupo"/></a></menuitem>
				<menuitem class="c-square__item ${disabledCadastro}" role="menuitem"><a href="<c:url value="/relatorio/pessoa"/>" role="link" title="<fmt:message key="nav.cadastro.relatorios.pessoa"/>"><i class="icon-male"></i><fmt:message key="nav.cadastro.relatorios.pessoa"/></a></menuitem>
				<menuitem class="c-square__item ${disabledCadastro}" role="menuitem"><a href="<c:url value="/relatorio/produto/servico"/>" role="link" title="<fmt:message key="nav.cadastro.relatorios.produto.servico"/>"><i class="icon-box"></i><fmt:message key="nav.cadastro.relatorios.produto.servico"/></a></menuitem>
				<menuitem class="c-square__item ${disabledCadastro}" role="menuitem"><a href="<c:url value="/relatorio/tabela/preco"/>" role="link" title="<fmt:message key="nav.cadastro.relatorios.tabela.preco"/>"><i class="icon-money"></i><fmt:message key="nav.cadastro.relatorios.tabela.preco"/></a></menuitem>
			</menu>
		</nav>
	</div>
</section>
<%@include file="/config/footer-dashboard.jsp"%>
<script>
	let main = document.body.children[0];
	let section = document.body.children[0].children[0];
	main.style.background = 'url(/puppis/assets/img/dashboard/dashboard-relatorio.jpeg) no-repeat center / cover';
	section.style.padding = '0';
</script>