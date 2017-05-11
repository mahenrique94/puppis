<%@include file = "taglibraries.jsp"%>
<c:if test="${not empty erro}">
	<div class="o-toast--error has-icon is-fixedTop" role="alert">
		<p class="o-toast__message"><i class="icon-cancel-circled o-toast__icon--left"></i><fmt:message key="${erro}"/></p>
		<button class="o-toast__close" onclick="ToastController.close(this.parentNode);"><i class="icon-cancel"></i></button>
	</div>
</c:if>
<c:if test="${not empty mensagem}">
	<div class="o-toast--success has-icon is-fixedTop js-timeOut" role="alert">
  		<p class="o-toast__message"><i class="icon-ok-circled o-toast__icon--left"></i><fmt:message key="${mensagem}"/></p>
	</div>
</c:if>