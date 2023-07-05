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
          title: const Text('Crear nuevo cliente'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              context.go('/clients');
            },
          )),
      body: Container(
        child: body(context, screenSize, ref),
      ),
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
            containerView(context, ref),
          ],
        ),
      ),
    ],
  );
}

Widget containerView(context, ref) {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController enterpriseController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  return Padding(
    padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
    child: Column(
      children: [
        const Center(
            child: Text(
          'Formulario de registro',
          style: TextStyle(fontSize: 30.0),
        )),
        const SizedBox(height: 15),
        emailInput(emailController),
        const SizedBox(height: 15),
        userInput(nameController),
        const SizedBox(height: 15),
        enterpriselInput(enterpriseController),
        const SizedBox(height: 15),
        phoneInput(phoneController),
        const SizedBox(height: 15),
        addressInput(addressController),
        const SizedBox(height: 15),
        buttons(context, ref, emailController, nameController,
            enterpriseController, phoneController, addressController)
      ],
    ),
  );
}

Widget emailInput(emailController) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
    child: TextField(
      controller: emailController,
      decoration: const InputDecoration(
          hintText: 'Inserte email del cliente',
          fillColor: Color.fromARGB(255, 83, 79, 79),
          filled: true,
          border: OutlineInputBorder(),
          labelText: 'Correo Electronico',
          labelStyle: TextStyle(color: Color.fromARGB(255, 255, 255, 255))),
    ),
  );
}

Widget userInput(nameController) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
    child: TextField(
      controller: nameController,
      decoration: const InputDecoration(
          hintText: 'Ingrese nombre del cliente',
          fillColor: Color.fromARGB(255, 83, 79, 79),
          filled: true,
          border: OutlineInputBorder(),
          labelText: 'Nombre',
          labelStyle: TextStyle(color: Color.fromARGB(255, 255, 255, 255))),
    ),
  );
}

Widget enterpriselInput(enterpriseController) {
  String? selectedValue;

  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
    child: DropdownButtonFormField<String>(
      decoration: const InputDecoration(
        fillColor: Color.fromARGB(255, 83, 79, 79),
        filled: true,
        border: OutlineInputBorder(),
        labelText: 'Seleccione empresa',
        labelStyle: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
      ),
      value: selectedValue,
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
        selectedValue = value;
        enterpriseController.text = value;
      },
    ),
  );
}

Widget phoneInput(phoneController) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
    child: TextField(
      controller: phoneController,
      decoration: const InputDecoration(
          hintText: 'Ingrese el teléfono del cliente',
          fillColor: Color.fromARGB(255, 83, 79, 79),
          filled: true,
          border: OutlineInputBorder(),
          labelText: 'Telefono',
          labelStyle: TextStyle(color: Color.fromARGB(255, 255, 255, 255))),
    ),
  );
}

Widget addressInput(addressController) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
    child: TextField(
      controller: addressController,
      decoration: const InputDecoration(
          hintText: 'Ingrese la dirección del cliente',
          fillColor: Color.fromARGB(255, 83, 79, 79),
          filled: true,
          border: OutlineInputBorder(),
          labelText: 'Dirección',
          labelStyle: TextStyle(color: Color.fromARGB(255, 255, 255, 255))),
    ),
  );
}

Widget buttons(BuildContext context, ref, emailController, nameController,
    enterpriseController, phoneController, addressController) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 5),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: const Color.fromARGB(255, 4, 94, 249),
              backgroundColor: const Color.fromARGB(255, 96, 126, 179),
              padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 23),
            ),
            onPressed: () {
              context.go('/clients');
            },
            child: const Text('Volver',
                style: TextStyle(fontSize: 17, color: Colors.white))),
        const SizedBox(width: 40.0),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: const Color.fromARGB(255, 4, 94, 249),
              backgroundColor: const Color.fromARGB(255, 96, 126, 179),
              padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 23),
            ),
            onPressed: () {
              showAlert(context, ref, emailController, nameController,
                  enterpriseController, phoneController, addressController);
            },
            child: const Text('Registrar',
                style: TextStyle(fontSize: 17, color: Colors.white))),
      ],
    ),
  );
}

void showAlert(BuildContext context, ref, emailController, nameController,
    enterpriseController, phoneController, addressController) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Registrar'),
        content: const Text(
          'Confirmar la creación del cliente',
          style: TextStyle(fontSize: 17),
        ),
        actions: [
          TextButton(
            child: const Text('Cancelar'),
            onPressed: () {
              ref.read(appRouterProvider).pop();
            },
          ),
          TextButton(
            child: const Text('Confirmar'),
            onPressed: () {},
          ),
        ],
      );
    },
  );
}
