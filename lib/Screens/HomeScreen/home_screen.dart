import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:silver/Providers/providers.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends ConsumerState<HomeScreen> {
  int currentPageIndex = 0;
  String appBarTitle = 'Home';

  @override
  Widget build(BuildContext context) {
    final isDark = ref.watch(themeProvider).isDark;
    final colorList = ref.watch(colorListProvider);

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
          actions: [
            IconButton(
              icon: Icon(isDark
                  ? Icons.dark_mode_outlined
                  : Icons.light_mode_outlined),
              onPressed: () {
                ref.read(themeProvider.notifier).changeDarkMode();
              },
            ),
            PopupMenuButton<int>(
                icon: const Icon(Icons.color_lens_outlined),
                onSelected: (index) {
                  ref.read(themeProvider.notifier).changeColors(index);
                },
                itemBuilder: (BuildContext context) {
                  return colorList.asMap().entries.map((entry) {
                    final index = entry.key;
                    final color = entry.value;
                    return PopupMenuItem<int>(
                      value: index,
                      child: ListTile(
                        leading: Icon(Icons.circle, color: color),
                      ),
                    );
                  }).toList();
                })
          ]),
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
