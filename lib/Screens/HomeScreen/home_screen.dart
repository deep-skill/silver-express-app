import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentPageIndex = 0;
  String appBarTitle = 'Home';

  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (currentPageIndex) {
      case 0:
        page = const Text('Vista 0');
        setState(() {
          appBarTitle = 'Home';
        });
        break;
      case 1:
        page = const Text('vista 1');
        setState(() {
          appBarTitle = 'Usuarios';
        });
        break;
      case 2:
        page = const Text('vista 2');
        setState(() {
          appBarTitle = 'Viajes';
        });
        break;
      case 3:
        page = const Text('vista 3');
        setState(() {
          appBarTitle = 'Empresas';
        });
        break;
      default:
        throw UnimplementedError('no widget for $currentPageIndex');
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      bottomNavigationBar: NavigationBar(
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        selectedIndex: currentPageIndex,
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home, size: 35),
            icon: Icon(Icons.home_outlined, size: 25),
            label: 'Home',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.supervisor_account, size: 35),
            icon: Icon(Icons.supervisor_account_outlined, size: 25),
            label: 'Usuarios',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.directions_car, size: 35),
            icon: Icon(Icons.directions_car_outlined, size: 25),
            label: 'Viajes',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.business, size: 35),
            icon: Icon(Icons.business_outlined, size: 25),
            label: 'Empresas',
          ),
        ],
      ),
      body: Center(
        child: page,
      ),
    );
  }
}