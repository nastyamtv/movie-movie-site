import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:movie_recommendation_app/screens/home_screen.dart';
import 'package:movie_recommendation_app/screens/report_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
    apiKey: "AIzaSyBYZ-Ii8f9DxlpTez2h-_KOiC1LlMQSFPg",
    projectId: "moviefeedapp",
    messagingSenderId: "548119300880",
    appId: "1:548119300880:web:53a9ff2df469169a2c3395",
  ));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      //   useMaterial3: true,
      // ),
      home: const HomePage(),
      routes: {
        Reportbug.id: (context) => Reportbug(),
      },
    );
  }
}
