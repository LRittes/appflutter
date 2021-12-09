import 'package:ativ4/app.dart';
import 'package:flutter/material.dart';

main() {
  runApp(const App());
}

// import 'package:shared_preferences/shared_preferences.dart';

// main() {
//   runApp(const App());
// }
// class App extends StatelessWidget {
//   const App({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: SharePref(),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }

// class SharePref extends StatelessWidget {
//   SharedPreferences? sharedPreferences;
//   SharePref() {
//     SharedPreferences.getInstance().then((value) => sharedPreferences = value);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Shared Preference'),
//         centerTitle: true,
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Center(
//             child: ElevatedButton(
//               child: const Text('Salvar dados'),
//               onPressed: () {
//                 sharedPreferences!.setString('nome', 'Leando');
//               },
//             ),
//           ),
//           ElevatedButton(
//             child: const Text('Buscar dados'),
//             onPressed: () {
//               String? value = sharedPreferences!.getString('nome');
//               print(value);
//             },
//           )
//         ],
//       ),
//     );
//   }
// }
