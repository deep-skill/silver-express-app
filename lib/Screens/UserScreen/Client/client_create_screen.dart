import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ClientCreate extends StatelessWidget {
  const ClientCreate({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Registrar Nuevo Cliente'),
      ),
      body: Container(child: Body(context, screenSize)),
    );
  }
}

Widget Body(BuildContext context, Size screenSize) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Expanded(
        child: Column(
          children: [
            Container_View(context),
            Padding(
              padding: const EdgeInsets.only(left: 80.0),
              child: Row(
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 96, 126, 179),
                        padding:
                            EdgeInsets.symmetric(horizontal: 45, vertical: 23),
                        onPrimary: Color.fromARGB(255, 4, 94, 249),
                      ),
                      onPressed: () {
                        context.pop();
                      },
                      child: const Text('Volver',
                          style: TextStyle(fontSize: 17, color: Colors.white))),
                  SizedBox(width: 40.0),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 96, 126, 179),
                        padding:
                            EdgeInsets.symmetric(horizontal: 45, vertical: 23),
                        onPrimary: Color.fromARGB(255, 4, 94, 249),
                      ),
                      onPressed: () {
                        _showAlert(context);
                      },
                      child: const Text('Registrar',
                          style: TextStyle(fontSize: 17, color: Colors.white))),
                ],
              ),
            )
          ],
        ),
      ),
    ],
  );
}

Widget Container_View(context) {
  return Padding(
    padding: EdgeInsets.only(top: 50.0, bottom: 60.0),
    child: Column(
      children: [
        Center(
            child: Text(
          'Formulario De Registro',
          style: TextStyle(fontSize: 30.0),
        )),
        SizedBox(height: 25.0),
        EmailInput(),
        SizedBox(height: 25),
        UserInput(),
        SizedBox(height: 25),
        EnterpriselInput(),
        SizedBox(height: 25.0),
        PhoneInput(),
        SizedBox(height: 25),
        AdressInput(),
      ],
    ),
  );
}

Widget EmailInput() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
    child: const TextField(
      decoration: InputDecoration(
          hintText: 'Ingrese el correo electronico del cliente',
          fillColor: Color.fromARGB(255, 83, 79, 79),
          filled: true,
          border: OutlineInputBorder(),
          labelText: 'Correo Electronico',
          labelStyle: TextStyle(color: Color.fromARGB(255, 255, 255, 255))),
    ),
  );
}

Widget UserInput() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
    child: const TextField(
      decoration: InputDecoration(
          hintText: 'Ingrese el nombre del cliente',
          fillColor: Color.fromARGB(255, 83, 79, 79),
          filled: true,
          border: OutlineInputBorder(),
          labelText: 'Nombre',
          labelStyle: TextStyle(color: Color.fromARGB(255, 255, 255, 255))),
    ),
  );
}

Widget EnterpriselInput() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
    child: DropdownButtonFormField<String>(
      decoration: InputDecoration(
          // hintText: 'Seleccione a la empresa que pertenece el cliente',
          fillColor: Color.fromARGB(255, 83, 79, 79),
          filled: true,
          border: OutlineInputBorder(),
          labelText: 'Seleccionar Empresa',
          labelStyle: TextStyle(color: Color.fromARGB(255, 255, 255, 255))),
      items: [
        DropdownMenuItem(
          child: Text("B'MOBILE"),
          value: "B'MOBILE",
        ),
        DropdownMenuItem(
          child: Text("TMS"),
          value: "TMS",
        ),
        DropdownMenuItem(
          child: Text("LIMA EXPRESA"),
          value: "LIMA EXPRESA",
        ),
        DropdownMenuItem(
          child: Text("OI-GMEC"),
          value: "OI-GMEC",
        ),
        DropdownMenuItem(
          child: Text("Persona Natural"),
          value: "Persona Natural",
        ),
      ],
      onChanged: (value) {
        print('Seleccionaste: $value');
      },
    ),
  );
}

Widget PhoneInput() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
    child: const TextField(
      decoration: InputDecoration(
          hintText: 'Ingrese el numero telefonico del cliente',
          fillColor: Color.fromARGB(255, 83, 79, 79),
          filled: true,
          border: OutlineInputBorder(),
          labelText: 'Numero',
          labelStyle: TextStyle(color: Color.fromARGB(255, 255, 255, 255))),
    ),
  );
}

Widget AdressInput() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
    child: const TextField(
      decoration: InputDecoration(
          hintText: 'Ingrese la direccion del cliente',
          fillColor: Color.fromARGB(255, 83, 79, 79),
          filled: true,
          border: OutlineInputBorder(),
          labelText: 'Direccion',
          labelStyle: TextStyle(color: Color.fromARGB(255, 255, 255, 255))),
    ),
  );
}

void _showAlert(BuildContext context) {
  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Registrar'),
          content:
              const Text('¿Estas Seguro Que Desea Registrar Este Cliente?'),
          actions: [
            TextButton(
              onPressed: () {
                context.pop();
              },
              child: const Text('Volver'),
            ),
            TextButton(
              onPressed: () {
                context.push('/clientes');
              },
              child: const Text('Confirmar'),
            ),
          ],
        );
      });
}
