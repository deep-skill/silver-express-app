import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:silver/config/routes/app_routes.dart';

class TripOReservation extends ConsumerWidget {
  final String selectedItem;

  const TripOReservation({super.key, required this.selectedItem});

  @override
  Widget build(BuildContext context, ref) {
    
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: colors.primary,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 45, vertical: 23)),
              onPressed: () {
                ref.read(appRouterProvider).go('');
              },
              child: const Row(
                children: [
                  Icon(
                    Icons.list_alt_outlined,
                    size: 32,
                    color: Colors.black,
                  ),
                  SizedBox(width: 25),
                  Text(
                    'Reservas',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.black),
                  )
                ],
              ),
            ),
            const SizedBox(height: 45.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: colors.primary,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 45, vertical: 23)),
              onPressed: () {
                ref.read(appRouterProvider).go('/trips');
              },
              child: const Row(
                children: [
                  Icon(Icons.location_on, size: 32, color: Colors.black),
                  SizedBox(width: 25),
                  Text(
                    'Viajes',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.black),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
