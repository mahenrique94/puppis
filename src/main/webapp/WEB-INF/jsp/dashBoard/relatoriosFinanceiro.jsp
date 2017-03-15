<%@include file="/config/header-dashboard.jsp"%>
<%@include file="/config/modulos.jsp"%>
<section class="o-dashboard">
	<div class="o-dashboard__breadcrumb">
		<div class="o-breadcrumb--arrow">
			<span class="o-breadcrumb__link"><a href="<c:url value="/dashboard"/>" role="link" title="<fmt:message key="nav.dashboard"/>"><fmt:message key="nav.dashboard"/></a></span>
			<span class="o-breadcrumb__link"><a href="<c:url value="/dashboard/financeiro"/>" role="link" title="<fmt:message key="nav.financeiro"/>"><fmt:message key="nav.financeiro"/></a></span>
			<span class="o-breadcrumb__link"><a class="is-inactive" href="#" role="link" title="<fmt:message key="nav.financeiro.relatorios"/>"><fmt:message key="nav.financeiro.relatorios"/></a></span>
			<c:import url="loginInfo.jsp"/>
		</div>
	</div>
	<div class="o-dashboard__content">
		<nav class="c-square--gary" role="navigation">
			<menu aria-haspopup="true" class="c-square__menu" role="menubar">
				<menuitem class="c-square__item ${disabledFinanceiro}" role="menuitem"><a href="<c:url value="/relatorio/financeiro/documento/custo"/>" role="link" title="<fmt:message key="nav.financeiro.relatorios.documento.custo"/>"><i class="icon-money"></i><fmt:message key="nav.financeiro.relatorios.documento.custo"/></a></menuitem>
				<menuitem class="c-square__item ${disabledFinanceiro}" role="menuitem"><a href="<c:url value="/relatorio/financeiro/documento/pagamento"/>" role="link" title="<fmt:message key="nav.financeiro.relatorios.documento.pagamento"/>"><i class="icon-dollar"></i><fmt:message key="nav.financeiro.relatorios.documento.pagamento"/></a></menuitem>
				<menuitem class="c-square__item ${disabledFinanceiro}" role="menuitem"><a href="<c:url value="/relatorio/financeiro/documento/pessoa"/>" role="link" title="<fmt:message key="nav.financeiro.relatorios.documento.pessoa"/>"><i class="icon-male"></i><fmt:message key="nav.financeiro.relatorios.documento.pessoa"/></a></menuitem>
				<menuitem class="c-square__item ${disabledFinanceiro}" role="menuitem"><a href="<c:url value="/relatorio/financeiro/extrato"/>" role="link" title="<fmt:message key="nav.financeiro.relatorios.extrato"/>"><i class="icon-list-bullet"></i><fmt:message key="nav.financeiro.relatorios.extrato"/></a></menuitem>
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