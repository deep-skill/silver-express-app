import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:silver/config/routes/app_routes.dart';
import 'package:silver/domain/entities/user_entity/user_entity.dart';
import 'package:silver/providers/users/users_providers.dart';


class DriverScreen extends ConsumerWidget {
  const DriverScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {

    List<DriverEntity> drivers = ref.watch(driverListProvider);
    
    final colors = Theme.of(context).colorScheme;

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

                },
                onLongPress: () {
                  showAlert(context, ref, driver.id);
                },
                title: Text(
                    "Nombre: ${driver.name} - Licencia: ${driver.license}"),
                subtitle: Text(
                    "Número: ${driver.phoneNumber} - Correo: ${driver.email}"),
                leading: CircleAvatar(
                  backgroundColor: colors.secondary,
                  child: Text(driver.name.substring(0, 1), style: const TextStyle(color: Colors.black)),
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: buttonCreate(context, ref, colors),
    );
  }
}

Widget buttonCreate(BuildContext context, ref, colors) {
  return FloatingActionButton(
    onPressed: () {
      ref.read(appRouterProvider).go('/createDriver');
    },
    backgroundColor: colors.primary,
    child: const Icon(Icons.add, color: Colors.black,),
  );
}

void showAlert(BuildContext context, ref, String driverId) {
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
                  // ref.read(selectedDriverIdProvider).state = driverId; TODO
                  ref.read(appRouterProvider).go('/editDriver');
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

