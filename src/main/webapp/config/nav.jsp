			<nav class="nav-default">
				<ul class="nav-main" role="menubar">
					<li role="menuitem"><a href="#"><fmt:message key="nav.cadastro"/></a>
						<ul aria-haspopup="true" role="menubar">
							<li role="menuitem"><a href="<c:url value="/centro-de-custo"/>"><fmt:message key="nav.cadastro.centro.custo"/></a></li>
							<li role="menuitem"><a href="<c:url value="/cidade"/>"><fmt:message key="nav.cadastro.cidade"/></a></li>
							<li role="menuitem"><a href="<c:url value="/estado"/>"><fmt:message key="nav.cadastro.estado"/></a></li>
							<li role="menuitem"><a href="<c:url value="/pais"/>"><fmt:message key="nav.cadastro.pais"/></a></li>
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
							<li role="menuitem"><a href="#"><fmt:message key="nav.comercio.operacional"/></a>
								<ul aria-haspopup="true" role="menubar">
									<li role="menuitem"><a href="<c:url value="/nota"/>"><fmt:message key="nav.comercio.operacional.compra.venda"/></a>
								</ul>
							</li>
						</ul>
					</li>
					<c:if test="${username.usuario.usuario.equals('ROOT')}">
						<li role="menuitem"><a href="#"><fmt:message key="nav.sistema"/></a>
							<ul aria-haspopup="true" role="menubar">
								<li role="menuitem"><a href="<c:url value="/comercio"/>"><fmt:message key="nav.sistema.comercio"/></a></li>
								<li role="menuitem"><a href="<c:url value="/usuario"/>"><fmt:message key="nav.sistema.usuario"/></a></li>
							</ul>
						</li>
					</c:if>
				</ul>
			</nav>