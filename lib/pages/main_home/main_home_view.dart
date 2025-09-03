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
              WidgetsBinding.instance.addPostFrameCallback((timestamp) {
                if (viewModel.tabs.isEmpty) {
                  for (int i = 0; i < 5; i++) {
                    // Para testes
                    String strText = List<String>.generate(
                      100,
                      (_) => randomHexChar(),
                    ).join('');

                    viewModel.addTab(
                      DefaultTab(
                        tip: strText,
                        child: Text(
                          strText,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    );
                  }
                }
              });

              return Column(
                children: [
                  Column(
                    children: [
                      Container(
                        height: 50,
                        padding: const EdgeInsets.all(5.0),
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: viewModel.tabs.length,
                          itemBuilder: (context, index) {
                            return viewModel.tabs[index];
                          },
                          separatorBuilder: (context, index) => Padding(
                            padding: EdgeInsetsGeometry.symmetric(
                              horizontal: 3,
                            ),
                            child: VerticalDivider(
                              width: 1,
                              thickness: 1,
                              indent: 5,
                              endIndent: 5,
                              color: Colors.grey.shade200,
                            ),
                          ),
                        ),
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

class DefaultTab extends StatelessWidget {
  const DefaultTab({super.key, this.child, this.tip = ''});

  final Widget? child;
  final String tip;

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<MainHomeViewModel>();

    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
        padding: EdgeInsets.only(left: 10),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        alignment: Alignment.centerLeft,
      ),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 250),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Tooltip(
                message: tip,
                child: (child != null) ? child! : const SizedBox(),
              ),
            ),

            IconButton(
              icon: Icon(Icons.close),
              iconSize: 15,
              onPressed: () => {viewModel.removeTab(this)},
            ),
          ],
        ),
      ),
    );
  }
}
