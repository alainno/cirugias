$(document).on('ready',mainInforme);

function mainInforme(){
	//$('select.select2').select2();
	$('form.form-modal').on('submit', enviarFormModal);
	$('.btn-paso').click(pasear);

	$(".inputfecha").mask("99/99/9999");
	$(".inputhora").mask("99:99");
	
	
    $("input.select2").select2({
		multiple:true,
		placeholder: "- Buscar -",
		minimumInputLength: 3,
		ajax: {
			url: "json/test-search.json",
			dataType: 'json',
			quietMillis: 250,
			data: function (term, page) { // page is the one-based page number tracked by Select2
				return {
					q: term, //search term
				};
			},
			results: function (data, page) {
				return { results: data.items};
			}
		}
    });
	
	$(document).on("click", "a[data-toggle=modal]", function () {
		 var myBookId = $(this).data('input');
		 $(".modal-body #input-target").val(myBookId);
	});
}

function enviarFormModal(e){
	e.preventDefault();
	
	var $form = $(this);
	var $btn_send = $form.find('button[type=submit]');
	$btn_send.button('loading');	
	$.post($form.attr('action'), $form.serialize() + "&ajax=1", function(json){
		if(json.error){
			alert(json.mensaje);
		} else{
			//console.log($form.find('#input-target').val());
			var $input_target = $('#' + $form.find('#input-target').val());
			var data = $input_target.select2("data");
			data.push({id: json.id, text: json.nombre});
			$input_target.select2("data", data, true);
			$form[0].reset();
			$form.closest('div.modal').modal('hide');
		}
		$btn_send.button('reset');
	}, 'json');	
}

function pasear(e) {
	//e.preventDefault();
	//$(this).tab('show');
	$('.nav-tabs a[href="'+$(this).attr('href')+'"]').trigger('click');
}
