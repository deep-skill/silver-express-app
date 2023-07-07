import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TripItem {
  final int tripId;
  final int reserveId;
  final String user;
  final String driver;
  final double total;
  final String dateStart;
  final String dateEnd;
  final String state;
  //constructor
  const TripItem({
    required this.tripId,
    required this.reserveId,
    required this.user,
    required this.driver,
    required this.total,
    required this.dateStart,
    required this.dateEnd,
    required this.state,
  });
}

const tripItems = <TripItem>[
  TripItem(
    tripId: 735292,
    reserveId: 814837272,
    user: 'Juan',
    driver: 'Nahual',
    total: 83.23,
    dateStart: '2023/06/22, 17:40 UTC',
    dateEnd: '2023/06/22, 18:30 UTC',
    state: 'Active',
  ),
  TripItem(
    tripId: 738164,
    reserveId: 898873272,
    user: 'Pedro',
    driver: 'Carmen',
    total: 827.43,
    dateStart: '2023/06/20, 12:00 UTC',
    dateEnd: '2023/06/20, 13:30 UTC',
    state: 'Active',
  ),
  TripItem(
    tripId: 733332,
    reserveId: 814129372,
    user: 'Carlos',
    driver: 'Bruno',
    total: 3.29,
    dateStart: '2023/06/29, 19:30 UTC',
    dateEnd: '2023/06/29, 20:00 UTC',
    state: 'Active',
  ),
  TripItem(
    tripId: 098292,
    reserveId: 658137272,
    user: 'Analía',
    driver: 'Jorge',
    total: 68.33,
    dateStart: '2023/06/30, 07:40 UTC',
    dateEnd: '2023/06/30, 08:30 UTC',
    state: 'Active',
  ),
  TripItem(
    tripId: 986392,
    reserveId: 9875317272,
    user: 'Andrea',
    driver: 'Roberto',
    total: 34.55,
    dateStart: '2023/06/22, 17:40 UTC',
    dateEnd: '2023/06/22, 18:30 UTC',
    state: 'Active',
  ),
];

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).colorScheme;
    final screenSize = MediaQuery.of(context).size;
    const trips = tripItems;

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
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            'Ultimos viajes',
                            style: TextStyle(
                                fontSize: 30, color: colors.onSecondary),
                          ),
                          Column(
                            children: [
                              SizedBox(
                                height: 70,
                                width: screenSize.width * 0.8,
                                child: Card(
                                  color: colors.surfaceVariant,
                                  child: Column(
                                    children: [
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        children: [
                                          const SizedBox(width: 10),
                                          const Icon(Icons.info),
                                          const SizedBox(width: 5),
                                          Text(
                                              'Id: ${trips[0].tripId.toString()}'),
                                          const SizedBox(width: 10),
                                          const SizedBox(width: 5),
                                          const Icon(Icons.account_circle),
                                          Text(
                                              'Conductor: ${trips[0].driver.toString()}'),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const SizedBox(width: 10),
                                          const Icon(Icons.calendar_today),
                                          Text(
                                            'Fecha de inicio: ${trips[0].dateStart.toString()}',
                                            textAlign: TextAlign.left,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 70,
                                width: screenSize.width * 0.8,
                                child: Card(
                                  color: colors.surfaceVariant,
                                  child: Column(
                                    children: [
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        children: [
                                          const SizedBox(width: 10),
                                          const Icon(Icons.info),
                                          const SizedBox(width: 5),
                                          Text(
                                              'Id: ${trips[1].tripId.toString()}'),
                                          const SizedBox(width: 10),
                                          const SizedBox(width: 5),
                                          const Icon(Icons.account_circle),
                                          Text(
                                              'Conductor: ${trips[1].driver.toString()}'),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const SizedBox(width: 10),
                                          const Icon(Icons.calendar_today),
                                          Text(
                                            'Fecha de inicio: ${trips[1].dateStart.toString()}',
                                            textAlign: TextAlign.left,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 70,
                                width: screenSize.width * 0.8,
                                child: Card(
                                  color: colors.surfaceVariant,
                                  child: Column(
                                    children: [
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        children: [
                                          const SizedBox(width: 10),
                                          const Icon(Icons.info),
                                          const SizedBox(width: 5),
                                          Text(
                                              'Id: ${trips[2].tripId.toString()}'),
                                          const SizedBox(width: 10),
                                          const SizedBox(width: 5),
                                          const Icon(Icons.account_circle),
                                          Text(
                                              'Conductor: ${trips[2].driver.toString()}'),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const SizedBox(width: 10),
                                          const Icon(Icons.calendar_today),
                                          Text(
                                            'Fecha de inicio: ${trips[2].dateStart.toString()}',
                                            textAlign: TextAlign.left,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 70,
                                width: screenSize.width * 0.8,
                                child: Card(
                                  color: colors.surfaceVariant,
                                  child: Column(
                                    children: [
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        children: [
                                          const SizedBox(width: 10),
                                          const Icon(Icons.info),
                                          const SizedBox(width: 5),
                                          Text(
                                              'Id: ${trips[3].tripId.toString()}'),
                                          const SizedBox(width: 10),
                                          const SizedBox(width: 5),
                                          const Icon(Icons.account_circle),
                                          Text(
                                              'Conductor: ${trips[3].driver.toString()}'),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const SizedBox(width: 10),
                                          const Icon(Icons.calendar_today),
                                          Text(
                                            'Fecha de inicio: ${trips[3].dateStart.toString()}',
                                            textAlign: TextAlign.left,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
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
