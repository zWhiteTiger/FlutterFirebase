import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_database/pages/welcome_page.dart';
import 'package:get/get.dart';
import 'firebase_options.dart';


main() async{
  WidgetsFlutterBinding.ensureInitialized();
  debugPrintRebuildDirtyWidgets = true;
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Hasselblade',
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlueAccent),
            useMaterial3: true
        ),
        home: (WelcomePage())
    );
  }
}