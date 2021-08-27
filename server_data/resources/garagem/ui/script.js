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
				actionContainer.fadeOut(1000);
			break;

			case 'updateGarages':
				updateGarages();
			break;
		}
	});

	document.onkeyup = function(data){
		if (data.which == 27){
			sendData("ButtonClick","exit")
		}
	};
	const updateGarages = () => {
		$.post('http://eag_garages/myVehicles',JSON.stringify({}),(data) => {
			const nameList = data.vehicles.sort((a,b) => (a.name2 > b.name2) ? 1: -1);
			
			$('#listaVeiculos').html(`
				
				${nameList.map((item) => (`
		
	
				<div class="lista" data-status='${item.status}' data-ipva='${item.ipva}' data-name="${item.name}" data-name2="${item.name2}" data-engine="${item.engine}" data-body="${item.body}" data-fuel="${item.fuel}" style="background-image: url(imgs/${item.name}.png);"></div>
	
				`)).join('')}
			`);
			var vehicles = document.getElementsByClassName("lista")
			$("#nomeCarro").text($(vehicles[0]).data("name2"))
			// $("#seguro span").text($(vehicles[0]).data("status"))
			// $("#servicos span").text($(vehicles[0]).data("ipva"))
			$("#engine").text(`${$(vehicles[0]).data("engine")}%`)
			$("#latariapercent").text(`${$(vehicles[0]).data("body")}%`)
			$("#fuel").text(`${$(vehicles[0]).data("fuel")}%`)
			$("#mostraFoto").css("background-image",`url(imgs/${$(vehicles[0]).data("name")}.png)`)
			$(vehicles[0]).addClass("active")
		});
		

	}
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
	$.post("http://eag_garages/"+name,JSON.stringify(data),function(datab){});
}


//<div class="lista" style="background-image: url(https://cdn.discordapp.com/attachments/712813091674390560/766505559121199133/Adder-GTAV-Front.webp);"></div>



$(document).on('click','.lista',function(){
	let $el = $(this);
	let isActive = $el.hasClass('active');
	if (isActive) return;
	$('.lista').removeClass('active');
    if(!isActive) $el.addClass('active');
    

    $("#nomeCarro").text($(this).data("name2"))
    // $("#seguro span").text($(this).data("status"))
    // $("#servicos span").text($(this).data("ipva"))
    $("#engine").text(`${$(this).data("engine")}%`)
    $("#latariapercent").text(`${$(this).data("body")}%`)
    $("#fuel").text(`${$(this).data("fuel")}%`)
	$("#mostraFoto").css("background-image",`url(imgs/${$(this).data("name")}.png)`)

});

$(document).on('click','#retirar',function(){
	let $el = $('.lista.active');
	if($el) {
		$.post('http://eag_garages/spawnVehicles',JSON.stringify({
			name: $el.attr('data-name')
		}));
	}
})

$(document).on('click','#guardar',function(){
	$.post('http://eag_garages/deleteVehicles',JSON.stringify({}));
})