import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:wvsu_iuis_v2/features/router.dart';
import 'package:wvsu_iuis_v2/features/theme.dart';
import 'package:wvsu_iuis_v2/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initLocalStorage();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.windows);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'WVSU - Integrated University Information System v2',
      theme: ThemeData(
        colorScheme: const ColorScheme.light(
          primary: GlobalColor.brand,
          secondary: GlobalColor.accentOne,
          surface: GlobalColor.shadeLight,
          surfaceDim: GlobalColor.gray,
          onSurface: GlobalColor.shadeDark
        ),
        useMaterial3: true,
      ),
      routerConfig: router(),
    );
  }
}
