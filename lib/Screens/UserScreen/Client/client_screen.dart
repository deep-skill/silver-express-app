import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:silver/Routes/app_routes.dart';

class ClientScreen extends ConsumerWidget {
  const ClientScreen({super.key});
  
  @override
  Widget build(BuildContext context, ref) {
    final screenSize = MediaQuery.of(context).size;

    List<Client> clients = ref.watch(clientListProvider);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => ref.read(appRouterProvider).go('/home'),
        ),
        title: const Text('Gestion De Clientes'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 30, bottom: 50),
        child: ListView.builder(
          itemCount: clients.length,
          itemBuilder: (BuildContext context, int index) { 
            final client = clients[index];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
              child: ListTile(
                onTap: () {
                  // Acción al hacer clic en un cliente
                },
                onLongPress: () {
                  showAlert(context, ref);
                },
                title: Text("Nombre: ${client.name} - Empresa: ${client.enterprise}"),
                subtitle: Text("Número: ${client.phoneNumber} - Correo: ${client.email}"),
                leading: CircleAvatar(
                  child: Text(client.name.substring(0,1)),
                  backgroundColor: const Color.fromRGBO(103, 58, 183, 1),
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

class Client {
  final String email;
  final String name;
  final String enterprise;
  final String phoneNumber;
  final String address;

  Client({required this.email, required this.name, required this.enterprise, required this.phoneNumber, required this.address});
}

final clientListProvider = Provider<List<Client>>((ref) {
  List<Client> clients = [
    Client(email: 'Isaac@gmail.com', name: 'Isaac', enterprise: 'TMS', phoneNumber: '1465632', address: 'Cra 40 #13'),
    Client(email: 'Martin@gmail.com', name: 'Martin', enterprise: 'LIMA EXPRESA', phoneNumber: '1456455', address: 'Cll 51b #94'),
    Client(email: 'Roque@gmail.com', name: 'Roque', enterprise: 'IO-GMEC', phoneNumber: '4563678', address: 'Cra 14a #104'),
    Client(email: 'Bruno@gmail.com', name: 'Bruno', enterprise: "B'MOBILE", phoneNumber: '3234413', address: 'Cll 45 #12b'),
    Client(email: 'Isaac@gmail.com', name: 'Isaac', enterprise: 'TMS', phoneNumber: '1465632', address: 'Cra 40 #13'),
    Client(email: 'Martin@gmail.com', name: 'Martin', enterprise: 'LIMA EXPRESA', phoneNumber: '1456455', address: 'Cll 51b #94'),
    Client(email: 'Roque@gmail.com', name: 'Roque', enterprise: 'IO-GMEC', phoneNumber: '4563678', address: 'Cra 14a #104'),
    Client(email: 'Bruno@gmail.com', name: 'Bruno', enterprise: "B'MOBILE", phoneNumber: '3234413', address: 'Cll 45 #12b'),
    Client(email: 'Isaac@gmail.com', name: 'Isaac', enterprise: 'TMS', phoneNumber: '1465632', address: 'Cra 40 #13'),
    Client(email: 'Martin@gmail.com', name: 'Martin', enterprise: 'LIMA EXPRESA', phoneNumber: '1456455', address: 'Cll 51b #94'),
    Client(email: 'Roque@gmail.com', name:  'Roque', enterprise: 'IO-GMEC', phoneNumber: '4563678', address: 'Cra 14a #104'),
    Client(email: 'Bruno@gmail.com', name: 'Bruno', enterprise: "B'MOBILE", phoneNumber: '3234413', address: 'Cll 45 #12b'),
  ];
  return clients;
});

Widget buttonCreate(BuildContext context, ref) {
  return FloatingActionButton(
    onPressed: () {
      ref.read(appRouterProvider).go('/crearClientes'); 
    },
    backgroundColor: const Color.fromRGBO(0, 150, 136, 1),
    child: const Icon(Icons.add),
  );
}

void showAlert(BuildContext context, ref) {
  var state = true;

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
        actionsPadding: EdgeInsets.fromLTRB(24, 0, 24, 20),
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
                child: state ? const Icon(Icons.block) : Icon(Icons.check),
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
