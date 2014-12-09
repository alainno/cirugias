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
	
	$('input.check-espec').change(checkEspec).trigger("change");
	
	$.conditionalize($("#IdDepartH"), $("#IdServHosp"));
	
	$('#form-informe').on('submit',enviarFormInforme);
}

// enviar formulario del informe mediante AJAX
function enviarFormInforme(e){
	e.preventDefault();
	var $form = $(this);
	var $btn_send = $form.find('button[type=submit]');
        $btn_send.button('loading');
	$.post($form.attr('action'), $form.serialize() + "&ajax=1", function(json){
		if(json.error){
			alert(json.mensaje);
			$btn_send.button('reset');
		} else{
			if(typeof json.redireccion != 'undefined'){
				document.location = json.redireccion;
			} else{
				location.reload(true);
			}
		}
	}, 'json');
}

// mostrar opciones dependientes de un select padre
$.conditionalize = function(sourceSelect, conditionalSelect){
    var options = conditionalSelect.children('.conditional').clone();

    sourceSelect.change(function(){
        var value = $(this).val();                  
        conditionalSelect.children().remove();
        options.clone().filter("."+value).appendTo(conditionalSelect);
		conditionalSelect.trigger('change');
    }).trigger("change");
}

// cambiar estado de especificaciones
function checkEspec(){
	//console.log('hi');
	var $input = $('#' + $(this).attr('data-input'));
	$input.prop('disabled',!$input.prop('disabled'));
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
