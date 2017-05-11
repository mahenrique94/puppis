<menu class="c-nav--lube is-fixedTopFull"role="navigation">
	<menu class="c-nav__menu--first" role="menubar">
		<h1 class="c-nav__brand"><a href="<c:url value="/dashboard"/>" role="link"><i class="icon-home"></i><fmt:message key="nav.brand"/></a></h1>
		<menuitem class="c-nav__item--first" role="menuitem"><a class="has-dropdown" href="#" onclick="NavController.dropdown(this, event);" role="link"><i class="icon-menu"></i></a>
			<menu aria-expanded="false" aria-haspopup="true" aria-hidden="true" class="c-nav__menu--second is-hide" role="menubar" type="popup">
				<menuitem class="c-nav__item--second" role="menuitem"><a class="has-dropdown" href="#" onclick="NavController.dropdown(this, event);" role="link" title="<fmt:message key="nav.administrador"/>"><fmt:message key="nav.administrador"/></a>
					<menu aria-expanded="false" aria-haspopup="true" aria-hidden="true" class="c-nav__menu--third is-hide" role="menubar" type="popup">
						<menuitem class="c-nav__item--third" role="menuitem"><a href="<c:url value="/administrador/usuario/tipo-de-acesso"/>" role="link" title="<fmt:message key="nav.administrador.usuario.tipo.acesso"/>"><fmt:message key="nav.administrador.usuario.tipo.acesso"/></a></menuitem>
						<menuitem class="c-nav__item--third" role="menuitem"><a href="<c:url value="/administrador/usuario/grupo"/>" role="link" title="<fmt:message key="nav.administrador.usuario.grupo"/>"><fmt:message key="nav.administrador.usuario.grupo"/></a></menuitem>
						<menuitem class="c-nav__item--third" role="menuitem"><a href="<c:url value="/administrador/usuario"/>" role="link" title="<fmt:message key="nav.administrador.usuario"/>"><fmt:message key="nav.administrador.usuario"/></a></menuitem>
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