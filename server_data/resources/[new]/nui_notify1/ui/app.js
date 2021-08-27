$(document).ready(function () {
	window.addEventListener("message", function (event) {
		iziToast.show({
			id: 'haduken',
			class: 'pingo',
			theme: 'dark',
			/*title: 'Administração',*/
			/*displayMode: 0,*/
			timeout: 50000,
			close: false,
			balloon: false,
			backgroundColor: 'rgba(0,0,0,0.50)',
			message: event.data.mensagem,
			/*position: 'bottomCenter',*/
			transitionIn: 'flipInX',
			transitionOut: 'flipOutX',
			progressBarColor: 'rgba(0, 0, 0, 184)',
			imageWidth: 70,
			layout: 2,
			iconColor: 'rgb(0, 255, 184)'
		});
	})
});