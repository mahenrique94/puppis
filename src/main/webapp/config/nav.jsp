<nav class="nav-tie" role="navigation">
	<h1><a class="nav-brand" href="<c:url value="/dashboard"/>"><fmt:message key="nav.brand"/></a></h1>
	<ul aria-haspopup="true" class="float-right user" role="menubar">
		<li class="float-right no-margin" role="menuitem"><a href="#">Ola,&nbsp;<i class="icon-user"></i>&nbsp;${username.usuario.usuario}&nbsp;-&nbsp;${username.comercio.nomerazaosocial}</a>
			<ul aria-haspopup="true" role="menubar">
				<li role="menuitem"><a href="<c:url value="/login/logout"/>"><fmt:message key="nav.sistema.sair"/></a></li>
			</ul>			
		</li>
	</ul>					
</nav>