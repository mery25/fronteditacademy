var nota_examen = 4.2

var mensaje = 'Muy bien! Has aprovado el examen con un ' + nota_examen
if (nota_examen < 5) {
    mensaje = 'Ohh has suspendido el examen con un ' + nota_examen
}

alert(mensaje);