import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:silver/Routes/app_routes.dart';

class TypeUser extends ConsumerWidget {
  final String selectedItem;

  const TypeUser({super.key, required this.selectedItem});

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 77, vertical: 50),
        child: Column(
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromRGBO(73, 10, 84, 1),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 45, vertical: 23)),
              onPressed: () {
                ref.read(appRouterProvider).go('/clientes');
              },
              child: const Row(
                children: [
                  Icon(Icons.person_pin, size: 32, color: Colors.white,), 
                  SizedBox(width: 25), Text('Gestion De Clientes', style: TextStyle(fontSize: 18, color: Color.fromARGB(255, 219, 204, 204)),)
                ],
              ),
            ),
            const SizedBox(height: 45.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromRGBO(73, 10, 84, 1),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 45, vertical: 23)),
              onPressed: () {
                ref.read(appRouterProvider).go('/conductores');
              },
              child: const Row(
                children: [
                  Icon(Icons.drive_eta_sharp, size: 32, color: Colors.white), 
                  SizedBox(width: 25), Text('Gestion De Conductores', style: TextStyle(fontSize: 18, color: Color.fromARGB(255, 221, 212, 212)),)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
