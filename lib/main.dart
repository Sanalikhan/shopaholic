import 'package:flutter/material.dart';
import 'screens/product_list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    const lightPurple = Color(0xFFF3EFFF);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Shopaholic",

      theme: ThemeData(
        useMaterial3: true,

        colorSchemeSeed: Colors.deepPurple,

        scaffoldBackgroundColor: const Color.fromARGB(255, 223, 172, 241),

        appBarTheme: const AppBarTheme(
          backgroundColor: lightPurple,
          elevation: 0,

          iconTheme: IconThemeData(
            color: Colors.deepPurple, // darker cart icon
            size: 26,
          ),

          titleTextStyle: TextStyle(
            color: Color.fromARGB(255, 63, 39, 104),
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      home: const ProductListScreen(),
    );
  }
}