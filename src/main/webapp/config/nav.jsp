<nav class="nav-tie" role="navigation">
	<h1><a class="nav-brand" href="<c:url value="/dashboard"/>"><fmt:message key="nav.brand"/></a></h1>
	<ul aria-haspopup="true" role="menubar">
		<li role="menuitem"><a href="#"><i class="icon-menu"></i></a>
			<ul aria-haspopup="true" role="menubar">
				<li role="menuitem"><a href="#"><fmt:message key="nav.cadastro"/></a>
					<ul aria-haspopup="true" role="menubar">
						<li role="menuitem"><a href="<c:url value="/financeiro/banco"/>"><fmt:message key="nav.cadastro.banco"/></a></li>
						<li role="menuitem"><a href="<c:url value="/cadastro/centro-de-custo"/>"><fmt:message key="nav.cadastro.centro.custo"/></a></li>
						<li role="menuitem"><a href="<c:url value="/cadastro/cidade"/>"><fmt:message key="nav.cadastro.cidade"/></a></li>
						<li role="menuitem"><a href="<c:url value="/financeiro/conta-bancaria"/>"><fmt:message key="nav.cadastro.conta.bancaria"/></a></li>
						<li role="menuitem"><a href="<c:url value="/cadastro/estado"/>"><fmt:message key="nav.cadastro.estado"/></a></li>
						<li role="menuitem"><a href="<c:url value="/financeiro/forma-de-pagamento"/>"><fmt:message key="nav.cadastro.forma.pagamento"/></a></li>
						<li role="menuitem"><a href="<c:url value="/financeiro/historico"/>"><fmt:message key="nav.cadastro.historico"/></a></li>
						<li role="menuitem"><a href="<c:url value="/cadastro/pais"/>"><fmt:message key="nav.cadastro.pais"/></a></li>
						<li role="menuitem"><a href="<c:url value="/pessoa"/>"><fmt:message key="nav.cadastro.pessoa"/></a></li>
						<li role="menuitem"><a href="#"><fmt:message key="nav.cadastro.produto.servico"/></a>
							<ul aria-haspopup="true" role="menubar">
								<li role="menuitem"><a href="<c:url value="/produto-servico/grupo"/>"><fmt:message key="nav.cadastro.produto.servico.grupo"/></a></li>
								<li role="menuitem"><a href="<c:url value="/produto-servico/classe"/>"><fmt:message key="nav.cadastro.produto.servico.classe"/></a></li>
								<li role="menuitem"><a href="<c:url value="/produto-servico"/>"><fmt:message key="nav.cadastro.produto.servico"/></a></li>
							</ul>
						</li>
					</ul>	
				</li>
				<li role="menuitem"><a href="#"><fmt:message key="nav.comercio"/></a></li>
				<li role="menuitem"><a href="#"><fmt:message key="nav.financeiro"/></a>
					<ul aria-haspopup="true" role="menubar">
						<li role="menuitem"><a href="<c:url value="/financeiro/documento"/>"><fmt:message key="nav.financeiro.documento"/></a></li>
						<li role="menuitem"><a href="<c:url value="/financeiro/documento/parcelamento"/>"><fmt:message key="nav.financeiro.parcelamento"/></a></li>
						<li role="menuitem"><a href="<c:url value="/financeiro/documento/baixa"/>"><fmt:message key="nav.financeiro.baixa"/></a></li>
						<li role="menuitem"><a href="<c:url value="/financeiro/extrato/listar"/>"><fmt:message key="nav.financeiro.extrato"/></a></li>
					</ul>	
				</li>
				<li role="menuitem"><a href="#"><fmt:message key="nav.administrador"/></a>
					<ul aria-haspopup="true" role="menubar">
						<li role="menuitem"><a href="<c:url value="/administrador/comercio"/>"><fmt:message key="nav.administrador.comercio"/></a></li>
						<li role="menuitem"><a href="<c:url value="/administrador/usuario/tipo-de-acesso"/>"><fmt:message key="nav.administrador.usuario.tipo.acesso"/></a></li>
						<li role="menuitem"><a href="<c:url value="/administrador/usuario/grupo"/>"><fmt:message key="nav.administrador.usuario.grupo"/></a></li>
						<li role="menuitem"><a href="<c:url value="/administrador/usuario"/>"><fmt:message key="nav.administrador.usuario"/></a></li>
					</ul>	
				</li>
			</ul>
		</li>
	</ul>
	<ul aria-haspopup="true" class="float-right user" role="menubar">
		<li class="float-right no-margin" role="menuitem"><a href="#">Ola,&nbsp;<i class="icon-user"></i>&nbsp;${username.usuario.usuario}</a>
			<ul aria-haspopup="true" role="menubar">
				<li role="menuitem"><a href="<c:url value="/login/logout"/>"><fmt:message key="nav.sistema.sair"/></a></li>
			</ul>			
		</li>
	</ul>					
</nav>