import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app/services/home_page_services.dart';
import 'app/view/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiProvider(providers: [
        ChangeNotifierProvider(create: (_) => HomePageServices()),
      ], child: const MyHomePage()),
    );
  }
}
