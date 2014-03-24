$(document).ready(mainPaciente);

//var provinSelect;
//var options;

function mainPaciente(){
	$('#FechaNac').mask("99/99/9999");
	
	$('#checkFechaNac').change(checkFechaNac).trigger("change");
	
	$('#IdPais').change(changeSelectsUbigeo).trigger("change");
	
//	provinSelect = $('#IdProvin');
//	options = provinSelect.children().clone();
//	
//	$('#IdDepart').change(changeDepart).trigger("change");
//	
//	
	$.conditionalize($("#IdDepart"), $("#IdProvin"));
	$.conditionalize($("#IdProvin"), $("#IdDistrito"));
}

function checkFechaNac(){
	if(this.checked){
		$('#Edad').removeAttr('disabled');
		$('#FechaNac').attr('disabled','disabled');
	}
	else{
		$('#Edad').attr('disabled','disabled');
		$('#FechaNac').removeAttr('disabled');
	}
}

function changeSelectsUbigeo(){
	if($(this).find(":selected").val()=="155"){
		$('#IdDepart').removeAttr('disabled');
		$('#IdProvin').removeAttr('disabled');
		$('#IdDistrito').removeAttr('disabled');
	}else{
		$('#IdDepart').attr('disabled', 'disabled');
		$('#IdProvin').attr('disabled', 'disabled');
		$('#IdDistrito').attr('disabled', 'disabled');
	}
}

//function changeDepart(){
//	var value = $(this).val();
//	provinSelect.children().remove();
//	options.clone().filter('[rel="'+value+'"]').appendTo(provinSelect);
//}


$.conditionalize = function(sourceSelect, conditionalSelect){
    var options = conditionalSelect.children('.conditional').clone();

    sourceSelect.change(function(){
        var value = $(this).val();                  
        conditionalSelect.children().remove();
        options.clone().filter("."+value).appendTo(conditionalSelect);
		conditionalSelect.trigger('change');
    }).trigger("change");
}