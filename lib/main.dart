import 'package:e_quran_simple_flutter/providers/DaftarSuratProvider.dart';
import 'package:e_quran_simple_flutter/views/Homepage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<DaftarSuratProvider>(
            create: (context) => DaftarSuratProvider())
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Equran",
        home: Homepage(),
      ),
    );
  }
}
