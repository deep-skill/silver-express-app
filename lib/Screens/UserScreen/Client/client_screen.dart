import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:silver/Routes/app_routes.dart';

import '../../../Providers/Users/users_providers.dart';
import '../../../domain/entities/UserEntity/user_entity.dart';

class ClientScreen extends ConsumerWidget {
  const ClientScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usersGet = ref.watch(getUsersProvider);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => ref.read(appRouterProvider).go('/home'),
        ),
        title: const Text('Gestion de Clientes'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 30, bottom: 50),
        child: usersGet.when(
          data: (users) {
            if (users.isEmpty) {
              return const Center(
                child: Text('No hay usuarios disponibles'),
              );
            } else {
              return ListView.builder(
                itemCount: users.length,
                itemBuilder: (BuildContext context, int index) {
                  final UserEntity user = users[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 25),
                    child: ListTile(
                      onTap: () {
                        // Acción al hacer clic en un usuario
                      },
                      onLongPress: () {
                        showAlert(context, ref);
                      },
                      title: Text(
                          "Nombre: ${user.name} - Empresa: ACA IRIA LA EMPRESA CON LA RELACION"),
                      subtitle:
                          Text("Número: ${user.phone} - Correo: ${user.email}"),
                      leading: CircleAvatar(
                        backgroundColor: const Color.fromRGBO(103, 58, 183, 1),
                        child: Text(user.name.substring(0, 1)),
                      ),
                    ),
                  );
                },
              );
            }
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stackTrace) => Center(child: Text('Error: $error')),
        ),
      ),
      floatingActionButton: buttonCreate(context, ref),
    );
  }
}

Widget buttonCreate(BuildContext context, ref) {
  return FloatingActionButton(
    onPressed: () {
      ref.read(appRouterProvider).go('/createClient');
    },
    backgroundColor: const Color.fromRGBO(0, 150, 136, 1),
    child: const Icon(Icons.add),
  );
}

void showAlert(BuildContext context, ref) {
  var userState = false;

  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Actions', textAlign: TextAlign.center),
        content: const Text(
          '¿Cuál acción desea realizar?',
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
                    // ignore: dead_code
                    ? const Icon(Icons.block)
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
