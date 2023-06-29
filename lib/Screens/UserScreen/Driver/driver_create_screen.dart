import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class DriverCreate extends ConsumerWidget {
  const DriverCreate({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          title: const Text('Registrar Nuevo Conductor'),
        ),
        body: Container(child: body(context, screenSize, ref)));
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
                        context.go('/conductores');
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
                        context.go('/conductores');
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
        poneInput(),
        const SizedBox(height: 25),
        licenseInput(),
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
          hintText: 'Ingrese el correo electronico del conductor',
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
          hintText: 'Ingrese el nombre del conductor',
          fillColor: Color.fromARGB(255, 83, 79, 79),
          filled: true,
          border: OutlineInputBorder(),
          labelText: 'Nombre',
          labelStyle: TextStyle(color: Color.fromARGB(255, 255, 255, 255))),
    ),
  );
}

Widget poneInput() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
    child: const TextField(
      decoration: InputDecoration(
          hintText: 'Ingrese el numero telefonico del conductor',
          fillColor: Color.fromARGB(255, 83, 79, 79),
          filled: true,
          border: OutlineInputBorder(),
          labelText: 'Numero',
          labelStyle: TextStyle(color: Color.fromARGB(255, 255, 255, 255))),
    ),
  );
}

Widget licenseInput() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
    child: const TextField(
      decoration: InputDecoration(
          hintText: 'Ingrese el numero de licencia del conductor',
          fillColor: Color.fromARGB(255, 83, 79, 79),
          filled: true,
          border: OutlineInputBorder(),
          labelText: 'Licencia',
          labelStyle: TextStyle(color: Color.fromARGB(255, 255, 255, 255))),
    ),
  );
}

Widget adressInput() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
    child: const TextField(
      decoration: InputDecoration(
          hintText: 'Ingrese la direccion del conductor',
          fillColor: Color.fromARGB(255, 83, 79, 79),
          filled: true,
          border: OutlineInputBorder(),
          labelText: 'Direccion',
          labelStyle: TextStyle(color: Color.fromARGB(255, 255, 255, 255))),
    ),
  );
}
