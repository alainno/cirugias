$(document).ready(mainInfoPre);

function mainInfoPre(){
	
	$('#IniAnest').mask("99:99");
	$('#FinAnest').mask("99:99");
	$('#FechaInterv').mask("99/99/9999");
		
	$.conditionalize($("#IdDepartH"), $("#IdServHosp"));
	
	$('#formInfoPre').submit(enviarFormInfoPre);
}

$.conditionalize = function(sourceSelect, conditionalSelect){
    var options = conditionalSelect.children('.conditional').clone();

    sourceSelect.change(function(){
        var value = $(this).val();          
        conditionalSelect.children().remove();
        options.clone().filter("."+value).appendTo(conditionalSelect);
		conditionalSelect.trigger('change');
    }).trigger("change");
}

function enviarFormInfoPre(){
	var $form = $(this);
	$.post($form.attr('action'), $form.serialize() + "&ajax=1", function(json){
		if(json.error){
			alert(json.mensaje);
		} else{
			if(typeof json.redireccion != 'undefined'){
				document.location = json.redireccion;	
			} else{
				location.reload(true);
			}
		}
	}, 'json');
	return false;
}