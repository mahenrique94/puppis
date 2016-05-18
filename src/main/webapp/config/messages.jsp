<%-- <c:if test="${not empty errors}">
	<div class="alert-info-system alert-error animate-slide-left-in time-out">
	   	<c:forEach var="error" items="${errors}">
			<h4 class="text-upper" id="${error.category}">${error.message}</h4>
		</c:forEach>
		<i class="icon-frown"></i>
	</div>
</c:if> --%>
<c:if test="${not empty mensagem}">
	<div class="alert-info-system alert-success animate-slide-left-in time-out">
		<h4 class="text-upper" id="${mensagem}">${mensagem}</h4>
		<i class="icon-smile"></i>
	</div>
</c:if>