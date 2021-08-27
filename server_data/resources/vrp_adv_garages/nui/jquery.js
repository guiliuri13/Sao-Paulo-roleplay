$(document).ready(function(){
	let actionContainer = $("#actionmenu");

	window.addEventListener('message',function(event){
		let item = event.data;
		switch(item.action){
			case 'showMenu':
				updateGarages();
				actionContainer.fadeIn(1000);
			break;

			case 'hideMenu':
				actionContainer.fadeOut(800);
			break;

			case 'updateGarages':
				updateGarages();
			break;
			
			case 'updateGarages2':
				updateGarages2();
			break;
		}
	});

	document.onkeyup = function(data){
		if (data.which == 27){
			$.post('http://vrp_garages/NUIFocusOff', JSON.stringify({}));
		}
	};
});

const formatarNumero = (n) => {
	var n = n.toString();
	var r = '';
	var x = 0;

	for (var i = n.length; i > 0; i--) {
		r += n.substr(i - 1, 1) + (x == 2 && i != 1 ? '.' : '');
		x = x == 2 ? 0 : x + 1;
	}
	return r.split('').reverse().join('');
}

const sendData = (name,data) => {
	$.post("http://vrp_garages/"+name,JSON.stringify(data),function(datab){});
}


const updateGarages = () => {
	$('#garagem').html('');
	$.post('http://vrp_garages/myVehicles',JSON.stringify({}),(data) => {
		jQuery.each(data, function(key, value) {
			$('#garagem').append(`
				<div class="item" data-item-name="${value.vehicle}">
					<div class="item-img" >
					    <img src="https://www.flaticon.com/svg/static/icons/svg/3304/3304515.svg" class="img"/>
					
					</div>
					  <div class="item-text">
							                        <div class="item-right">Motor: ${value.engine}% | Lataria: ${value.body}% | Gasolina: ${value.fuel}%</div>
					 </div>
					
						 <div class="item-text">

						 <div class="item-right fontestamanho">${value.vehicle}</div>
					
					
					  <div class="item-text">
						<div class="item-right">Motor: | Lataria: | Gasolina:</div>
					</div>
				  <div class="item-text" style="border: 0;">

							                      
				  <div class="item-text" style="border: 0;">
					    <div class="item-left">Liberação:</b>${value.detido} </div>
				  </div>
			`);			
		});		
	});
}


$(document).on('click','.item',function(){
	let $el = $(this);
	let isActive = $el.hasClass('active');
	$('.item').removeClass('active');
	if(!isActive) $el.addClass('active');
});

$(document).on('click','.retirar',function(){
	let $el = $('.item.active');
	if($el) {
		$.post('http://vrp_garages/spawnVehicles',JSON.stringify({name: $el.attr('data-item-name')}));
	}
});

$(document).on('click','.guardar',function(){
	let $el = $('.item.active');
	if($el) {
		$.post('http://vrp_garages/deleteVehicles',JSON.stringify({name: $el.attr('data-item-name')}));
	}
});