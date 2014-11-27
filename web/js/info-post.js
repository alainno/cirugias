$(document).ready(mainInfoPost);

//var ac;
var opts_interv = {
	width:370
	,ajax:{
		url:"Ajax?v=buscarProcs"
		,dataType:"json"
		,data:function(term, page){
			return{
				q: term
				,page_limit: 10
			}
		}
		,results:function(data,page){
			return{results:data.results};
		}
	}
	,minimumInputLength:1
	,initSelection: function(element, callback){
		var data = {id: element.val() || '', text: element.attr('rel') || ''};
		callback(data);
	}
};

var opts_diag = {
	width:460
	,ajax:{
		url:"Ajax?v=buscarDiags"
		,dataType:"json"
		,data:function(term, page){
			return{
				q: term
				,page_limit: 10
			}
		}
		,results:function(data,page){
			return{results:data.results};
		}
	}
	,minimumInputLength:1
	,initSelection: function(element, callback){
		var data = {id: element.val() || '', text: element.attr('rel') || ''};
		callback(data);
	}
};

function mainInfoPost(){

	$('.btn-paso').click(pasear);

	$(".inputfecha").mask("99/99/9999");
	/*$(".inputfecha").datepicker({
		format: "dd/mm/yyyy"
		,language: "es"
		,autoclose: true
	});*/
	$(".inputhora").mask("99:99");

	$('#checkPatologia').change(checkPatologia).trigger("change");

	$("#addInterv").click(addInterv);
	$(".form-group-interv").delegate(".remInterv","click", remInterv);

	//$("#autocomplete-interv-1").autocompleteArray(["Allen","Albert","Alberto","Alladin"]);
	//$("input.inputautocomplete").autocompleteArray(
	//	["Allen","Albert","Alberto","Alladin"]
		//,{onFindValue:findValue}
	//	,{onItemSelect:selectItem}
	//);
	/*ac = $("input.inputautocomplete").autocompleteArray(
		["Allen","Albert","Alberto","Alladin"]
		,{
			onItemSelect:selectItem
			,onFindValue:findValue
			,id:1
		}
	);*/

	/*ac = $("input.inputautocomplete").autocomplete(
		"demo.txt"
		,{
			onItemSelect:selectItem
			,onFindValue:findValue
			//,id:1
		}
	);*/


	// select2
	$("input.select2-interv").select2(opts_interv);
	$("input.select2-diag").select2(opts_diag);
	
	$("#form-info-post").submit(enviarForm);
	//$("#form-info-post").on('submit', enviarForm);
	//$("#formx").on('submit', function(){alert('hi hi')});
        
        //$('#btn-enviar').on('click', function(){alert('hi hi')});
        $('#select1').select2();
}

function pasear(e) {
	//e.preventDefault();
	//$(this).tab('show');
	$('.nav-tabs a[href="'+$(this).attr('href')+'"]').trigger('click');
}

//function enviarForm(){
//	var args = $(this).serialize();
//	console.log(args);
//	return false;
//}

function attachSelect2($input){
	$input.select2(opts_interv);	
}

function findValue(li){
	//alert(li.selectValue);
	return li.selectValue;
}

function selectItem(li){
	//findValue(li);
	//alert(this.value);
	//alert(ac[0].autocompleter.findValue());
	//var valor = ac[0].autocompleter.findValue();
	//alert(valor);
	//alert(this);
	console.log(this);
}

function checkPatologia(){
	if(this.checked){
		$('#PatologiaEspec').removeAttr('disabled');
	}
	else{
		$('#PatologiaEspec').attr('disabled','disabled');
	}
}

function addInterv(){
	//alert('hi');
	//var html = $('.form-group-interv').find(":last-child").html();
	$(".form-group-interv .form-group:last-child button.remInterv").hide();

	var $controlInterv = $(".form-group-interv .form-group:first-child").clone();

	var hijos = $(".form-group-interv > .form-group").length; 
	//alert(hijos);
	$controlInterv.find("span.nro").text(hijos+1);
	$controlInterv.find("input").val("");
	$controlInterv.find("button.remInterv").show();

	$controlInterv.find(".select2-container").html('<input type="hidden" name="IdProced[]" class="select2-interv" />');
	//$input.removeClass("select2");

	attachSelect2($controlInterv.find("input.select2-interv"));

	//var new_id = "automcomplete-interv-" + (hijos + 1);
	//$controlInterv.find("#autocomplete-interv-1").attr("id", new_id);

	/*
	$controlInterv.find("input.inputautocomplete").autocompleteArray(
		["Allen","Albert","Alberto","Alladin"]
		//,{onFindValue:findValue}
		,{onItemSelect:selectItem}
	);
	*/

	$(".form-group-interv").append($controlInterv);
	//alert(html);

	//$('#' + new_id).autocompleteArray(["Allen","Albert","Alberto","Alladin"]);
}

function remInterv(){
	$(this).parents(".form-group").remove();
	var hijos = $(".form-group-interv > .form-group").length; 
	if(hijos > 1){
		$(".form-group-interv .form-group:last-child button.remInterv").show();
	}
}



function enviarForm(){
    
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