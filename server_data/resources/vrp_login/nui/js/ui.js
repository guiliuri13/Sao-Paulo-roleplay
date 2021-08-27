$(function(){
	init();

	var actionContainer = $("#content");

	window.addEventListener('message',function(event){
		var item = event.data;

		if (item.showmenu){
			actionContainer.fadeIn(1000);
		}

		if (item.hidemenu) {
			actionContainer.fadeOut(200);
		}
	});
});

function init() {
  $(".box-login .item").click(function() {
    var spawn = $(this).data('spawn');
    dataSpawn(spawn);
  });

  $(".none").click(function() {
  	dataSpawn("");
  });
}

function dataSpawn(data) {
	$.post("http://vrp_login/ButtonClick", JSON.stringify(data), data => {});
}