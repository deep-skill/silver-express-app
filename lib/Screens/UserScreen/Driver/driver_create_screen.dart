import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DriverCreate extends StatelessWidget {
  const DriverCreate({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registrar Nuevo Conductor'),
      ),

      body: Container(
        child: body(context, screenSize)
      )
    );
  }
}

Widget body(BuildContext context, Size screenSize){
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,

    children: [


    Expanded(
      child: Column(
        children: [
          Container_View(context),

          Padding(
            padding: const EdgeInsets.only(left: 80.0),
            child: Row(
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 96, 126, 179),
                    padding: EdgeInsets.symmetric(horizontal: 45, vertical: 23),
                    onPrimary: Color.fromARGB(255, 4, 94, 249),
                  ),
                      
                  onPressed: () {
                    context.go('/conductores');
                  },
                  child: const Text('Volver', style: TextStyle(fontSize: 17, color: Colors.white))
                ),

                SizedBox(width: 40.0),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 96, 126, 179),
                    padding: EdgeInsets.symmetric(horizontal: 45, vertical: 23),
                    onPrimary: Color.fromARGB(255, 4, 94, 249),
                  ),
                      
                  onPressed: () {
                    _showAlert(context);
                  },
                  child: const Text('Registrar', style: TextStyle(fontSize: 17, color: Colors.white))
                ),
              ],
            ),
          )
            
          ],
        ),
      ),
          
    ],
  );
}


Widget Container_View(context){
  return Padding(
    padding: EdgeInsets.only(top: 50.0, bottom: 60.0),
    child: Column(
      children: [

        Center(child: Text('Formulario De Registro', style: TextStyle(fontSize: 30.0),)),
        SizedBox(height: 25.0),
        EmailInput(),
        SizedBox(height: 25),
        UserInput(),
        SizedBox(height: 25),
        PhoneInput(),
        SizedBox(height: 25),
        LicenseInput(),
        SizedBox(height: 25),
        AdressInput(),
      ],
    ),
  );
}


Widget EmailInput(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
      child: const TextField(
          decoration: InputDecoration(
            hintText: 'Ingrese el correo electronico del conductor',
            fillColor: Color.fromARGB(255, 83, 79, 79),
            filled: true,
            border: OutlineInputBorder(),
            labelText: 'Correo Electronico',
            labelStyle: TextStyle(color:Color.fromARGB(255, 255, 255, 255))
          ),
      ),
    );
}

Widget UserInput(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: const TextField(
          decoration: InputDecoration(
            hintText: 'Ingrese el nombre del conductor',
            fillColor: Color.fromARGB(255, 83, 79, 79),
            filled: true,
            border: OutlineInputBorder(),
            labelText: 'Nombre',
            labelStyle: TextStyle(color:Color.fromARGB(255, 255, 255, 255))
          ),
      ),
    );
}

Widget PhoneInput(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: const TextField(
          decoration: InputDecoration(
            hintText: 'Ingrese el numero telefonico del conductor',
            fillColor: Color.fromARGB(255, 83, 79, 79),
            filled: true,
            border: OutlineInputBorder(),
            labelText: 'Numero',
            labelStyle: TextStyle(color:Color.fromARGB(255, 255, 255, 255))
          ),
      ),
    );
}

Widget LicenseInput(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: const TextField(
          decoration: InputDecoration(
            hintText: 'Ingrese el numero de licencia del conductor',
            fillColor: Color.fromARGB(255, 83, 79, 79),
            filled: true,
            border: OutlineInputBorder(),
            labelText: 'Licencia',
            labelStyle: TextStyle(color:Color.fromARGB(255, 255, 255, 255))
          ),
      ),
    );
}

Widget AdressInput(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: const TextField(
          decoration: InputDecoration(
            hintText: 'Ingrese la direccion del conductor',
            fillColor: Color.fromARGB(255, 83, 79, 79),
            filled: true,
            border: OutlineInputBorder(),
            labelText: 'Direccion',
            labelStyle: TextStyle(color:Color.fromARGB(255, 255, 255, 255))
          ),
      ),
    );
}

void _showAlert(BuildContext context){
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) { 
      return AlertDialog(
        title: const Text('Registrar'),
        content: const Text('¿Estas Seguro Que Desea Registrar Este Conductor?'),
        actions: [
        TextButton(
          onPressed: () {
            context.pop(context);
          },
          child: const Text('Volver'),
        ),
        TextButton(
          onPressed: () {
            context.go('/conductores');
          },
          child: const Text('Confirmar'),
        ),
      ],
      );
    }
  );
}