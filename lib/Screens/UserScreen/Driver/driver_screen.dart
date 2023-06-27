import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class DriverScreen extends StatelessWidget {
  const DriverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gestion De Conductores'),
      ),

      body: Container(
        child: body(context, screenSize),
      )
    );
  }
}

Widget body(BuildContext context, screenSize){
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,

    children: [

      Expanded(
        child: Column(
          children: [

            Expanded(
              child: Container_View()
            ),

            SizedBox(height: 25.0),

            Padding(
                padding: const EdgeInsets.only(bottom: 26.0, right: 25.0),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: buttonCreate(context),
                )
              ),
          ],
        ),
      ),
          
    ],
  );
}

Widget Container_View(){
  return const Flexible(
    flex: 3,
    child: SizedBox(
      child: Center(
        child: (Text('Contenido de la vista Gestion De Conductores', style: TextStyle(fontSize: 24),)),
      ),
    ),
  );
}

Widget buttonCreate(BuildContext context) {
  return FloatingActionButton(
    onPressed: () {
      context.go('/crearConductores');
    },
    child: Icon(Icons.add),
    backgroundColor: Colors.blueAccent,
  );
}