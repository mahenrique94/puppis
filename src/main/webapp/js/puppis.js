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