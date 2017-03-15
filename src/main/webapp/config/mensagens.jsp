<%@include file = "/config/taglibraries.jsp"%>
<c:if test="${not empty errors}">
	<div class="o-toast--error has-icon is-fixedTop" role="alert">
	   	<c:forEach var="error" items="${errors}">
			<p class="o-toast__message" data-cattegory="${error.category.toUpperCase()}"><i class="icon-cancel-circled o-toast__icon--left"></i>${error.category.toUpperCase()}:&nbsp;<fmt:message key="${error.message}"/></p>
		</c:forEach>
		<button class="o-toast__close" onclick="ToastController.close(this.parentNode);"><i class="icon-cancel"></i></button>
	</div>
</c:if>
<c:if test="${not empty messages}">
	<div class="o-toast--success has-icon is-fixedTop js-timeOut" role="alert">
  		<c:forEach var="message" items="${messages}">
  			<p class="o-toast__message" data-cattegory="${mensagem.category.toUpperCase()}"><i class="icon-ok-circled o-toast__icon--left"></i><fmt:message key="${mensagem}"/></p>
		</c:forEach>
	</div>
</c:if>