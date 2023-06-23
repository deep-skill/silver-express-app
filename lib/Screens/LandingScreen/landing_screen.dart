import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class LandingScreen extends StatelessWidget {
  final Future<void> Function()? login;

  const LandingScreen({Key? key, required this.login}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Color.fromARGB(233, 353, 452, 342), Colors.black45]),
          ),
          child: Column(
            children: [
              ClipPath(
                clipper: OvalBottomBorderClipper(),
                child: Container(
                    color: Colors.white,
                    height: MediaQuery.of(context).size.height * 0.5,
                    child: Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width *
                                  0.8, // Ajusta el valor según sea necesario
                              child: const Text(
                                'Solicite su Servicio de Taxi con nosotros',
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 40,
                                  fontFamily: 'Pacifico',
                                ),
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.visible,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )),
              ),
              const SizedBox(
                height: 50,
              ),
              ElevatedButton(
                  style: ButtonStyle(
                      fixedSize: MaterialStateProperty.all(const Size(270, 50)),
                      backgroundColor: const MaterialStatePropertyAll(
                          Color.fromARGB(255, 0, 104, 24))),
                  onPressed: () => login!(),
                  child: const Text(
                    'Comenzemos el Viaje',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  )),
              const SizedBox(
                height: 70,
              ),
              const Text(
                '¿Quieres Trabajar con nosotros?',
                style: TextStyle(
                    color: Colors.white, fontSize: 20, fontFamily: 'OneDay'),
              ),
              const SizedBox(height: 15),
              const Text(
                'CONTACTANOS',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    fontFamily: 'OneDay'),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      // Acción al presionar el botón de WhatsApp
                      // Abre el enlace correspondiente
                    },
                    icon: const Icon(
                      FontAwesome.whatsapp,
                      size: 30,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      // Acción al presionar el botón de Facebook
                      // Abre el enlace correspondiente
                    },
                    icon: const Icon(
                      FontAwesome.facebook,
                      size: 30,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      // Acción al presionar el botón de Gmail
                      // Abre el enlace correspondiente
                    },
                    icon: const Icon(
                      FontAwesome.google,
                      size: 30,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
