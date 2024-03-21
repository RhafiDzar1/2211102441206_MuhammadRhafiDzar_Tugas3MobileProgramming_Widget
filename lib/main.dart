import 'package:e_commerce_interface/ui/dashboard.dart';
import 'package:e_commerce_interface/ui/search.dart';
import 'package:e_commerce_interface/ui/list.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Commerce App',
      initialRoute: '/', // Atur rute awal jika diperlukan
      routes: {
        '/': (context) => const Dashboard(), // Rute untuk halaman utama
        '/search': (context) => const SearchPage(), // Rute untuk halaman pencarian
        '/list': (context) => const ShowAllProductsPage(),
      },
    );
  }
}
