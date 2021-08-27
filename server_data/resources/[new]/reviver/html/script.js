function addGaps(nStr) {
    nStr += '';
    var x = nStr.split('.');
    var x1 = x[0];
    var x2 = x.length > 1 ? '.' + x[1] : '';
    var rgx = /(\d+)(\d{3})/;
    while (rgx.test(x1)) {
        x1 = x1.replace(rgx, '$1' + '<span style="margin-left: 3px; margin-right: 3px;"/>' + '$2');
    }
    return x1 + x2;
}

function addCommas(nStr) {
    nStr += '';
    var x = nStr.split('.');
    var x1 = x[0];
    var x2 = x.length > 1 ? '.' + x[1] : '';
    var rgx = /(\d+)(\d{3})/;
    while (rgx.test(x1)) {
        x1 = x1.replace(rgx, '$1' + ',<span style="margin-left: 0px; margin-right: 1px;"/>' + '$2');
    }
    return x1 + x2;
}

$(document).ready(function() {
    // Partial Functions
    function closeMain() {
        $("#ui").css("display", "none");
    }

    function openMain() {
        $("#ui").css("display", "block");
    }

    function closeAll() {
        $(".body").css("display", "none");
    }

    function openContainer() {
        $(".taxi-container").css("display", "block");
    }

    function closeContainer() {
        $(".taxi-container").css("display", "none");
    }
    // Listen for NUI Events
    window.addEventListener('message', function(event) {
        var item = event.data;
        // Update HUD Balance
        if (item.updateBalance == true) {
            $('#entregas').html(event.data.entregas);
            $('#money').html('<br>R$ ' + (event.data.dinheiro));
            if (event.data.rotatxt == "Restaurante") {
                $('#rota').html(event.data.rotatxt);
                $('#rota').css("color", "#d9bf05");

            }
            if (event.data.rotatxt == "Entrega") {
                $('#rota').html(event.data.rotatxt);
                $('#rota').css("color", "#03624a");
            }

        }
        if (item.meterActive == true) {
            $('#hired').addClass("active").removeClass("notactive");
            $('#timeoff').removeClass("active").addClass("notactive");
        }
        if (item.meterActive == false) {
            $('#hired').removeClass("active").addClass("notactive");;
            $('#timeoff').addClass("active").removeClass("notactive");
        }
        // Open & Close main window
        if (item.openMeter == true) {
            openMain();

        }
        if (item.openMeter == false) {
            closeMain();

        }
        // Open sub-windows / partials
    });
    // On 'Esc' call close method
    document.onkeyup = function(data) {
        if (data.which == 27) {
            $.post('http://vrp_taxi/close', JSON.stringify({}));
        }
    };
});