console.log('js elemento');
var arrayData = [];

function Mostrar(a) {
    let data = a.split(",");

    for (var i = 0; i < data.length; i++) {
        arrayData[i] = data[i];
    }
    console.log(a, arrayData);
    document.getElementById('modalLogs').innerHTML = '<h3 align="center"><strong>Usuario:</strong> ' +
        arrayData[12] + '  ' +
        arrayData[13] + '<br> <strong>Cedula: </strong>' +
        arrayData[14] + ' </h3><hr><h4 align="center"><strong>Menu</strong></h4><div style="margin-left:10%">';
    if (arrayData[0] == 't') {
        document.getElementById('modalLogs').innerHTML += '<b>Categoria Accesorios</b> <input type="checkbox" checked><br>';
    } else {
        document.getElementById('modalLogs').innerHTML += '<b>Categoria Accesorios</b> <input type="checkbox"><br>';
    }
    if (arrayData[1] == 't') {
        document.getElementById('modalLogs').innerHTML += '<b>Categoria Carenaje</b> <input type="checkbox" checked><br>';
    } else {
        document.getElementById('modalLogs').innerHTML += '<b>Categoria Carenaje</b> <input type="checkbox" ><br>';
    }
    if (arrayData[2] == 't') {
        document.getElementById('modalLogs').innerHTML += '<b>Categoria Chasis</b> <input type="checkbox" checked><br>';
    } else {
        document.getElementById('modalLogs').innerHTML += '<b>Categoria Chasis</b> <input type="checkbox"><br>';
    }
    if (arrayData[3] == 't') {
        document.getElementById('modalLogs').innerHTML += '<b>Categoria Eléctrico</b> <input type="checkbox" checked><br>';
    } else {
        document.getElementById('modalLogs').innerHTML += '<b>Categoria Eléctrico</b> <input type="checkbox"><br>';
    }
    if (arrayData[4] == 't') {
        document.getElementById('modalLogs').innerHTML += '<b>Categoria Frenos</b> <input type="checkbox" checked><br>';
    } else {
        document.getElementById('modalLogs').innerHTML += '<b>Categoria Frenos</b> <input type="checkbox"><br>';
    }
    if (arrayData[5] == 't') {
        document.getElementById('modalLogs').innerHTML += '<b>Categoria Motor</b> <input type="checkbox" checked><br>';
    } else {
        document.getElementById('modalLogs').innerHTML += '<b>Categoria Motor</b> <input type="checkbox"><br>';
    }
    if (arrayData[6] == 't') {
        document.getElementById('modalLogs').innerHTML += '<b>Categoria Suspensión</b> <input type="checkbox" checked><br>';
    } else {
        document.getElementById('modalLogs').innerHTML += '<b>Categoria Suspensión</b> <input type="checkbox"><br>';
    }
    if (arrayData[7] == 't') {
        document.getElementById('modalLogs').innerHTML += '<b>Categoria Tracción</b> <input type="checkbox" checked><br>';
    } else {
        document.getElementById('modalLogs').innerHTML += '<b>Categoria Tracción</b> <input type="checkbox"><br>';
    }
    if (arrayData[18] == 't') {
        document.getElementById('modalLogs').innerHTML += '<b>Modulo de Apartados (Solo Como Usuario)</b> <input type="checkbox" checked>';
    } else {
        document.getElementById('modalLogs').innerHTML += '<b>Modulo de Apartados (Solo Como Usuario)</b> <input type="checkbox">';
    }

    if (arrayData[15] == 10) {

        document.getElementById('modalLogs').innerHTML += '<hr></div><h4 align="center"><strong> Usuario Administrador</strong></h4>';
        document.getElementById('modalLogs').innerHTML += '<b>Administrador </b><input type="checkbox" checked>';
        document.getElementById('modalLogs').innerHTML += '<hr><h4 align="center"> <strong> Administrar</strong></h4><div style="margin-left:10%">';
        if (arrayData[9] == 't') {
            document.getElementById('modalLogs').innerHTML += '<b>Registros de Administrador</b> <input type="checkbox" checked><br>';
        } else {
            document.getElementById('modalLogs').innerHTML += '<b>Registros de Administrador</b> <input type="checkbox"><br>';
        }
        if (arrayData[10] == 't') {
            document.getElementById('modalLogs').innerHTML += '<b>Modulo de datos Interno</b> <input type="checkbox" checked><br>';
        } else {
            document.getElementById('modalLogs').innerHTML += '<b>Modulo de datos Interno</b> <input type="checkbox"><br>';
        }
        if (arrayData[11] == 't') {
            document.getElementById('modalLogs').innerHTML += '<b>Modulo Log</b> <input type="checkbox" checked><br>';
        } else {
            document.getElementById('modalLogs').innerHTML += '<b>Modulo Log</b> <input type="checkbox"><br>';
        }
    } else {
        document.getElementById('modalLogs').innerHTML += '<hr></div><h4 align="center"> <strong> Usuario Administrador</strong></h4>';
        document.getElementById('modalLogs').innerHTML += '<b>Administrador </b><input type="checkbox" >';
    }
    $('b').css('margin-left', '10%');
}

function ModificarElementos() {
    let valoresCheck = [];

    $("input[type=checkbox]").each(function (a, b) {
        valoresCheck.push(b.checked);
    });
    console.log(arrayData);
    console.log(valoresCheck);

    console.log()
    let datas = new FormData();
    for (let i = 0; i < valoresCheck.length; i++) {
        datas.append('data' + i, JSON.stringify(valoresCheck));
        console.log(valoresCheck[i]);
    }
    datas.append('datos', JSON.stringify(valoresCheck));
    console.log(datas, JSON.stringify(valoresCheck));

    var request = new XMLHttpRequest();
    request.open("POST", 'modificar/modificarElementos.php?id_usu=' + arrayData[16] + '&id_ele=' + arrayData[17]);
    request.send(datas);

    swal("Exito", "Cambio Realizado!", "success");
    setInterval(() => {
        window.location = '../interfaz/elementos.php';
    }, 1500);


    console.log(request);
    valoresCheck = null;
    arrayData = [];
}

function preguntar(id) {
    swal({
        title: "Deseas Realizar este Cambio?",
        text: "Modificaras las Opciones para este usuario!",
        icon: "info",
        buttons: true,
        successMode: true
    }).then((willDelete) => {
        if (willDelete) {
            this.ModificarElementos();
        } else {
            swal("No se realizó Ningún Cambio.");
        }
    });
    // if (eliminar) {
    //     this.ModificarElementos();
    //     //Redireccionamos si das a aceptar
    //     //window.location.href = "modificar/modificarElementos.php?id_usu=" + arrayData[16] + '&id_ele=' + arrayData[17]; //página web a la que te redirecciona si confirmas la eliminación

    // }
}