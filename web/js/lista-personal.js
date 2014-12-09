$(document).on('ready', mainListaPersonal);

function mainListaPersonal(){
    $('form.form-modal').on('submit', enviarFormModal);
    
    $('a.lnk-borrar').on('click', borrarPersonal);
    
    $(document).on("click", "a[data-toggle=modal]", openModal);
}

// abrir modal
function openModal() {
	var myBookId = $(this).data('titulo');
	if (myBookId) {
		$(".modal-header h4").text(myBookId);
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
