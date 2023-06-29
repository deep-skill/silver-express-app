import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../Routes/app_routes.dart';

class ClientCreate extends ConsumerWidget {
  const ClientCreate({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Registrar Nuevo Cliente'),
      ),
      body: Container(child: body(context, screenSize, ref)),
    );
  }
}

Widget body(BuildContext context, Size screenSize, ref) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Expanded(
        child: Column(
          children: [
            containerView(context),
            Padding(
              padding: const EdgeInsets.only(left: 80.0),
              child: Row(
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: const Color.fromARGB(255, 4, 94, 249),
                        backgroundColor:
                            const Color.fromARGB(255, 96, 126, 179),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 45, vertical: 23),
                      ),
                      onPressed: () {
                        context.go('/clientes');
                      },
                      child: const Text('Volver',
                          style: TextStyle(fontSize: 17, color: Colors.white))),
                  const SizedBox(width: 40.0),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: const Color.fromARGB(255, 4, 94, 249),
                        backgroundColor:
                            const Color.fromARGB(255, 96, 126, 179),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 45, vertical: 23),
                      ),
                      onPressed: () {
                        ref.read(appRouterProvider).pop();
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

Widget containerView(context) {
  return Padding(
    padding: const EdgeInsets.only(top: 50.0, bottom: 60.0),
    child: Column(
      children: [
        const Center(
            child: Text(
          'Formulario De Registro',
          style: TextStyle(fontSize: 30.0),
        )),
        const SizedBox(height: 25.0),
        emailInput(),
        const SizedBox(height: 25),
        userInput(),
        const SizedBox(height: 25),
        enterpriselInput(),
        const SizedBox(height: 25.0),
        phoneInput(),
        const SizedBox(height: 25),
        adressInput(),
      ],
    ),
  );
}

Widget emailInput() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
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

Widget userInput() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
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

Widget enterpriselInput() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
    child: DropdownButtonFormField<String>(
      decoration: const InputDecoration(
          // hintText: 'Seleccione a la empresa que pertenece el cliente',
          fillColor: Color.fromARGB(255, 83, 79, 79),
          filled: true,
          border: OutlineInputBorder(),
          labelText: 'Seleccionar Empresa',
          labelStyle: TextStyle(color: Color.fromARGB(255, 255, 255, 255))),
      items: const [
        DropdownMenuItem(
          value: "B'MOBILE",
          child: Text("B'MOBILE"),
        ),
        DropdownMenuItem(
          value: "TMS",
          child: Text("TMS"),
        ),
        DropdownMenuItem(
          value: "LIMA EXPRESA",
          child: Text("LIMA EXPRESA"),
        ),
        DropdownMenuItem(
          value: "OI-GMEC",
          child: Text("OI-GMEC"),
        ),
        DropdownMenuItem(
          value: "Persona Natural",
          child: Text("Persona Natural"),
        ),
      ],
      onChanged: (value) {
        print('Seleccionaste: $value');
      },
    ),
  );
}

Widget phoneInput() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
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

Widget adressInput() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
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
