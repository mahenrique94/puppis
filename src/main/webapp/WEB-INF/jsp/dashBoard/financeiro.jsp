<%@include file="/config/header-dashboard.jsp"%>
<%@include file="/config/modulos.jsp"%>
<section class="o-dashboard">
	<div class="o-dashboard__breadcrumb">
		<div class="o-breadcrumb--arrow">
			<span class="o-breadcrumb__link"><a href="<c:url value="/dashboard"/>" role="link" title="<fmt:message key="nav.dashboard"/>"><fmt:message key="nav.dashboard"/></a></span>
			<span class="o-breadcrumb__link"><a class="is-inactive" href="#" role="link" title="<fmt:message key="nav.financeiro"/>"><fmt:message key="nav.financeiro"/></a></span>
			<c:import url="loginInfo.jsp"/>
		</div>
	</div>
	<div class="o-dashboard__content">
		<nav class="c-square--gary" role="navigation">
			<menu aria-haspopup="true" class="c-square__menu" role="menubar">
				<menuitem class="c-square__item" role="menuitem"><a class="${disabledFinanceiro}" href="<c:url value="/financeiro/documento"/>" role="link" title="<fmt:message key="nav.financeiro.documento"/>"><i class="icon-doc-inv"></i><fmt:message key="nav.financeiro.documento"/></a></menuitem>
				<menuitem class="c-square__item" role="menuitem"><a class="${disabledFinanceiro}" href="<c:url value="/financeiro/documento/parcelamento"/>" role="link" title="<fmt:message key="nav.financeiro.parcelamento"/>"><i class="icon-docs"></i><fmt:message key="nav.financeiro.parcelamento"/></a></menuitem>
				<menuitem class="c-square__item" role="menuitem"><a class="${disabledFinanceiro}" href="<c:url value="/financeiro/documento/transferencia"/>" role="link" title="<fmt:message key="nav.financeiro.transferencia"/>"><i class="icon-exchange"></i><fmt:message key="nav.financeiro.transferencia"/></a></menuitem>
				<menuitem class="c-square__item" role="menuitem"><a class="${disabledFinanceiro}" href="<c:url value="/financeiro/documento/baixa"/>" role="link" title="<fmt:message key="nav.financeiro.baixa"/>"><i class="icon-money"></i><fmt:message key="nav.financeiro.baixa"/></a></menuitem>
				<menuitem class="c-square__item" role="menuitem"><a class="${disabledFinanceiro}" href="<c:url value="/financeiro/extrato"/>" role="link" title="<fmt:message key="nav.financeiro.extrato"/>"><i class="icon-list-bullet"></i><fmt:message key="nav.financeiro.extrato"/></a></menuitem>
				<menuitem class="c-square__item" role="menuitem"><a class="${disabledFinanceiro}" href="<c:url value="/dashboard/relatorios/financeiro"/>" role="link" title="<fmt:message key="nav.financeiro.relatorios"/>"><i class="icon-chart-bar"></i><fmt:message key="nav.financeiro.relatorios"/></a></menuitem>
			</menu>
		</nav>
	</div>
</section>
<%@include file="/config/footer-dashboard.jsp"%>
<script>
	let main = document.body.children[0];
	let section = document.body.children[0].children[0];
	main.style.background = 'url(/puppis/assets/img/dashboard/dashboard-financeiro.jpg) no-repeat center / cover';
	section.style.padding = '0';
</script>