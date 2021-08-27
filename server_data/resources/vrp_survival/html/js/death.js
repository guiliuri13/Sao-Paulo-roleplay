$(document).ready(function () {
    window.addEventListener('message', function (data) {
        let item = event.data
        let x = document.getElementById("audio");
        let z = document.getElementById("audio2");
        $(".counter h2").hide()
        if (item.setDisplay === true) {
            $(".container").css('display', 'block');
            let contador = 0;
            let tickFunction = setInterval( function () {
                $(".counter h2").hide();
                $(".counter h1").show();
                $(".counter h1").html(contador + "%");
                contador++;
                if (contador >= 101 || $('.container').css('display') === 'none') {
                    $(".counter h1").hide();
                    $(".counter h2").show();
                    sendData("fixNUI")
                    clearInterval(tickFunction);
                }
            }, 3000);
        } else {
           $(".container").css('display', 'none');
        }
        if ( item.playSound === true ){
            x.play()
         } else {
            x.pause()
            x.currentTime = 0
            z.play()
        }
    });
});


function sendData(name,data){
	$.post("http://vrp_survival/"+name,JSON.stringify(data),function(datab){
		if (datab != "ok"){
			console.log(datab);
		}
	});
}