import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:silver/domain/entities/enterprise_entity/enterprise_entity.dart';
import 'package:silver/providers/enterprise/enterprise_providers.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final enterpiseGet = ref.watch(getEnterprisesProvider);

    final colors = Theme.of(context).colorScheme;
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: ListView(children: [
          Column(
            children: [
              Container(
                  height: 160,
                  alignment: Alignment.topLeft,
                  decoration: BoxDecoration(
                    color: colors.primary,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Bienvenido!',
                            style: TextStyle(
                                fontSize: 45, color: colors.onSecondary),
                          ),
                          Text(
                            '¿Qué tareas deseas realizar?',
                            style: TextStyle(
                                fontSize: 18, color: colors.onSecondary),
                          ),
                          Text(
                            'Aquí tienes un resumen',
                            style: TextStyle(
                                fontSize: 18, color: colors.onSecondary),
                          ),
                        ]),
                  )),
              const SizedBox(
                height: 20,
              ),
              Container(
                  height: 400,
                  alignment: Alignment.topLeft,
                  decoration: BoxDecoration(
                    color: colors.primary,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Ultimos viajes',
                            style: TextStyle(
                                fontSize: 30, color: colors.onSecondary),
                          ),
                          Column(
                            children: [
                              Card(
                                  color: colors.surfaceVariant,
                                  elevation: 100,
                                  child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          10, 5, 10, 10),
                                      child: Column(
                                        children: [
                                          Align(
                                            alignment: Alignment.topRight,
                                            child: IconButton(
                                              icon: const Icon(
                                                  Icons.more_vert_outlined),
                                              onPressed: () {},
                                            ),
                                          ),
                                          Align(
                                            alignment: Alignment.bottomLeft,
                                            child: Text(' - Filled'),
                                          )
                                        ],
                                      )))
                            ],
                          )
                        ]),
                  )),
            ],
          ),
        ]),
      ),
    );
  }
}
