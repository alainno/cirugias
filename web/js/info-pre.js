$(document).ready(mainInfoPre);

function mainInfoPre(){
	
	$('#IniAnest').mask("99:99");
	$('#FinAnest').mask("99:99");
	$('#FechaInterv').mask("99/99/9999");
		
	$.conditionalize($("#IdDepartH"), $("#IdServHosp"));
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