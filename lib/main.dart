import 'package:extramobs_utilitarios/ui/core/themes.dart';
import 'package:extramobs_utilitarios/ui/home/view_model/view_model_home.dart';
import 'package:extramobs_utilitarios/ui/home/widgets/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ViewModelHome(),
      child: MaterialApp(
        title: 'Utilitários',
        theme: AppTheme.lightTheme,
        home: HomeScreen(),
      ),
    );
  }
}
