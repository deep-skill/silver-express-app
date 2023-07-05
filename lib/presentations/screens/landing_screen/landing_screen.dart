import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:go_router/go_router.dart';

class LandingScreen extends StatelessWidget {
  final Future<void> Function()? login;

  const LandingScreen({Key? key, this.login}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [colors.primary, Colors.black45]),
          ),
          child: Column(
            children: [
              ClipPath(
                clipper: OvalBottomBorderClipper(),
                child: Container(
                    color: Colors.white,
                    height: MediaQuery.of(context).size.height * 0.4,
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
                              child: Text(
                                'Solicite su Servicio de Taxi con nosotros',
                                style: TextStyle(
                                  color: colors.onPrimary,
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
                      backgroundColor:
                          MaterialStatePropertyAll(colors.secondary)),
                  onPressed: () => context.go('/home'),
                  child: Text(
                    'Entrar',
                    style: TextStyle(color: colors.background, fontSize: 20),
                  )),
              const SizedBox(
                height: 15,
              ),
              ElevatedButton(
                  style: ButtonStyle(
                      fixedSize: MaterialStateProperty.all(const Size(270, 50)),
                      backgroundColor: MaterialStatePropertyAll(
                          colors.secondary)),
                  onPressed: () => login!(),
                  child: Text(
                    'Comenzemos el Viaje',
                    style: TextStyle(color: colors.background, fontSize: 20),
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
