import 'package:extramobs_utilitarios/pages/main_home/main_home_viewmodel.dart';
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
              WidgetsBinding.instance.addPostFrameCallback((timestamp) {});

              return Column(
                children: [
                  Column(children: [Tabs()]),
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
                        child: (viewModel.tabs.isEmpty)
                            ? Center(
                                child: ShortcutLines(
                                  shortcuts: [
                                    Shortcut(
                                      keys: ["CTRL", "K"],
                                      label: "Para escolher uma ferramenta",
                                    ),
                                  ],
                                ),
                              )
                            : null,
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

class ShortcutLines extends StatelessWidget {
  const ShortcutLines({super.key, required this.shortcuts});

  final List<Shortcut> shortcuts;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: shortcuts,
    );
  }
}

class Shortcut extends StatelessWidget {
  const Shortcut({super.key, required this.keys, required this.label});

  final List<String> keys;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      spacing: 20,

      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 2.5,
          children: [
            for (final (int index, String key) in keys.indexed) ...[
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade400),
                  borderRadius: const BorderRadius.all(Radius.circular(3)),
                  color: Colors.grey.shade100,
                ),
                padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
                child: Text(
                  key,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 10.5, fontWeight: FontWeight.bold),
                ),
              ),
              if (index < keys.length - 1) Text("+"),
            ],
          ],
        ),
        Text(label),
      ],
    );
  }
}

class Tabs extends StatelessWidget {
  const Tabs({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MainHomeViewModel>(
      builder:
          (BuildContext context, MainHomeViewModel viewModel, Widget? child) {
            return Container(
              height: 50,
              padding: const EdgeInsets.all(5.0),
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: viewModel.tabs.length,
                itemBuilder: (context, index) {
                  return viewModel.tabs[index];
                },
                separatorBuilder: (context, index) => Padding(
                  padding: EdgeInsetsGeometry.symmetric(horizontal: 3),
                  child: VerticalDivider(
                    width: 1,
                    thickness: 1,
                    indent: 5,
                    endIndent: 5,
                    color: Colors.grey.shade200,
                  ),
                ),
              ),
            );
          },
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
