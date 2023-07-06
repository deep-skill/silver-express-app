// // ignore_for_file: dead_code

// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:silver/config/routes/app_routes.dart';

// class AlertActions extends ConsumerWidget {
//   const AlertActions({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
    
//     var userState = true;

//     return AlertDialog(
//         title: const Text('Actions', textAlign: TextAlign.center),
//         content: const Text(
//           '¿Cuál acción desea realizar?',
//           style: TextStyle(fontSize: 17),
//         ),
//         actionsPadding: const EdgeInsets.fromLTRB(24, 0, 24, 20),
//         buttonPadding: EdgeInsets.zero,
//         actions: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               TextButton(
//                 child: const Icon(Icons.arrow_back_ios_new),
//                 onPressed: () {
//                   ref.read(appRouterProvider).pop();
//                 },
//               ),
//               const SizedBox(width: 35),
//               TextButton(
//                 child: const Icon(Icons.edit),
//                 onPressed: () {
//                   // Acción al presionar el botón de editar
//                 },
//               ),
//               const SizedBox(width: 35),
//               TextButton(
//                 child: userState
//                     ? const Icon(Icons.block)
//                     : const Icon(Icons.check),
//                 onPressed: () {
//                   // Acción al presionar el botón de bloquear o desbloquear
//                 },
//               ),
//             ],
//           ),
//         ],
//       );
//   }
// }

// // _showAlert(context, ref, userState) {
// //   var userState = false;

// //   showDialog(
// //     barrierDismissible: false,
// //     context: context,
// //     builder: (BuildContext context) {
      
// //     },
// //   );
// // }