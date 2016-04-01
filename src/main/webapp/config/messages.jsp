<c:if test="${not empty mensagem}">
	<div class="alert-dialog-modern alert-success time-out">
		<div class="box text-center">
			<label class="alert-title"><fmt:message key="titulo.mensagem.sistema"/></label>
			<div class="alert-body">
				<i class="font-10x icon-thumbs-up" style="display: block;margin-bottom: 1rem;"></i>
				<h2>${mensagem}</h2>
			</div>
		</div>
	</div>
</c:if>