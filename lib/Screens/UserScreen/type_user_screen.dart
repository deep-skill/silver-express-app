import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TypeUser extends StatelessWidget {
  final String selectedItem;

  const TypeUser({super.key, required this.selectedItem});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tipos De Usuarios'),
      ),
      
      body: Padding(
        padding: const EdgeInsets.only(top: 75.0),
        child: Column(
            children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blueAccent,
                    padding: EdgeInsets.symmetric(horizontal: 45, vertical: 23)
                  ),
                    onPressed: () {
                    context.go('/clientes');
                  },
                  child: const Row(
                    children: [
                      Icon(Icons.person_pin),
                      Text('Clientes')
                    ],
                  ),
                  
                ),
      
                SizedBox(height: 45.0),
      
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blueAccent,
                    padding: EdgeInsets.symmetric(horizontal: 45, vertical: 23)
                  ),
                  onPressed: () {
                    context.go('/conductores');
                  },
                  child: const Row(
                    children: [
                      Icon(Icons.drive_eta_sharp),
                      Text('Conductores')
                    ],
                  ),
                ),
            ],
            
          ),
      ),
      );
  }
}