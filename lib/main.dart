import 'package:extramobs_utilitarios/pages/main_home/main_home_view.dart';
import 'package:extramobs_utilitarios/pages/main_home/main_home_viewmodel.dart';
import 'package:extramobs_utilitarios/pattern/theme.dart';
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
      create: (context) => MainHomeViewModel(),
      child: MaterialApp(
        title: 'Utilitários',
        theme: AppTheme.lightTheme,
        home: MainHomeView(),
      ),
    );
  }
}
