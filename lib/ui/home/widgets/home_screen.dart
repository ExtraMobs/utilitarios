import 'package:extramobs_utilitarios/ui/home/widgets/tabs.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: const TabDisplayHandler());
  }
}
