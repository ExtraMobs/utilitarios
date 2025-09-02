import 'package:extramobs_utilitarios/pages/pacientes_duplicados/pacientes_duplicados_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CEOMed: Ferramentas internas',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.greenAccent),
      ),
      home: PacientesDuplicados(),
    );
  }
}
