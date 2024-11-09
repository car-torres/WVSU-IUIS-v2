import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:wvsu_iuis_v2/features/router.dart';
=======
import 'package:wvsu_iuis_v2/features/enrollment_page.dart';
>>>>>>> Enrollment_Hallares

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Sign Up',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: router(),
    );
  }
}
=======
    return MaterialApp(
      home: const EnrollmentPage(),
    );
  }
}
>>>>>>> Enrollment_Hallares
