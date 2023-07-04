import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:silver/Routes/app_routes.dart';
import 'package:silver/Screens/UserScreen/Driver/driver_screen.dart';

class DriverCreate extends ConsumerWidget {
  const DriverCreate({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          title: const Text('Registrar Nuevo Conductor'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              context.go('/clients');
            },
          )
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
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController licenseController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  return Padding(
    padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
    child: Column(
      children: [
        const Center(
            child: Text(
          'Formulario De Registro',
          style: TextStyle(fontSize: 30.0),
        )),
        const SizedBox(height: 15.0),
        emailInput(emailController),
        const SizedBox(height: 15),
        userInput(nameController),
        const SizedBox(height: 15),
        poneInput(phoneController),
        const SizedBox(height: 15),
        licenseInput(licenseController),
        const SizedBox(height: 15),
        adressInput(addressController),
        const SizedBox(height: 15),
        buttons(context, ref, emailController, nameController, phoneController, licenseController, addressController)
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
          hintText: 'Ingrese el correo electronico del conductor',
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
          hintText: 'Ingrese el nombre del conductor',
          fillColor: Color.fromARGB(255, 83, 79, 79),
          filled: true,
          border: OutlineInputBorder(),
          labelText: 'Nombre',
          labelStyle: TextStyle(color: Color.fromARGB(255, 255, 255, 255))),
    ),
  );
}

Widget poneInput(phoneController) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
    child: TextField(
      controller: phoneController,
      decoration: const InputDecoration(
          hintText: 'Ingrese el numero telefonico del conductor',
          fillColor: Color.fromARGB(255, 83, 79, 79),
          filled: true,
          border: OutlineInputBorder(),
          labelText: 'Numero',
          labelStyle: TextStyle(color: Color.fromARGB(255, 255, 255, 255))),
    ),
  );
}

Widget licenseInput(licenseController) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
    child: TextField(
      controller: licenseController,
      decoration: const InputDecoration(
          hintText: 'Ingrese el numero de licencia del conductor',
          fillColor: Color.fromARGB(255, 83, 79, 79),
          filled: true,
          border: OutlineInputBorder(),
          labelText: 'Licencia',
          labelStyle: TextStyle(color: Color.fromARGB(255, 255, 255, 255))),
    ),
  );
}

Widget adressInput(addressController) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
    child: TextField(
      controller: addressController,
      decoration: const InputDecoration(
          hintText: 'Ingrese la direccion del conductor',
          fillColor: Color.fromARGB(255, 83, 79, 79),
          filled: true,
          border: OutlineInputBorder(),
          labelText: 'Direccion',
          labelStyle: TextStyle(color: Color.fromARGB(255, 255, 255, 255))),
    ),
  );
}

Widget buttons(BuildContext context, ref, emailController, nameController, phoneController, licenseController, addressController) {
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
              context.go('/drivers');
            },
            
            child: const Text('Volver', style: TextStyle(fontSize: 17, color: Colors.white))
        ),
          
          const SizedBox(width: 40.0),

        ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: const Color.fromARGB(255, 4, 94, 249),
              backgroundColor: const Color.fromARGB(255, 96, 126, 179),
              padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 23),
            ),
            onPressed: () {
              showAlert(context, ref, emailController, nameController, phoneController, licenseController, addressController);
            },
            child: const Text('Registrar',style: TextStyle(fontSize: 17, color: Colors.white))
        ),
      ],
    ),
  );
}

void showAlert(BuildContext context, ref, emailController, nameController, phoneController, licenseController, addressController){
  showDialog(
    barrierDismissible: false,
    context: context, 
    builder: (BuildContext context) { 
      return AlertDialog(
        title: const Text('Registrar'),
        content: const Text('¿Estas Seguro Que Deseas Registrar Este Conductor?', style: TextStyle(fontSize: 17),),
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
              final newDriver = Driver(
                email: emailController.text,
                name: nameController.text,
                license: licenseController.text,
                phoneNumber: phoneController.text,
                address: addressController.text,
              );

              ref.read(driverListProvider).add(newDriver);

              // ref.read(appRouterProvider).pop();
              ref.read(appRouterProvider).go('/conductores');
            },
          ),
        ],
      );
    },
  );
}