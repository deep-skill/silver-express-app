import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:silver/Routes/app_routes.dart';

class DriverScreen extends ConsumerWidget {
  const DriverScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => ref.read(appRouterProvider).go('/home'),
          ),
          title: const Text('Gestion De Conductores'),
        ),
        body: Container(
          child: body(context, screenSize, ref),
        ));
  }
}

Widget body(BuildContext context, screenSize, ref) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Expanded(
        child: Column(
          children: [
            Expanded(child: containerView()),
            const SizedBox(height: 25.0),
            Padding(
                padding: const EdgeInsets.only(bottom: 26.0, right: 25.0),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: buttonCreate(context, ref),
                )),
          ],
        ),
      ),
    ],
  );
}

Widget containerView() {
  return const Flexible(
    flex: 3,
    child: SizedBox(
      child: Center(
        child: (Text(
          'Contenido de la vista Gestion De Conductores',
          style: TextStyle(fontSize: 24),
        )),
      ),
    ),
  );
}

Widget buttonCreate(BuildContext context, ref) {
  return FloatingActionButton(
    onPressed: () {
      ref.read(appRouterProvider).go('/crearConductores');
    },
    backgroundColor: Colors.blueAccent,
    child: const Icon(Icons.add),
  );
}
