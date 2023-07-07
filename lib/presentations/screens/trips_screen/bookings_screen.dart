import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:silver/config/routes/app_routes.dart';

class BookingItem {
  final int bookingId;
  final int enterpriseFK;
  final String reserveDate;
  final String tripDate;
  final String tripType;
  final String address;
  final String finalAddress;

  const BookingItem({required this.bookingId, required this.enterpriseFK, required this.reserveDate, required this.tripDate, required this.tripType, required this.address, required this.finalAddress});
  //constructor
}
 final bookingItems = <BookingItem>[
  const BookingItem(
    bookingId: 512623,
    enterpriseFK: 13,
    reserveDate: '2023/04/22, 13:20 UTC',
    tripDate: '2023/05/22, 09:30 UTC',
    tripType: 'Courier',
    address: 'Salamanca 2739',
    finalAddress: 'Benito Juarez 193',
  ),
  const BookingItem(
    bookingId: 124976,
    enterpriseFK: 5,
    reserveDate: '2023/04/30, 21:40 UTC',
    tripDate: '2023/05/1, 14:15 UTC',
    tripType: 'Punto a punto',
    address: 'Carmen 3849',
    finalAddress: 'Zaraban 1098',
  ),
  const BookingItem(
    bookingId: 126864,
    enterpriseFK: 7,
    reserveDate: '2023/05/13, 08:25 UTC',
    tripDate: '2023/05/14, 17:00 UTC',
    tripType: 'Por hora',
    address: 'Glausten 934',
    finalAddress: 'Nigeria 2674',
  ),
  const BookingItem(
    bookingId: 948503,
    enterpriseFK: 11,
    reserveDate: '2023/05/21, 10:40 UTC',
    tripDate: '2023/05/23, 08:10 UTC',
    tripType: 'Punto a punto',
    address: 'Sarema 36',
    finalAddress: 'Pedernera 3847',
  ),
  const BookingItem(
    bookingId: 365922,
    enterpriseFK: 4,
    reserveDate: '2023/05/27, 17:35 UTC',
    tripDate: '2023/05/28, 07:30 UTC',
    tripType: 'Por hora',
    address: 'Gualeguay 394',
    finalAddress: 'Marren 984',
  ),
];

class Bookings extends ConsumerWidget {
  final String selectedItem;

  const Bookings({super.key, required this.selectedItem});

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gestión de reservas'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => ref.read(appRouterProvider).go('/home'),
        ),
      ),
      body: const BookingsView(),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // FloatingActionButton(
          //   onPressed: () {},
          //   child: const Icon(Icons.search),
          // ),
          const SizedBox(
            height: 10,
          ),
          FloatingActionButton(
            onPressed: () {},
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}

class BookingsView extends StatelessWidget {
  const BookingsView({super.key});

  @override
  Widget build(BuildContext context) {
    bookingItems;
    return ListView.builder(
        itemCount: bookingItems.length,
        itemBuilder: (context, index) {
          final item = bookingItems[index];
          return _CustomListTile(item: item);
        });
  }
}

class _CustomListTile extends StatelessWidget {
  const _CustomListTile({
    required this.item,
  });

  final BookingItem item;

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return ListTile(
      leading: const Icon(
        Icons.account_circle_outlined,
      ),
      title: Row(
        children: [
          Icon(Icons.info, color: colors.primary,),
          const SizedBox(width: 15),
          Text('${item.bookingId}'),
        ],
      ),
      subtitle: Column(
        children: [
          const SizedBox(height: 5),
          Row(
            children: [
              Icon(Icons.business_outlined, color: colors.primary,),
              const SizedBox(
                width: 15,
              ),
              Text('${item.enterpriseFK}'),
            ],
          ),
          Row(
            children: [
              Icon(Icons.date_range, color: colors.primary,),
              const SizedBox(
                width: 15,
              ),
              Column(
                children: [
                  Text('Reserva: ${item.reserveDate}'),
                  Text('Viaje: ${item.tripDate}'),
                ],
              )
            ],
          ),
          const SizedBox(height: 5),
          Row(
            
            children: [
              Icon(Icons.mode_of_travel_outlined, color: colors.primary,),
              const SizedBox(
                width: 15,
              ),
              Column(
                children: [
                  Text('Partida: ${item.address}'),
                  Text('Final: ${item.finalAddress}'),
                ],
              )
            ],
          ),
        const Divider(),
        ],
      ),
      
      onTap: () {},
      
      trailing: const Icon(
        Icons.more_vert,
      ),
    );
  }
}
