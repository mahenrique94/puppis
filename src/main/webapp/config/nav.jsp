			<nav class="nav-tie">
				<a class="nav-brand" href="<c:url value="/"/>"><fmt:message key="nav.brand"/></a>
				<ul class="nav-main" role="menubar">
					<li role="menuitem"><a href="#"><fmt:message key="nav.cadastro"/></a>
						<ul aria-haspopup="true" role="menubar">
							<li role="menuitem"><a href="<c:url value="/cadastro/centro-de-custo"/>"><fmt:message key="nav.cadastro.centro.custo"/></a></li>
							<li role="menuitem"><a href="<c:url value="/cadastro/cidade"/>"><fmt:message key="nav.cadastro.cidade"/></a></li>
							<li role="menuitem"><a href="<c:url value="/cadastro/estado"/>"><fmt:message key="nav.cadastro.estado"/></a></li>
							<li role="menuitem"><a href="<c:url value="/cadastro/pais"/>"><fmt:message key="nav.cadastro.pais"/></a></li>
							<li role="menuitem"><a href="#"><fmt:message key="nav.cadastro.pessoa"/></a>
								<ul aria-haspopup="true" role="menubar">
									<li role="menuitem"><a href="<c:url value="/pessoa"/>"><fmt:message key="nav.cadastro.pessoa.cliente"/></a></li>
									<li role="menuitem"><a href="<c:url value="/pessoa"/>"><fmt:message key="nav.cadastro.pessoa.fornecedor"/></a></li>
									<li role="menuitem"><a href="<c:url value="/pessoa"/>"><fmt:message key="nav.cadastro.pessoa.funcionario"/></a></li>
								</ul>
							</li>
							<li role="menuitem"><a href="#"><fmt:message key="nav.cadastro.produto.servico"/></a>
								<ul aria-haspopup="true" role="menubar">
									<li role="menuitem"><a href="<c:url value="/produto-servico/classe"/>"><fmt:message key="nav.cadastro.produto.servico.classe"/></a>
									<li role="menuitem"><a href="<c:url value="/produto-servico/grupo"/>"><fmt:message key="nav.cadastro.produto.servico.grupo"/></a>
									<li role="menuitem"><a href="<c:url value="/produto-servico"/>"><fmt:message key="nav.cadastro.produto.servico"/></a>
								</ul>
							</li>
						</ul>
					</li>
					<li role="menuitem"><a href="#"><fmt:message key="nav.comercio"/></a>
						<ul aria-haspopup="true" role="menubar">
							<li role="menuitem"><a href="#"><fmt:message key="nav.operacional"/></a>
								<ul aria-haspopup="true" role="menubar">
									<li role="menuitem"><a href="<c:url value="/comercio/nota"/>"><fmt:message key="nav.comercio.operacional.compra.venda"/></a>
								</ul>
							</li>
						</ul>
					</li>
					<li role="menuitem"><a href="#"><fmt:message key="nav.financeiro"/></a>
						<ul aria-haspopup="true" role="menubar">
							<li role="menuitem"><a href="<c:url value="/financeiro/banco"/>"><fmt:message key="nav.financeiro.banco"/></a></li>
							<li role="menuitem"><a href="<c:url value="/financeiro/conta-bancaria"/>"><fmt:message key="nav.financeiro.conta.bancaria"/></a></li>
							<li role="menuitem"><a href="<c:url value="/financeiro/controle"/>"><fmt:message key="nav.financeiro.controle"/></a></li>
							<li role="menuitem"><a href="<c:url value="/financeiro/forma-de-pagamento"/>"><fmt:message key="nav.financeiro.forma.pagamento"/></a></li>
							<li role="menuitem"><a href="<c:url value="/financeiro/historico"/>"><fmt:message key="nav.financeiro.historico"/></a></li>
							<li role="menuitem"><a href="<c:url value="#"/>"><fmt:message key="nav.operacional"/></a>
								<ul aria-haspopup="true" role="menubar">
									<li role="menuitem"><a href="<c:url value="/financeiro/documento"/>"><fmt:message key="nav.financeiro.operacional.documento"/></a></li>
								</ul>
							</li>
						</ul>
					</li>
					<c:if test="${username.usuario.usuario.equals('ADMIN')}">
						<li role="menuitem"><a href="#"><fmt:message key="nav.sistema"/></a>
							<ul aria-haspopup="true" role="menubar">
								<li role="menuitem"><a href="<c:url value="/administrador/comercio"/>"><fmt:message key="nav.sistema.comercio"/></a></li>
								<li role="menuitem"><a href="<c:url value="/administrador/grupo"/>"><fmt:message key="nav.sistema.grupo"/></a></li>
								<li role="menuitem"><a href="<c:url value="/administrador/usuario"/>"><fmt:message key="nav.sistema.usuario"/></a></li>
								<li role="menuitem"><a href="<c:url value="/administrador/tipo-de-acesso"/>"><fmt:message key="nav.sistema.tipo.acesso"/></a></li>
							</ul>
						</li>
					</c:if>
					<ul class="nav-main position-right" role="menubar">
						<li role="menuitem"><a href="#"><fmt:message key="label.ola"/><fmt:message key="label.virgula"/>&nbsp;${username.usuario.usuario}</a>
							<ul aria-haspopup="true" class="position-right" role="menubar">
								<li role="menuitem"><a href="<c:url value="#"/>"><fmt:message key="nav.sistema.alterar.senha"/></a></li>
								<li role="menuitem"><a href="<c:url value="/login/logout"/>"><fmt:message key="nav.sistema.sair"/></a></li>
							</ul>
						</li>
					</ul>
				</ul>
			</nav>