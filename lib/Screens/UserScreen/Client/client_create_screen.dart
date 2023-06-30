import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:silver/Screens/UserScreen/Client/client_screen.dart';

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
    padding: const EdgeInsets.only(top: 50.0, bottom: 60.0),
    child: Column(
      children: [
        const Center(
            child: Text(
          'Formulario De Registro',
          style: TextStyle(fontSize: 30.0),
        )),
        const SizedBox(height: 25),
        emailInput(emailController),
        const SizedBox(height: 25),
        userInput(nameController),
        const SizedBox(height: 25),
        enterpriselInput(enterpriseController),
        const SizedBox(height: 25),
        phoneInput(phoneController),
        const SizedBox(height: 25),
        addressInput(addressController),
        const SizedBox(height: 50),
        buttons(context, ref, emailController, nameController, enterpriseController, phoneController, addressController)
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
          hintText: 'Ingrese el correo electronico del cliente',
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
          hintText: 'Ingrese el nombre del cliente',
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
        labelText: 'Seleccionar Empresa',
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
          hintText: 'Ingrese el numero telefonico del cliente',
          fillColor: Color.fromARGB(255, 83, 79, 79),
          filled: true,
          border: OutlineInputBorder(),
          labelText: 'Numero',
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
          hintText: 'Ingrese la direccion del cliente',
          fillColor: Color.fromARGB(255, 83, 79, 79),
          filled: true,
          border: OutlineInputBorder(),
          labelText: 'Direccion',
          labelStyle: TextStyle(color: Color.fromARGB(255, 255, 255, 255))),
    ),
  );
}

Widget buttons(BuildContext context, ref, emailController, nameController, enterpriseController, phoneController, addressController) {
  return Padding(
    padding: const EdgeInsets.only(left: 80.0),
    child: Row(
      children: [
        ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: const Color.fromARGB(255, 4, 94, 249),
              backgroundColor: const Color.fromARGB(255, 96, 126, 179),
              padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 23),
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
              backgroundColor: const Color.fromARGB(255, 96, 126, 179),
              padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 23),
            ),
            onPressed: () {
              showAlert(context, ref, emailController, nameController, enterpriseController, phoneController, addressController);
            },
            child: const Text('Registrar',
                style: TextStyle(fontSize: 17, color: Colors.white))),
      ],
    ),
  );
}

void showAlert(BuildContext context, ref, emailController, nameController, enterpriseController, phoneController, addressController){
  showDialog(
    barrierDismissible: false,
    context: context, 
    builder: (BuildContext context) { 
      return AlertDialog(
        title: const Text('Registrar'),
        content: const Text('¿Estas Seguro Que Deseas Registrar Este Cliente?', style: TextStyle(fontSize: 17),),
        actions: [
          TextButton(
            child: const Text('Cancelar'),
            onPressed: (){
              ref.read(appRouterProvider).pop();
            },
          ),

          TextButton(
            child: const Text('Confirmar'),
            onPressed: () {
              final newClient = Client(
                email: emailController.text,
                name: nameController.text,
                enterprise: enterpriseController.text,
                phoneNumber: phoneController.text,
                address: addressController.text,
              );

              ref.read(clientListProvider).add(newClient);

              // ref.read(appRouterProvider).pop();
              ref.read(appRouterProvider).go('/clientes');
            },
          ),
        ],
      );
    },
  );
}