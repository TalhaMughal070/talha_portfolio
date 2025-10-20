import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talha_portfolio/firebase_options.dart';
import 'package:talha_portfolio/providers/contact_provider.dart';
import 'package:talha_portfolio/views/my_portfolio/my_portfolio.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ContactProvider()),
      ],

      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: MyPortfolio(),
      ),
    );
  }
}
