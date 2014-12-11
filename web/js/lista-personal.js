$(document).on('ready', mainListaPersonal);

function mainListaPersonal(){
    $('form.form-modal').on('submit', enviarFormModal);
    
    $('a.lnk-borrar').on('click', borrarPersonal);
    
    $(document).on("click", "a[data-toggle=modal]", openModal);
	
    $('a.lnk-open-modal').on("click", openModalForm);
}

// abrir modal y cargar json remoto si hay
function openModalForm(){
	var $este = $(this);
	var $modal = $($este.attr('href'));
	
	$modal.find('form')[0].reset();
	
	var titulo = $este.data('titulo');
	if (titulo) {
		$modal.find(".modal-header h4").text(titulo);
	}
	var form_action = $este.data('form-action');
	if(form_action){
		$modal.find(".modal-body form").attr('action', form_action);
	}	
	
	var $data = $este.data('pre-data');
	if(!$data){
		$($este.attr('href')).modal('show');
	}else{
		$('body').ajaxui('bloquear');
		$.getJSON($data, 'ajax=1', function(json){
			if(json.error){
				alert(json.mensaje);
			}else{
				$modal.find('input#nombre').val(json.nombre);
				$($este.attr('href')).modal('show');
			}
			$('body').ajaxui('desbloquear');
		});
	}
}

// abrir modal
function openModal() {
	
	$('body').ajaxui('bloquear');
	
	var $este = $(this);
	var myBookId = $este.data('titulo');
	if (myBookId) {
		$(".modal-header h4").text(myBookId);
	}
	var form_action = $este.data('form-action');
	if(form_action){
		$(".modal-body form").attr('action', form_action);
	}
}

// enviar form modal
function enviarFormModal(e) {
	e.preventDefault();
	var $form = $(this);
	var $btn_send = $form.find('button[type=submit]');
	$btn_send.button('loading');
	$.post($form.attr('action'), $form.serialize() + "&ajax=1", function (json) {
		if (json.error) {
			alert(json.mensaje);
			$btn_send.button('reset');
		} else {
			if (typeof json.redireccion != 'undefined') {
				document.location = json.redireccion;
			} else {
				location.reload(true);
			}
		}
	}, 'json');
}

// eliminar registro de personal
function borrarPersonal(e){
    e.preventDefault();
    var $lnk = $(this);
    if(confirm('¿Desea borrar el registro?')){
        $.post($lnk.attr('href'), "&ajax=1", function(json){
            if(json.error){
                alert(json.mensaje);
            } else{
                $lnk.parents('tr').fadeOut();
            }
        }, 'json');
    }
}
