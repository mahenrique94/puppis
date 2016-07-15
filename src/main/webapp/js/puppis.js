jQuery(document).ready(function () {
	jQuery('select.ss').select2({
		allowClear: true,
		 placeholder: 'Faça sua busca aqui',
		 theme: "classic"
	});
});

function paintRow(obj) {
	if (obj.checked) {
		var $tr = obj.parentNode.parentNode; 
		var $elementsDisabled = $tr.querySelectorAll('[disabled]');
		$elementsDisabled.forEach(element => element.removeAttribute('disabled'));
		$tr.classList.add('table-row-pinted');
	} else {
		var $tr = obj.parentNode.parentNode;
		var $elementsDisabled = $tr.querySelectorAll('input[type=text], select');
		$elementsDisabled.forEach(element => element.setAttribute('disabled', 'disabled'));
		$tr.classList.remove('table-row-pinted');
	}
}