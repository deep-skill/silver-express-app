import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:silver/Routes/app_routes.dart';

class TypeUser extends ConsumerWidget {
  final String selectedItem;

  const TypeUser({super.key, required this.selectedItem});

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tipos De Usuarios'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 75.0),
        child: Column(
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 45, vertical: 23)),
              onPressed: () {
                ref.read(appRouterProvider).go('/clientes');
              },
              child: const Row(
                children: [Icon(Icons.person_pin), Text('Clientes')],
              ),
            ),
            const SizedBox(height: 45.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 45, vertical: 23)),
              onPressed: () {
                ref.read(appRouterProvider).go('/conductores');
              },
              child: const Row(
                children: [Icon(Icons.drive_eta_sharp), Text('Conductores')],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
