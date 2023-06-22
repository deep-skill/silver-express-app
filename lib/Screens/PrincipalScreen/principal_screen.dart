import 'package:flutter/material.dart';
import 'package:silver_express_app/Widgets/MenuDrawer/drawer_web.dart';

import '../../Widgets/MenuDrawer/drawer_mobile.dart';

class PrincipalScreen extends StatelessWidget {
  const PrincipalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Principal'),
      ),
      drawer: screenSize.width > 919
          ? null
          : const MobilMenu(selectedItem: 'Principal'),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (screenSize.width > 919) ...[
            const Flexible(
              flex: 1,
              child: WebMenu(
                selectedItem: 'Principal',
              ),
            ),
          ],
          const Flexible(
            flex: 3,
            child: SizedBox(
              child: Center(
                child: Text(
                  'Contenido de la vista principal',
                  style: TextStyle(fontSize: 24),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
