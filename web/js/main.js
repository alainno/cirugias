$(document).on('ready',main);

function main(){
	//console.log('ready!');
	$('.lnk-print').on('click', printPage);
}

// imprimir pagina
function printPage(e){
	//console.log('print page!');
	e.preventDefault();
	window.print();
}

