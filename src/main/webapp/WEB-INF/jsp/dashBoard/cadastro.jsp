<%@include file="/config/header-dashboard.jsp"%>
<%@include file="/config/modulos.jsp"%>
<section class="o-dashboard">
	<div class="o-dashboard__breadcrumb">
		<div class="o-breadcrumb--arrow">
			<span class="o-breadcrumb__link"><a href="<c:url value="/dashboard"/>" role="link" title="<fmt:message key="nav.dashboard"/>"><fmt:message key="nav.dashboard"/></a></span>
			<span class="o-breadcrumb__link"><a class="is-inactive" href="#" role="link" title="<fmt:message key="nav.cadastro"/>"><fmt:message key="nav.cadastro"/></a></span>
			<c:import url="loginInfo.jsp"/>
		</div>
	</div>
	<div class="o-dashboard__content">
		<nav class="c-square--gary" role="navigation">
			<menu aria-haspopup="true" class="c-square__menu" role="menubar">
				<menuitem class="c-square__item ${disabledCadastro}" role="menuitem"><a href="<c:url value="/financeiro/banco"/>" role="link" title="<fmt:message key="nav.cadastro.banco"/>"><i class="icon-bank"></i><fmt:message key="nav.cadastro.banco"/></a></menuitem>
				<menuitem class="c-square__item ${disabledCadastro}" role="menuitem"><a href="<c:url value="/cadastro/centro-de-custo"/>" role="link" title="<fmt:message key="nav.cadastro.centro.custo"/>"><i class="icon-dollar"></i><fmt:message key="nav.cadastro.centro.custo"/></a></menuitem>
				<menuitem class="c-square__item ${disabledCadastro}" role="menuitem"><a href="<c:url value="/cadastro/cidade"/>" role="link" title="<fmt:message key="nav.cadastro.cidade"/>"><i class="icon-location"></i><fmt:message key="nav.cadastro.cidade"/></a></menuitem>
				<menuitem class="c-square__item ${disabledCadastro}" role="menuitem"><a href="<c:url value="/financeiro/conta-bancaria"/>" role="link" title="<fmt:message key="nav.cadastro.conta.bancaria"/>"><i class="icon-cube"></i><fmt:message key="nav.cadastro.conta.bancaria"/></a></menuitem>
				<menuitem class="c-square__item ${disabledCadastro}" role="menuitem"><a href="<c:url value="/cadastro/estado"/>" role="link" title="<fmt:message key="nav.cadastro.estado"/>"><i class="icon-road"></i><fmt:message key="nav.cadastro.estado"/></a></menuitem>
				<menuitem class="c-square__item ${disabledCadastro}" role="menuitem"><a href="<c:url value="/financeiro/forma-de-pagamento"/>" role="link" title="<fmt:message key="nav.cadastro.forma.pagamento"/>"><i class="icon-money"></i><fmt:message key="nav.cadastro.forma.pagamento"/></a></menuitem>
				<menuitem class="c-square__item ${disabledCadastro}" role="menuitem"><a href="<c:url value="/financeiro/historico"/>" role="link" title="<fmt:message key="nav.cadastro.historico"/>"><i class="icon-comment-empty"></i><fmt:message key="nav.cadastro.historico"/></a></menuitem>
				<menuitem class="c-square__item ${disabledCadastro}" role="menuitem"><a href="<c:url value="/cadastro/pais"/>" role="link" title="<fmt:message key="nav.cadastro.pais"/>"><i class="icon-globe"></i><fmt:message key="nav.cadastro.pais"/></a></menuitem>
				<menuitem class="c-square__item ${disabledCadastro}" role="menuitem"><a href="<c:url value="/pessoa"/>" role="link" title="<fmt:message key="nav.cadastro.pessoa"/>"><i class="icon-male"></i><fmt:message key="nav.cadastro.pessoa"/></a></menuitem>
				<menuitem class="c-square__item ${disabledCadastro}" role="menuitem"><a href="<c:url value="/dashboard/produto/servico"/>" role="link" title="<fmt:message key="nav.cadastro.produto.servico"/>"><i class="icon-box"></i><fmt:message key="nav.cadastro.produto.servico"/></a></menuitem>
				<menuitem class="c-square__item ${disabledCadastro}" role="menuitem"><a href="<c:url value="/tabela-de-preco"/>" role="link" title="<fmt:message key="nav.cadastro.tabela.preco"/>"><i class="icon-money"></i><fmt:message key="nav.cadastro.tabela.preco"/></a></menuitem>
				<menuitem class="c-square__item ${disabledCadastro}" role="menuitem"><a href="<c:url value="/dashboard/relatorios/cadastro"/>" role="link" title="<fmt:message key="nav.cadastro.relatorios"/>"><i class="icon-chart-bar"></i><fmt:message key="nav.cadastro.relatorios"/></a></menuitem>
			</menu>
		</nav>
	</div>
</section>
<%@include file="/config/footer-dashboard.jsp"%>
<script>
	let main = document.body.children[0];
	let section = document.body.children[0].children[0];
	main.style.background = 'url(/puppis/assets/img/dashboard/dashboard-cadastro.jpg) no-repeat center / cover';
	section.style.padding = '0';
</script>