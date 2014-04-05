$(document).ready(mainInfoPost);

var ac;

function mainInfoPost(){

	$(".inputfecha").mask("99/99/9999");
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
	ac = $("input.inputautocomplete").autocomplete(
		"demo.txt"
		,{
			onItemSelect:selectItem
			,onFindValue:findValue
			//,id:1
		}
	);

	// select2
	$("input.select2").select2({
		width:360
		,ajax:{
			url:"select2.json"
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
	});
}

function attachSelect2($input){
	$input.select2({
		width:360
		,ajax:{
			url:"select2.json"
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
	});	
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

	$controlInterv.find(".select2-container").html('<input type="hidden" class="select2" />');
	//$input.removeClass("select2");

	attachSelect2($controlInterv.find("input.select2"));

	//var new_id = "automcomplete-interv-" + (hijos + 1);
	//$controlInterv.find("#autocomplete-interv-1").attr("id", new_id);
	$controlInterv.find("input.inputautocomplete").autocompleteArray(
		["Allen","Albert","Alberto","Alladin"]
		//,{onFindValue:findValue}
		,{onItemSelect:selectItem}
	);



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