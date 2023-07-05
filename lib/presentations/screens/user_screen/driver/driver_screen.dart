import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:silver/config/routes/app_routes.dart';

class DriverScreen extends ConsumerWidget {
  const DriverScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    List<Driver> drivers = ref.watch(driverListProvider);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => ref.read(appRouterProvider).go('/home'),
        ),
        title: const Text('Gestion De Conductores'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 30, bottom: 50),
        child: ListView.builder(
          itemCount: drivers.length,
          itemBuilder: (BuildContext context, int index) {
            final driver = drivers[index];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
              child: ListTile(
                onTap: () {
                  // Acción al hacer clic en un cliente
                },
                onLongPress: () {
                  showAlert(context, ref);
                },
                title: Text(
                    "Nombre: ${driver.name} - Licencia: ${driver.license}"),
                subtitle: Text(
                    "Número: ${driver.phoneNumber} - Correo: ${driver.email}"),
                leading: CircleAvatar(
                  backgroundColor: const Color.fromRGBO(103, 58, 183, 1),
                  child: Text(driver.name.substring(0, 1)),
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: buttonCreate(context, ref),
    );
  }
}

Widget buttonCreate(BuildContext context, ref) {
  return FloatingActionButton(
    onPressed: () {
      ref.read(appRouterProvider).go('/createDriver');
    },
    backgroundColor: const Color.fromRGBO(0, 150, 136, 1),
    child: const Icon(Icons.add),
  );
}

class Driver {
  final String email;
  final String name;
  final String license;
  final String phoneNumber;
  final String address;

  Driver(
      {required this.email,
      required this.name,
      required this.license,
      required this.phoneNumber,
      required this.address});
}

final driverListProvider = Provider<List<Driver>>((ref) {
  List<Driver> drivers = [
    Driver(
        email: 'Isaac@gmail.com',
        name: 'Isaac',
        license: '13806765123',
        phoneNumber: '1465632',
        address: 'Cra 40 #13'),
    Driver(
        email: 'Martin@gmail.com',
        name: 'Martin',
        license: '48205482573 ',
        phoneNumber: '1456455',
        address: 'Cll 51b #94'),
    Driver(
        email: 'Roque@gmail.com',
        name: 'Roque',
        license: '57380000964 ',
        phoneNumber: '4563678',
        address: 'Cra 14a #104'),
    Driver(
        email: 'Bruno@gmail.com',
        name: 'Bruno',
        license: '58205461635 ',
        phoneNumber: '3234413',
        address: 'Cll 45 #12b'),
    Driver(
        email: 'Isaac@gmail.com',
        name: 'Isaac',
        license: '28162625004 ',
        phoneNumber: '1465632',
        address: 'Cra 40 #13'),
    Driver(
        email: 'Martin@gmail.com',
        name: 'Martin',
        license: '15325835517 ',
        phoneNumber: '1456455',
        address: 'Cll 51b #94'),
    Driver(
        email: 'Roque@gmail.com',
        name: 'Roque',
        license: '76885129427 ',
        phoneNumber: '4563678',
        address: 'Cra 14a #104'),
    Driver(
        email: 'Bruno@gmail.com',
        name: 'Bruno',
        license: '92268960088 ',
        phoneNumber: '3234413',
        address: 'Cll 45 #12b'),
    Driver(
        email: 'Isaac@gmail.com',
        name: 'Isaac',
        license: '94375976385 ',
        phoneNumber: '1465632',
        address: 'Cra 40 #13'),
    Driver(
        email: 'Martin@gmail.com',
        name: 'Martin',
        license: '39944944113 ',
        phoneNumber: '1456455',
        address: 'Cll 51b #94'),
    Driver(
        email: 'Roque@gmail.com',
        name: 'Roque',
        license: '39944944113 ',
        phoneNumber: '4563678',
        address: 'Cra 14a #104'),
    Driver(
        email: 'Bruno@gmail.com',
        name: 'Bruno',
        license: '13806765123',
        phoneNumber: '3234413',
        address: 'Cll 45 #12b'),
  ];
  return drivers;
});

void showAlert(BuildContext context, ref) {
  var userState = true;

  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Acciones', textAlign: TextAlign.center),
        content: const Text(
          'Indica La Accion Que Desees Realizar',
          style: TextStyle(fontSize: 17),
        ),
        actionsPadding: const EdgeInsets.fromLTRB(24, 0, 24, 20),
        buttonPadding: EdgeInsets.zero,
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                child: const Icon(Icons.arrow_back_ios_new),
                onPressed: () {
                  ref.read(appRouterProvider).pop();
                },
              ),
              const SizedBox(width: 35),
              TextButton(
                child: const Icon(Icons.edit),
                onPressed: () {
                  // Acción al presionar el botón de editar
                },
              ),
              const SizedBox(width: 35),
              TextButton(
                // ignore: dead_code
                child: userState
                    ? const Icon(Icons.block)
                    // ignore: dead_code
                    : const Icon(Icons.check),
                onPressed: () {
                  // Acción al presionar el botón de bloquear o desbloquear
                },
              ),
            ],
          ),
        ],
      );
    },
  );
}
