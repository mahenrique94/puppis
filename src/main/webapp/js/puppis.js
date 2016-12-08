jQuery(document).ready(function () {
	
	jQuery('select.ss').select2({
		allowClear: true,
		 placeholder: 'Faça sua busca aqui',
		 theme: "classic"
	});
	
	/** @auth Matheus
	 *  Assim que o select que esta usando o select2 receber focus vai expandir opções para busca e escolha
	 */
	jQuery('.select2-selection').focus(function() {
		var idSelectPai = jQuery(this).attr('aria-labelledby');
		idSelectPai = idSelectPai.substring(idSelectPai.indexOf('-') + 1, idSelectPai.lastIndexOf('-'));
		jQuery('#' + idSelectPai).select2('open');
	});
	
});

function buscaCep(botao) {
	let input = botao.parentNode.parentNode.querySelector('input');
	if (input.value != null && input.value != undefined && input.value != '') {
		jQuery.ajax({
			url : `http://webservice.matheuscastiglioni.com.br/ws/cep/find/${input.value}/json/simple/upper`,
			dataType : 'json',
			type : 'GET',
			async : true,
			success : function(data) {
				document.querySelector('[data-cep=logradouro]').value = data.logradouro;
				document.querySelector('[data-cep=complemento]').value = data.complemento;
				document.querySelector('[data-cep=bairro]').value = data.bairro;
				
				document.querySelector('[data-cep=estado]').innerHTML = `<option value="${data.codestado}">${data.estado}</option>`;
				document.querySelector('[data-cep=cidade]').innerHTML = `<option value="${data.codibge}">${data.cidade}</option>`
			}, error : function() {
				console.log('Não foi possível encontrar o CEP');
			}, 
		});
	}
}