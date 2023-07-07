import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:silver/config/routes/app_routes.dart';
import 'package:silver/domain/entities/user_entity/user_entity.dart';
import 'package:silver/providers/users/users_providers.dart';

final TextEditingController emailController1 = TextEditingController();
final TextEditingController nameController2 = TextEditingController();
final TextEditingController phoneController2 = TextEditingController();
final TextEditingController licenseController2 = TextEditingController();
final TextEditingController addressController2 = TextEditingController();

class TripCreate extends ConsumerWidget {
  const TripCreate({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) { 

    return Scaffold(
      appBar: AppBar(
        title: const Text('Registrar Nueva Reserva'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.go('/trips');
          },
        )),

      body: _Body(),
    );
  }
}


class _Body extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Column(
            children: [
              _ContainerView(),
            ],
          ),
        ),
      ],
    );
  }
}

class _ContainerView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
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
          _EmailInput(),
          const SizedBox(height: 15),
          _UserInput(),
          const SizedBox(height: 15),
          _PhoneInput(),
          const SizedBox(height: 15),
          _LicenseInput(),
          const SizedBox(height: 15),
          _AdressInput(),
          const SizedBox(height: 15),
          _Buttons()
        ],
      ),
    );
  }
}

class _EmailInput extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
      child: TextField(
        controller: emailController1,
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
}

class _UserInput extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: TextField(
        controller: nameController2,
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
}

class _PhoneInput extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: TextField(
        controller: phoneController2,
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
}

class _LicenseInput extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: TextField(
        controller: licenseController2,
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
}

class _AdressInput extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: TextField(
        controller: addressController2,
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
}

class _Buttons extends ConsumerWidget {

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    final colors = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: colors.secondary,
                backgroundColor: colors.primary,
                padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 23),
              ),
              onPressed: () {
                context.go('/trips');
              },
              child: const Text('Volver',
                  style: TextStyle(fontSize: 17, color: Colors.white))),
          const SizedBox(width: 40.0),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: colors.secondary,
                backgroundColor: colors.primary,
                padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 23),
              ),
              onPressed: () {
                showAlert2(context, ref, emailController1, nameController2,
                phoneController2, licenseController2, addressController2);
              },
              child: const Text('Registrar',
                  style: TextStyle(fontSize: 17, color: Colors.white))),
        ],
      ),
    );
  }
}

void showAlert2(BuildContext context, ref, emailController, nameController,
    phoneController, licenseController, addressController) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Registrar'),
        content: const Text(
          '¿Estas Seguro Que Deseas Registrar Este Conductor?',
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
            onPressed: () {
              final newDriver = DriverEntity(
                id: '',
                email: emailController.text,
                name: nameController.text,
                license: licenseController.text,
                phoneNumber: phoneController.text,
                address: addressController.text,
              );

              ref.read(driverListProvider).add(newDriver);

              // ref.read(appRouterProvider).pop();
              ref.read(appRouterProvider).go('/trips');
            },
          ),
        ],
      );
    },
  );
}
