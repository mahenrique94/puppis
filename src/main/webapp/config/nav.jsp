<menu class="c-nav--lube is-fixedTopFull"role="navigation">
	<menu class="c-nav__menu--first" role="menubar">
		<h1 class="c-nav__brand"><a href="<c:url value="/dashboard"/>" role="link"><i class="icon-home"></i><fmt:message key="nav.brand"/></a></h1>
		<menuitem class="c-nav__item--first" role="menuitem"><a class="has-dropdown" href="#" onclick="NavController.dropdown(this, event);" role="link"><i class="icon-menu"></i></a>
			<menu aria-expanded="false" aria-haspopup="true" aria-hidden="true" class="c-nav__menu--second is-hide" role="menubar" type="popup">
				<menuitem class="c-nav__item--second" role="menuitem"><a class="has-dropdown" href="#" onclick="NavController.dropdown(this, event);" role="link" title="<fmt:message key="nav.administrador"/>"><fmt:message key="nav.administrador"/></a>
					<menu aria-expanded="false" aria-haspopup="true" aria-hidden="true" class="c-nav__menu--third is-hide" role="menubar" type="popup">
						<menuitem class="c-nav__item--third" role="menuitem"><a href="<c:url value="/administrador/usuario/comercio"/>" role="link" title="<fmt:message key="nav.administrador.comercio"/>"><fmt:message key="nav.administrador.comercio"/></a></menuitem>
						<menuitem class="c-nav__item--third" role="menuitem"><a href="<c:url value="/administrador/usuario/grupo"/>" role="link" title="<fmt:message key="nav.administrador.usuario.grupo"/>"><fmt:message key="nav.administrador.usuario.grupo"/></a></menuitem>
						<menuitem class="c-nav__item--third" role="menuitem"><a href="<c:url value="/administrador/usuario/tipo-de-acesso"/>" role="link" title="<fmt:message key="nav.administrador.usuario.tipo.acesso"/>"><fmt:message key="nav.administrador.usuario.tipo.acesso"/></a></menuitem>
						<menuitem class="c-nav__item--third" role="menuitem"><a href="<c:url value="/administrador/usuario"/>" role="link" title="<fmt:message key="nav.administrador.usuario"/>"><fmt:message key="nav.administrador.usuario"/></a></menuitem>
					</menu>
				</menuitem>
				<menuitem class="c-nav__item--second" role="menuitem"><a class="has-dropdown" href="#" onclick="NavController.dropdown(this, event);" role="link" title="<fmt:message key="nav.cadastro"/>"><fmt:message key="nav.cadastro"/></a>
					<menu aria-expanded="false" aria-haspopup="true" aria-hidden="true" class="c-nav__menu--third is-hide" role="menubar" type="popup">
						<menuitem class="c-nav__item--third" role="menuitem"><a href="<c:url value="/financeiro/banco"/>" role="link" title="<fmt:message key="nav.cadastro.banco"/>"><fmt:message key="nav.cadastro.banco"/></a></menuitem>
						<menuitem class="c-nav__item--third" role="menuitem"><a href="<c:url value="/cadastro/centro-de-custo"/>" role="link" title="<fmt:message key="nav.cadastro.centro.custo"/>"><fmt:message key="nav.cadastro.centro.custo"/></a></menuitem>
						<menuitem class="c-nav__item--third" role="menuitem"><a href="<c:url value="/cadastro/cidade"/>" role="link" title="<fmt:message key="nav.cadastro.cidade"/>"><fmt:message key="nav.cadastro.cidade"/></a></menuitem>
						<menuitem class="c-nav__item--third" role="menuitem"><a href="<c:url value="/financeiro/conta-bancaria"/>" role="link" title="<fmt:message key="nav.cadastro.conta.bancaria"/>"><fmt:message key="nav.cadastro.conta.bancaria"/></a></menuitem>
						<menuitem class="c-nav__item--third" role="menuitem"><a href="<c:url value="/cadastro/estado"/>" role="link" title="<fmt:message key="nav.cadastro.estado"/>"><fmt:message key="nav.cadastro.estado"/></a></menuitem>
						<menuitem class="c-nav__item--third" role="menuitem"><a href="<c:url value="/financeiro/forma-de-pagamento"/>" role="link" title="<fmt:message key="nav.cadastro.forma.pagamento"/>"><fmt:message key="nav.cadastro.forma.pagamento"/></a></menuitem>
						<menuitem class="c-nav__item--third" role="menuitem"><a href="<c:url value="/financeiro/historico"/>" role="link" title="<fmt:message key="nav.cadastro.historico"/>"><fmt:message key="nav.cadastro.historico"/></a></menuitem>
						<menuitem class="c-nav__item--third" role="menuitem"><a href="<c:url value="/cadastro/pais"/>" role="link" title="<fmt:message key="nav.cadastro.pais"/>"><fmt:message key="nav.cadastro.pais"/></a></menuitem>
						<menuitem class="c-nav__item--third" role="menuitem"><a href="<c:url value="/pessoa"/>" role="link" title="<fmt:message key="nav.cadastro.pessoa"/>"><fmt:message key="nav.cadastro.pessoa"/></a></menuitem>
						<menuitem class="c-nav__item--third" role="menuitem"><a class="has-dropdown" href="#" onclick="NavController.dropdown(this, event);" role="link" title="<fmt:message key="nav.cadastro.produto.servico"/>"><fmt:message key="nav.cadastro.produto.servico"/></a>
							<menu aria-expanded="false" aria-haspopup="true" aria-hidden="true" class="c-nav__menu--third is-hide" role="menubar" type="popup">
								<menuitem class="c-nav__item--fourth" role="menuitem"><a href="<c:url value="/produto-servico/grupo"/>" role="link" title="<fmt:message key="nav.cadastro.produto.servico.grupo"/>"><fmt:message key="nav.cadastro.produto.servico.grupo"/></a></menuitem>
								<menuitem class="c-nav__item--fourth" role="menuitem"><a href="<c:url value="/produto-servico/classe"/>" role="link" title="<fmt:message key="nav.cadastro.produto.servico.classe"/>"><fmt:message key="nav.cadastro.produto.servico.classe"/></a></menuitem>
								<menuitem class="c-nav__item--fourth" role="menuitem"><a href="<c:url value="/produto-servico"/>" role="link" title="<fmt:message key="nav.cadastro.produto.servico"/>"><fmt:message key="nav.cadastro.produto.servico"/></a></menuitem>
							</menu>
						</menuitem>
						<menuitem class="c-nav__item--third" role="menuitem"><a href="<c:url value="/tabela-de-preco"/>" role="link" title="<fmt:message key="nav.cadastro.tabela.preco"/>"><fmt:message key="nav.cadastro.tabela.preco"/></a></menuitem>
						<menuitem class="c-nav__item--third" role="menuitem"><a class="has-dropdown" href="#" onclick="NavController.dropdown(this, event);" role="link" title="<fmt:message key="nav.cadastro.relatorios"/>"><fmt:message key="nav.cadastro.relatorios"/></a>
							<menu aria-expanded="false" aria-haspopup="true" aria-hidden="true" class="c-nav__menu--third is-hide" role="menubar" type="popup">
								<menuitem class="c-nav__item--fourth" role="menuitem"><a href="<c:url value="/relatorio/centro/custo"/>" role="link" title="<fmt:message key="nav.cadastro.relatorios.centro.custo"/>"><fmt:message key="nav.cadastro.relatorios.centro.custo"/></a></menuitem>
								<menuitem class="c-nav__item--fourth" role="menuitem"><a href="<c:url value="/relatorio/produto/classe"/>" role="link" title="<fmt:message key="nav.cadastro.relatorios.produto.servico.classe"/>"><fmt:message key="nav.cadastro.relatorios.produto.servico.classe"/></a></menuitem>
								<menuitem class="c-nav__item--fourth" role="menuitem"><a href="<c:url value="/relatorio/produto/grupo"/>" role="link" title="<fmt:message key="nav.cadastro.relatorios.produto.servico.grupo"/>"><fmt:message key="nav.cadastro.relatorios.produto.servico.grupo"/></a></menuitem>
								<menuitem class="c-nav__item--fourth" role="menuitem"><a href="<c:url value="/relatorio/pessoa"/>" role="link" title="<fmt:message key="nav.cadastro.relatorios.pessoa"/>"><fmt:message key="nav.cadastro.relatorios.pessoa"/></a></menuitem>
								<menuitem class="c-nav__item--fourth" role="menuitem"><a href="<c:url value="/relatorio/produto/servico"/>" role="link" title="<fmt:message key="nav.cadastro.relatorios.produto.servico"/>"><fmt:message key="nav.cadastro.relatorios.produto.servico"/></a></menuitem>
								<menuitem class="c-nav__item--fourth" role="menuitem"><a href="<c:url value="/relatorio/tabela/preco"/>" role="link" title="<fmt:message key="nav.cadastro.relatorios.tabela.preco"/>"><fmt:message key="nav.cadastro.relatorios.tabela.preco"/></a></menuitem>
							</menu>
						</menuitem>
					</menu>
				</menuitem>
				<menuitem class="c-nav__item--second" role="menuitem"><a class="has-dropdown" href="#" onclick="NavController.dropdown(this, event);" role="link" title="<fmt:message key="nav.financeiro"/>"><fmt:message key="nav.financeiro"/></a>
					<menu aria-expanded="false" aria-haspopup="true" aria-hidden="true" class="c-nav__menu--third is-hide" role="menubar" type="popup">
						<menuitem class="c-nav__item--third" role="menuitem"><a href="<c:url value="/financeiro/documento"/>" role="link" title="<fmt:message key="nav.financeiro.documento"/>"><fmt:message key="nav.financeiro.documento"/></a></menuitem>
						<menuitem class="c-nav__item--third" role="menuitem"><a href="<c:url value="/financeiro/documento/parcelamento"/>" role="link" title="<fmt:message key="nav.financeiro.parcelamento"/>"><fmt:message key="nav.financeiro.parcelamento"/></a></menuitem>
						<menuitem class="c-nav__item--third" role="menuitem"><a href="<c:url value="/financeiro/documento/baixa"/>" role="link" title="<fmt:message key="nav.financeiro.baixa"/>"><fmt:message key="nav.financeiro.baixa"/></a></menuitem>
						<menuitem class="c-nav__item--third" role="menuitem"><a href="<c:url value="/financeiro/extrato"/>" role="link" title="<fmt:message key="nav.financeiro.extrato"/>"><fmt:message key="nav.financeiro.extrato"/></a></menuitem>
						<menuitem class="c-nav__item--third" role="menuitem"><a class="has-dropdown" href="#" onclick="NavController.dropdown(this, event);" role="link" title="<fmt:message key="nav.cadastro.relatorios"/>"><fmt:message key="nav.financeiro.relatorios"/></a>
							<menu aria-expanded="false" aria-haspopup="true" aria-hidden="true" class="c-nav__menu--third is-hide" role="menubar" type="popup">
								<menuitem class="c-nav__item--fourth" role="menuitem"><a href="<c:url value="/relatorio/financeiro/documento/custo"/>" role="link" title="<fmt:message key="nav.financeiro.relatorios.documento.custo"/>"><fmt:message key="nav.financeiro.relatorios.documento.custo"/></a></menuitem>
								<menuitem class="c-nav__item--fourth" role="menuitem"><a href="<c:url value="/relatorio/financeiro/documento/pagamento"/>" role="link" title="<fmt:message key="nav.financeiro.relatorios.documento.pagamento"/>"><fmt:message key="nav.financeiro.relatorios.documento.pagamento"/></a></menuitem>
								<menuitem class="c-nav__item--fourth" role="menuitem"><a href="<c:url value="/relatorio/financeiro/documento/pessoa"/>" role="link" title="<fmt:message key="nav.financeiro.relatorios.documento.pessoa"/>"><fmt:message key="nav.financeiro.relatorios.documento.pessoa"/></a></menuitem>
								<menuitem class="c-nav__item--fourth" role="menuitem"><a href="<c:url value="/relatorio/financeiro/extrato"/>" role="link" title="<fmt:message key="nav.financeiro.relatorios.extrato"/>"><fmt:message key="nav.financeiro.relatorios.extrato"/></a></menuitem>
							</menu>
						</menuitem>
					</menu>
				</menuitem>
			</menu>
		</menuitem>
		<menuitem class="c-nav__item--first c-nav__item--right" role="menuitem"><a class="has-dropdown" href="#" onclick="NavController.dropdown(this, event);" role="link">${userName.usuario}&nbsp;-&nbsp;${userName.comercio}</a>
			<menu aria-expanded="false" aria-haspopup="true" aria-hidden="true" class="c-nav__menu--second is-hide" role="menubar" type="popup">
				<menuitem class="c-nav__item--second" role="menuitem"><a href="<c:url value="/login/logout"/>" role="link" title="<fmt:message key="nav.sair"/>"><i class="icon-off"></i>&nbsp;<fmt:message key="nav.sistema.sair"/></a></menuitem>
			</menu>
		</menuitem>
		<menuitem class="c-nav__item--first c-nav__item--right" role="menuitem"><a href="http://feedback.userreport.com/df962d6b-73b8-4552-930c-a0adeb23c708/#submit/idea" role="link" target="_blank" title="Sugira uma funcionalidade"><i class="icon-laptop"></i>Sugira uma funcionalidade</a></menuitem>
		<menuitem class="c-nav__item--first c-nav__item--right" role="menuitem"><a href="http://feedback.userreport.com/df962d6b-73b8-4552-930c-a0adeb23c708/#submit/bug" role="link" target="_blank" title="Reporte um erro"><i class="icon-attention"></i>Reporte um erro</a></menuitem>
	</menu>
</menu>