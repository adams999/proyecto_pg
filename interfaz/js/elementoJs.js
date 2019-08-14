console.log('js elemento');
var arrayData = [];

function Mostrar(a) {
    let data = a.split(",");

    for (var i = 0; i < data.length; i++) {
        arrayData[i] = data[i];
    }
    console.log(a, arrayData);
    document.getElementById('modalLogs').innerHTML = '<h3 align="center"><b>Usuario:</b> ' +
        arrayData[12] +
        arrayData[13] + '<br> <b>Cedula: </b>' +
        arrayData[14] + ' </h3><hr><h4 align="center">Menu</h4><div style="margin-left:10%">';
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
        document.getElementById('modalLogs').innerHTML += '<b>Categoria Tracción</b> <input type="checkbox" checked>';
    } else {
        document.getElementById('modalLogs').innerHTML += '<b>Categoria Tracción</b> <input type="checkbox">';
    }

    if (arrayData[15] == 10) {
        document.getElementById('modalLogs').innerHTML += '<hr></div><h4 align="center"> Usuario Administrador</h4>';
        document.getElementById('modalLogs').innerHTML += '<b>Administrador </b><input type="checkbox" checked>';
        document.getElementById('modalLogs').innerHTML += '<hr><h4 align="center"> Administrar</h4><div style="margin-left:10%">';
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
        document.getElementById('modalLogs').innerHTML += '<hr></div><h4 align="center"> Usuario Administrador</h4>';
        document.getElementById('modalLogs').innerHTML += '<b>Administrador </b><input type="checkbox" >';
    }
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

    alert('Modificación Exitosa');
    window.location = '../interfaz/elementos.php';

    console.log(request);
    valoresCheck = null;
    arrayData = [];
}

function preguntar(id) {
    eliminar = confirm("Deseas Modificar los Elementos para la Visualización de este Usuario?");
    if (eliminar) {
        this.ModificarElementos();
        //Redireccionamos si das a aceptar
        //window.location.href = "modificar/modificarElementos.php?id_usu=" + arrayData[16] + '&id_ele=' + arrayData[17]; //página web a la que te redirecciona si confirmas la eliminación

    }
}