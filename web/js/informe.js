$(document).on('ready',mainInforme);

function mainInforme(){
	$('.select2').select2();
	$('#form-diagnostico').on('submit', enviarFormDiagnostico);
	$('.btn-paso').click(pasear);

	$(".inputfecha").mask("99/99/9999");
	$(".inputhora").mask("99:99");	
}

function enviarFormDiagnostico(e){
	e.preventDefault();
	
	//return false;
	//alert('hi hi');
	
	
	var $form = $(this);
	var $btn_send = $form.find('button[type=submit]');
	$btn_send.button('loading');	
	$.post($form.attr('action'), $form.serialize() + "&ajax=1", function(json){
		if(json.error){
			alert(json.mensaje);
			$btn_send.button('reset');
		} else{
			var data = $("#select-diagnostico").select2("data");
			data.push({id: json.id, text: json.nombre});
			$("#select-diagnostico").select2("data", data, true);			
			$('#modal-nuevo-diagnostico').modal('hide');
		}
	}, 'json');	
}

function pasear(e) {
	//e.preventDefault();
	//$(this).tab('show');
	$('.nav-tabs a[href="'+$(this).attr('href')+'"]').trigger('click');
}
