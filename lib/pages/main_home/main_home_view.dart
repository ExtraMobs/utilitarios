import 'package:extramobs_utilitarios/pages/main_home/main_home_viewmodel.dart';
import 'package:extramobs_utilitarios/pattern/generator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainHomeView extends StatelessWidget {
  const MainHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<MainHomeViewModel>(
        builder:
            (BuildContext context, MainHomeViewModel viewModel, Widget? child) {
              return Column(
                children: [
                  Column(
                    children: [
                      Container(
                        height: 50,
                        padding: const EdgeInsets.all(5.0),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey.shade300,
                            width: 1.0,
                          ),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(12),
                          ),
                        ),
                        child: const Center(child: Text('Conteúdo principal.')),
                      ),
                    ),
                  ),
                ],
              );
            },
      ),
    );
  }
}