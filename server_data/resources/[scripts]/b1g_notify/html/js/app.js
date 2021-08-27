

window.addEventListener('message', function (event) {
    ShowNotif(event.data);
});

function ShowNotif(data) {
	$("#desc").empty();
	if (data.type === 'importante') {
		launch_importante(data);
    }
	else if (data.type === 'sucesso') {
       launch_successo(data);
    } 
	else if (data.type === 'negado') {
       launch_negado(data);
    } 
	else if (data.type === 'aviso') {
       launch_aviso(data);
    } 
}

function launch_importante(data) {
    var x = document.getElementById("toast")
    x.className = "show";
	document.getElementById("image").src = "https://image.flaticon.com/icons/svg/189/189664.svg";
	document.getElementById("toast").style.backgroundColor = "transparent";
	document.getElementById("toast").style.borderRadius = "25px"
	document.getElementById("desc").style.color = "rgb(2, 14, 254)"
	document.getElementById("desc").style.fontSize = "20px"
	document.getElementById("desc").style.fontFamily = "Roboto, sans-serif"
	document.getElementById("desc").style.fontStyle = "italic"
	document.getElementById("desc").style.textShadow = "0px 0px 11px rgba(255, 255, 255, 1)"
	document.getElementById("toast").style.borderStyle = "none"
	$("#desc").append(`${data.text}`)
	setTimeout(function(){ x.className = x.className.replace("show", "disappear"); }, 5000);
	
}

function launch_aviso(data) {
    var x = document.getElementById("toast")
    x.className = "show";
	document.getElementById("image").src = "https://image.flaticon.com/icons/svg/196/196759.svg";
	document.getElementById("toast").style.backgroundColor = "transparent";
	document.getElementById("toast").style.borderRadius = "25px"
	document.getElementById("desc").style.color = "rgb(237, 3, 2)"
	document.getElementById("desc").style.fontSize = "20px"
	document.getElementById("desc").style.fontFamily = "Roboto, sans-serif"
	document.getElementById("desc").style.fontStyle = "italic"
	document.getElementById("desc").style.textShadow = "0px 0px 11px rgba(255, 255, 255, 1)"
	document.getElementById("toast").style.borderStyle = "none"
	$("#desc").append(`${data.text}`)
    setTimeout(function(){ x.className = x.className.replace("show", "disappear"); }, 5000);
}


function launch_successo(data) {
    var x = document.getElementById("toast")
    x.className = "show";
	document.getElementById("image").src = "https://image.flaticon.com/icons/svg/190/190411.svg";
	document.getElementById("toast").style.backgroundColor = "transparent";
	document.getElementById("toast").style.borderRadius = "25px"
	document.getElementById("toast").style.borderStyle = "none"
	document.getElementById("desc").style.color = "rgb(3, 245, 2)"
	document.getElementById("desc").style.textShadow = "0px 0px 11px rgba(3, 245, 2, 1);"
	document.getElementById("desc").style.fontFamily = "Roboto, sans-serif"
	document.getElementById("desc").style.fontStyle = "italic"
	document.getElementById("desc").style.fontSize = "20px"
	$("#desc").append(`${data.text}`)
	setTimeout(function(){ x.className = x.className.replace("show", "disappear"); }, 5000);
}

function launch_negado(data) {
    var x = document.getElementById("toast")
    x.className = "show";
	document.getElementById("image").src = "https://image.flaticon.com/icons/svg/190/190406.svg";
	document.getElementById("toast").style.backgroundColor = "transparent";
	document.getElementById("toast").style.borderRadius = "25px"
	document.getElementById("desc").style.color = "rgb(237, 3, 2)"
	document.getElementById("desc").style.fontSize = "20px"
	document.getElementById("desc").style.fontFamily = "Roboto, sans-serif"
	document.getElementById("desc").style.fontStyle = "italic"
	document.getElementById("desc").style.textShadow = "0px 0px 11px rgba(255, 255, 255, 1)"
	document.getElementById("toast").style.borderStyle = "none"
	$("#desc").append(`${data.text}`)
    setTimeout(function(){ x.className = x.className.replace("show", "disappear"); }, 5000);
}