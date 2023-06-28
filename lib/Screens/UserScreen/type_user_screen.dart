import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:silver/Screens/UserScreen/Client/client_screen.dart';

class TypeUser extends StatelessWidget {
  const TypeUser({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final size = MediaQuery.of(context).size;

    return Scaffold(
      
      body: Padding(
        padding: const EdgeInsets.only(top: 75.0),
        child: Column(
            children: [
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(colors.primary),
                    maximumSize: MaterialStateProperty.all(Size(size.width * 0.8, size.height * 10))
                  ),
                  onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const ClientScreen(),
                        ),
                      );
                  },
                  
                  child: Row(
                    children: [
                      const Icon(Icons.person_pin),
                      const SizedBox(width: 15),
                      Text('Clientes', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: colors.onPrimary),)
                    ],
                  ),
                  
                ),
      
                const SizedBox(height: 45.0),
      
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(colors.primary),
                    maximumSize: MaterialStateProperty.all(Size(size.width * 0.8, size.height * 10))
                  ),
                  onPressed: () {
                    context.push('/conductores');
                  },
                  child: Row(
                    children: [
                      const Icon(Icons.drive_eta_sharp),
                      const SizedBox(width: 15),
                      Text('Conductores', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: colors.onPrimary),)
                    ],
                  ),
                ),
            ],
            
          ),
      ),
      );
  }
}