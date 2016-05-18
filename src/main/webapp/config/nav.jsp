<nav class="nav-tie" role="navigation">
	<h1><a class="nav-brand" href="<c:url value="/dashboard"/>"><fmt:message key="nav.brand"/></a></h1>
	<%-- <ul aria-haspopup="true" role="menubar">
		<li role="menuitem"><a href="#"><i class="icon-menu"></i></a>
			<ul aria-haspopup="true" role="menubar">
				<li role="menuitem"><a href="#"><fmt:message key="nav.cadastro"/></a>
					<ul aria-haspopup="true" role="menubar">
						<li role="menuitem"><a href="<c:url value="/cadastro/pais"/>"><fmt:message key="nav.cadastro.pais"/></a></li>
					</ul>	
				</li>
				<li role="menuitem"><a href="#"><fmt:message key="nav.comercio"/></a></li>
				<li role="menuitem"><a href="#"><fmt:message key="nav.financeiro"/></a></li>
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
	</ul> --%>
	<ul aria-haspopup="true" class="float-right user" role="menubar">
		<li class="float-right no-margin" role="menuitem"><a href="#">Ola,&nbsp;<i class="icon-user"></i>&nbsp;${username.usuario.usuario}</a>
			<ul aria-haspopup="true" role="menubar">
				<li role="menuitem"><a href="<c:url value="/login/logout"/>"><fmt:message key="nav.sistema.sair"/></a></li>
			</ul>			
		</li>
	</ul>					
</nav>